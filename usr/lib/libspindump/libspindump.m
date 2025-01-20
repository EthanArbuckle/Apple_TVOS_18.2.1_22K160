uint64_t SPHIDResponseDelayThreshold()
{
  if (SPHIDResponseDelayThresholdMachAbs_onceToken != -1) {
    dispatch_once(&SPHIDResponseDelayThresholdMachAbs_onceToken, &__block_literal_global);
  }
  return SPHIDResponseDelayThresholdMachAbs_thresholdMachAbs;
}

void SPExpectedHIDResponseDelayUntil(unint64_t a1)
{
  uint64_t v2 = mach_absolute_time();
  if (v2 >= a1)
  {
    MachToNano(v2 - a1);
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
    }
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG)) {
      SPExpectedHIDResponseDelayUntil_cold_4();
    }
    goto LABEL_11;
  }

  if ((double)(unint64_t)MachToNano(a1 - v2) / 1000000000.0 <= 2.0)
  {
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
    }
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG)) {
      SPExpectedHIDResponseDelayUntil_cold_2();
    }
LABEL_11:
    if (gExpectedHIDResponseDelayEndMachAbs >= a1)
    {
      if (libspindump_log_onceToken != -1) {
        dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
      }
      if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG)) {
        SPExpectedHIDResponseDelayUntil_cold_1(a1);
      }
    }

    else
    {
      gExpectedHIDResponseDelayEndMachAbs = a1;
    }

    return;
  }

  if (libspindump_log_onceToken != -1) {
    dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
  }
  if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_FAULT)) {
    SPExpectedHIDResponseDelayUntil_cold_3();
  }
}

char *SPPauseMonitoringHIDResponsiveness(const char *a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (!a1) {
    SPPauseMonitoringHIDResponsiveness_cold_1((char **)&v8);
  }
  uint64_t v2 = mach_absolute_time();
  size_t v3 = strlen(a1);
  v4 = (char *)malloc(v3 + 9);
  *(void *)v4 = v2;
  strlcpy(v4 + 8, a1, v3 + 1);
  os_unfair_lock_lock(&gPauseReceiptLock);
  uint64_t v5 = gNumPauseReceipts;
  if (!gNumPauseReceipts) {
    gEarliestPauseMachAbs = v2;
  }
  ++gNumPauseReceipts;
  gPauseReceipts = (uint64_t)realloc((void *)gPauseReceipts, 8LL * ((int)v5 + 1));
  *(void *)(gPauseReceipts + 8 * v5) = v4;
  os_unfair_lock_unlock(&gPauseReceiptLock);
  if (libspindump_log_onceToken != -1) {
    dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
  }
  v6 = (os_log_s *)libspindump_log_logt;
  if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446210;
    v9 = a1;
    _os_log_impl( &dword_187DB0000,  v6,  OS_LOG_TYPE_DEFAULT,  "Pausing HID responsiveness monitoring for %{public}s",  (uint8_t *)&v8,  0xCu);
  }

  return v4;
}

void SPResumeMonitoringHIDResponsiveness(uint64_t *a1)
{
  if (!a1) {
    SPResumeMonitoringHIDResponsiveness_cold_1(&v8);
  }
  uint64_t v2 = mach_absolute_time();
  os_unfair_lock_lock(&gPauseReceiptLock);
  int v3 = gNumPauseReceipts;
  if (gNumPauseReceipts < 1) {
LABEL_6:
  }
    SPResumeMonitoringHIDResponsiveness_cold_5(&v8);
  uint64_t v4 = 0LL;
  size_t v5 = 8LL * (gNumPauseReceipts - 1);
  while (*(uint64_t **)(gPauseReceipts + 8 * v4) != a1)
  {
    ++v4;
    v5 -= 8LL;
    if (gNumPauseReceipts == v4) {
      goto LABEL_6;
    }
  }

  if (gNumPauseReceipts - 1 > (int)v4)
  {
    memmove((void *)(gPauseReceipts + 8 * v4), (const void *)(gPauseReceipts + 8 * v4 + 8), v5);
    int v3 = gNumPauseReceipts;
  }

  gNumPauseReceipts = v3 - 1;
  if (v3 == 1)
  {
    free((void *)gPauseReceipts);
    gPauseReceipts = 0LL;
    if (gEarliestPauseMachAbs == *a1)
    {
      if (libspindump_log_onceToken != -1) {
        dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
      }
      v7 = (os_log_s *)libspindump_log_logt;
      if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG)) {
        SPResumeMonitoringHIDResponsiveness_cold_2(a1, v2, v7);
      }
    }

    else
    {
      if (libspindump_log_onceToken != -1) {
        dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
      }
      if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG)) {
        SPResumeMonitoringHIDResponsiveness_cold_3(a1, v2);
      }
    }

    gTimeMonitoringLastResumed = v2;
  }

  else
  {
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
    }
    v6 = (os_log_s *)libspindump_log_logt;
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG)) {
      SPResumeMonitoringHIDResponsiveness_cold_4(a1, v2, v6);
    }
  }

  os_unfair_lock_unlock(&gPauseReceiptLock);
  free(a1);
}

void SPCheckHIDResponseTime2(unint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v72 = *MEMORY[0x1895F89C0];
  if (SPHIDResponseDelayThresholdMachAbs_onceToken != -1) {
    dispatch_once(&SPHIDResponseDelayThresholdMachAbs_onceToken, &__block_literal_global);
  }
  if (a1 - 1 >= a2)
  {
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
    }
    v11 = (os_log_s *)libspindump_log_logt;
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_FAULT)) {
      SPCheckHIDResponseTime2_cold_6(a1, a2, v11);
    }
    return;
  }

  uint64_t v6 = SPHIDResponseDelayThresholdMachAbs_thresholdMachAbs;
  if (gNumPauseReceipts >= 1)
  {
    os_unfair_lock_lock(&gPauseReceiptLock);
    if (gNumPauseReceipts) {
      SPCheckHIDResponseTime2_cold_5((char **)buf, gNumPauseReceipts);
    }
    os_unfair_lock_unlock(&gPauseReceiptLock);
  }

  uint64_t v7 = a2 - a1;
  BOOL v8 = a2 - a1 >= v6;
  else {
    uint64_t v9 = gExpectedHIDResponseDelayEndMachAbs;
  }
  if (v9 <= a1)
  {
    uint64_t v9 = 0LL;
    goto LABEL_29;
  }

  if (v9 + v6 > a2)
  {
    if (v7 >= v6)
    {
      if (libspindump_log_onceToken != -1) {
        dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
      }
      uint64_t v10 = (os_log_s *)libspindump_log_logt;
      if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134219008;
        double v63 = (double)(unint64_t)MachToNano(a2 - a1) / 1000000000.0;
        __int16 v64 = 2048;
        unint64_t v65 = a1;
        __int16 v66 = 2048;
        unint64_t v67 = a2;
        __int16 v68 = 2048;
        uint64_t v69 = v9;
        __int16 v70 = 2048;
        double v71 = (double)(unint64_t)MachToNano(a2 - v9) / 1000000000.0;
        _os_log_debug_impl( &dword_187DB0000,  v10,  OS_LOG_TYPE_DEBUG,  "Not reporting %.2fs HID response delay %llu-%llu due to expected unresponsiveness until %llu (%.2fs reportable)",  buf,  0x34u);
      }
    }

    goto LABEL_28;
  }

  if (v7 < v6)
  {
LABEL_28:
    BOOL v8 = 0;
    goto LABEL_29;
  }

  if (libspindump_log_onceToken != -1) {
    dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
  }
  v12 = (os_log_s *)libspindump_log_logt;
  if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134219008;
    double v63 = (double)(unint64_t)MachToNano(a2 - a1) / 1000000000.0;
    __int16 v64 = 2048;
    unint64_t v65 = a1;
    __int16 v66 = 2048;
    unint64_t v67 = a2;
    __int16 v68 = 2048;
    uint64_t v69 = v9;
    __int16 v70 = 2048;
    double v71 = (double)(unint64_t)MachToNano(a2 - v9) / 1000000000.0;
    _os_log_debug_impl( &dword_187DB0000,  v12,  OS_LOG_TYPE_DEBUG,  "%.2fs HID response delay %llu-%llu with expected unresponsiveness until %llu still worth reporting (%.2fs reportable)",  buf,  0x34u);
  }

  BOOL v8 = 1;
LABEL_29:
  if (a1 < a3)
  {
    if (v6 + a3 <= a2)
    {
      if (v8)
      {
        if (libspindump_log_onceToken != -1) {
          dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
        }
        v14 = (os_log_s *)libspindump_log_logt;
        if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG))
        {
          double v21 = (double)(unint64_t)MachToNano(a2 - a1) / 1000000000.0;
          uint64_t v22 = MachToNano(a2 - a3);
          *(_DWORD *)buf = 134219008;
          double v63 = v21;
          __int16 v64 = 2048;
          unint64_t v65 = a1;
          __int16 v66 = 2048;
          unint64_t v67 = a2;
          __int16 v68 = 2048;
          uint64_t v69 = a3;
          __int16 v70 = 2048;
          double v71 = (double)(unint64_t)v22 / 1000000000.0;
          _os_log_debug_impl( &dword_187DB0000,  v14,  OS_LOG_TYPE_DEBUG,  "%.2fs HID response delay %llu-%llu out-of-order (latest event %llu) still worth reporting (%.2fs reportable)",  buf,  0x34u);
        }

        BOOL v8 = 1;
      }
    }

    else if (v8)
    {
      if (libspindump_log_onceToken != -1) {
        dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
      }
      v13 = (os_log_s *)libspindump_log_logt;
      if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG))
      {
        double v19 = (double)(unint64_t)MachToNano(a2 - a1) / 1000000000.0;
        uint64_t v20 = MachToNano(a2 - a3);
        *(_DWORD *)buf = 134219008;
        double v63 = v19;
        __int16 v64 = 2048;
        unint64_t v65 = a1;
        __int16 v66 = 2048;
        unint64_t v67 = a2;
        __int16 v68 = 2048;
        uint64_t v69 = a3;
        __int16 v70 = 2048;
        double v71 = (double)(unint64_t)v20 / 1000000000.0;
        _os_log_debug_impl( &dword_187DB0000,  v13,  OS_LOG_TYPE_DEBUG,  "Not reporting %.2fs HID response delay %llu-%llu due to out-of-order HID processing (latest event %llu, %.2fs reportable)",  buf,  0x34u);
      }

      BOOL v8 = 0;
    }

    if (v9 <= a3) {
      uint64_t v9 = a3;
    }
  }

  if (MEMORY[0x18960DAB8])
  {
    if (v9 <= a1) {
      unint64_t v15 = a1;
    }
    else {
      unint64_t v15 = v9;
    }
    if (v15 <= SPCheckHIDResponseTime2_lastTelemetryHIDEventEndTimestamp_MachAbs) {
      unint64_t v15 = SPCheckHIDResponseTime2_lastTelemetryHIDEventEndTimestamp_MachAbs;
    }
    if (SPCheckHIDResponseTime2_lastTelemetryHIDEventEndTimestamp_MachAbs < a2) {
      SPCheckHIDResponseTime2_lastTelemetryHIDEventEndTimestamp_MachAbs = a2;
    }
    unint64_t v16 = a2 - v15;
    if (a2 > v15)
    {
      unint64_t v17 = MachToNano(a2 - v15);
      if (v17 >= 0x2FAF080)
      {
        if (v17 >= 0x5F5E100)
        {
          if (v17 >= 0xEE6B280)
          {
            if (v17 >= 0x1DCD6500)
            {
              if (v17 >= 0x3B9ACA00)
              {
                if (v17 >= 0x77359400)
                {
                  if (v17 >= 0x12A05F200LL)
                  {
                    uint64_t v18 = 7LL;
                    if (v17 >= 0x2540BE400LL) {
                      uint64_t v18 = 8LL;
                    }
                  }

                  else
                  {
                    uint64_t v18 = 6LL;
                  }
                }

                else
                {
                  uint64_t v18 = 5LL;
                }
              }

              else
              {
                uint64_t v18 = 4LL;
              }
            }

            else
            {
              uint64_t v18 = 3LL;
            }
          }

          else
          {
            uint64_t v18 = 2LL;
          }
        }

        else
        {
          uint64_t v18 = 1LL;
        }
      }

      else
      {
        uint64_t v18 = 0LL;
      }

      v23 = (unint64_t *)((char *)&gHIDEventCountBuckets + 8 * v18);
      do
        unint64_t v24 = __ldxr(v23);
      while (__stxr(v24 + 1, v23));
      v25 = (unint64_t *)((char *)&gHIDEventDurationMachAbsBuckets + 8 * v18);
      do
        unint64_t v26 = __ldxr(v25);
      while (__stxr(v26 + v16, v25));
      do
        unint64_t v27 = __ldxr(&gActionCount);
      while (__stxr(v27 + 1, &gActionCount));
      if ((SPAddToHIDTelemetry_telemetryPending & 1) == 0)
      {
        SPAddToHIDTelemetry_telemetryPending = 1;
        dispatch_time_t v28 = dispatch_time(0LL, 10000000000LL);
        dispatch_queue_global_t global_queue = dispatch_get_global_queue(9LL, 0LL);
        dispatch_after(v28, global_queue, &__block_literal_global_38);
      }
    }
  }

  if (v8)
  {
    if (SPCheckHIDResponseTime2_lastReportedHIDEventEndTimestamp_MachAbs > a1)
    {
      if (SPCheckHIDResponseTime2_lastReportedHIDEventEndTimestamp_MachAbs + v6 > a2)
      {
        if (libspindump_log_onceToken != -1) {
          dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
        }
        v30 = (os_log_s *)libspindump_log_logt;
        if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG))
        {
          double v31 = (double)(unint64_t)MachToNano(a2 - a1) / 1000000000.0;
          uint64_t v32 = SPCheckHIDResponseTime2_lastReportedHIDEventEndTimestamp_MachAbs;
          uint64_t v33 = MachToNano(a2 - SPCheckHIDResponseTime2_lastReportedHIDEventEndTimestamp_MachAbs);
          *(_DWORD *)buf = 134219008;
          double v63 = v31;
          __int16 v64 = 2048;
          unint64_t v65 = a1;
          __int16 v66 = 2048;
          unint64_t v67 = a2;
          __int16 v68 = 2048;
          uint64_t v69 = v32;
          __int16 v70 = 2048;
          double v71 = (double)(unint64_t)v33 / 1000000000.0;
          _os_log_debug_impl( &dword_187DB0000,  v30,  OS_LOG_TYPE_DEBUG,  "Not reporting %.2fs HID response delay %llu-%llu due to previously reported HID response delay at %llu (%.2fs reportable)",  buf,  0x34u);
        }

        return;
      }

      if (libspindump_log_onceToken != -1) {
        dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
      }
      v34 = (os_log_s *)libspindump_log_logt;
      if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG))
      {
        double v57 = (double)(unint64_t)MachToNano(a2 - a1) / 1000000000.0;
        uint64_t v58 = SPCheckHIDResponseTime2_lastReportedHIDEventEndTimestamp_MachAbs;
        uint64_t v59 = MachToNano(a2 - SPCheckHIDResponseTime2_lastReportedHIDEventEndTimestamp_MachAbs);
        *(_DWORD *)buf = 134219008;
        double v63 = v57;
        __int16 v64 = 2048;
        unint64_t v65 = a1;
        __int16 v66 = 2048;
        unint64_t v67 = a2;
        __int16 v68 = 2048;
        uint64_t v69 = v58;
        __int16 v70 = 2048;
        double v71 = (double)(unint64_t)v59 / 1000000000.0;
        _os_log_debug_impl( &dword_187DB0000,  v34,  OS_LOG_TYPE_DEBUG,  "%.2fs HID response delay %llu-%llu overlapping previously reported HID response delay at %llu still worth repo rting (%.2fs reportable)",  buf,  0x34u);
      }

      if (v9 <= SPCheckHIDResponseTime2_lastReportedHIDEventEndTimestamp_MachAbs) {
        uint64_t v9 = SPCheckHIDResponseTime2_lastReportedHIDEventEndTimestamp_MachAbs;
      }
    }

    SPCheckHIDResponseTime2_lastReportedHIDEventEndTimestamp_MachAbs = a2;
    if (v9 <= a1)
    {
      if (libspindump_log_onceToken != -1) {
        dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
      }
      uint64_t v41 = libspindump_log_logt;
      if (!os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_INFO)) {
        goto LABEL_100;
      }
      uint64_t v42 = MachToNano(a2 - a1);
      *(_DWORD *)buf = 134218496;
      double v63 = (double)(unint64_t)v42 / 1000000000.0;
      __int16 v64 = 2048;
      unint64_t v65 = a1;
      __int16 v66 = 2048;
      unint64_t v67 = a2;
      v38 = "Reporting %.2fs HID response delay %llu-%llu";
      v39 = (os_log_s *)v41;
      uint32_t v40 = 32;
    }

    else
    {
      if (libspindump_log_onceToken != -1) {
        dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
      }
      uint64_t v35 = libspindump_log_logt;
      if (!os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_INFO)) {
        goto LABEL_100;
      }
      double v36 = (double)(unint64_t)MachToNano(v9 - a1) / 1000000000.0;
      uint64_t v37 = MachToNano(a2 - a1);
      *(_DWORD *)buf = 134219008;
      double v63 = v36;
      __int16 v64 = 2048;
      unint64_t v65 = a1;
      __int16 v66 = 2048;
      unint64_t v67 = a2;
      __int16 v68 = 2048;
      uint64_t v69 = v9;
      __int16 v70 = 2048;
      double v71 = (double)(unint64_t)v37 / 1000000000.0;
      v38 = "Reporting %.2fs HID response delay %llu-%llu with start time capped to %llu (%.2fs original)";
      v39 = (os_log_s *)v35;
      uint32_t v40 = 52;
    }

    _os_log_impl(&dword_187DB0000, v39, OS_LOG_TYPE_INFO, v38, buf, v40);
LABEL_100:
    mach_get_times();
    uint64_t v43 = v60 - v61;
    if (v9 <= a1) {
      unint64_t v44 = a1;
    }
    else {
      unint64_t v44 = v9;
    }
    *(void *)&double v45 = v43 + v44;
    unint64_t v46 = v43 + a2;
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
    }
    v47 = (os_log_s *)libspindump_log_logt;
    if (os_signpost_enabled((os_log_t)libspindump_log_logt))
    {
      *(_DWORD *)buf = 134349312;
      double v63 = v45;
      __int16 v64 = 2050;
      unint64_t v65 = v46;
      _os_signpost_emit_with_name_impl( &dword_187DB0000,  v47,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "SlowHIDResponse",  "%{public, signpost.description:begin_time}llu %{public, signpost.description:end_time}llu",  buf,  0x16u);
    }

    kdebug_trace();
    uint64_t v48 = spindump_connection();
    if (v48)
    {
      v49 = (_xpc_connection_s *)v48;
      xpc_object_t empty = xpc_dictionary_create_empty();
      if (empty)
      {
        v51 = empty;
        xpc_dictionary_set_int64(empty, "message", 8LL);
        xpc_dictionary_set_uint64(v51, "eventtime_machabs", a1);
        if (v9 > a1) {
          xpc_dictionary_set_uint64(v51, "starttime_machabs", v9);
        }
        xpc_dictionary_set_uint64(v51, "endtime_machabs", a2);
        xpc_dictionary_set_uint64(v51, "threshold_machabs", v6);
        *(_DWORD *)buf = 0;
        if (_NSGetExecutablePath(0LL, (uint32_t *)buf))
        {
          if ((*(_DWORD *)buf - 1) >> 30)
          {
            if (libspindump_log_onceToken != -1) {
              dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
            }
            v55 = (os_log_s *)libspindump_log_logt;
            if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR)) {
              SPCheckHIDResponseTime2_cold_4((int *)buf, v55, v56);
            }
          }

          else
          {
            v52 = (char *)malloc(*(unsigned int *)buf);
            if (_NSGetExecutablePath(v52, (uint32_t *)buf))
            {
              if (libspindump_log_onceToken != -1) {
                dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
              }
              v53 = (os_log_s *)libspindump_log_logt;
              if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR)) {
                SPCheckHIDResponseTime2_cold_3((int *)buf, v53, v54);
              }
            }

            else
            {
              xpc_dictionary_set_string(v51, "pname", v52);
            }

            free(v52);
          }
        }

        else
        {
          if (libspindump_log_onceToken != -1) {
            dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
          }
          if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR)) {
            SPCheckHIDResponseTime2_cold_2();
          }
        }

        xpc_connection_send_message(v49, v51);
        xpc_release(v51);
      }

      else
      {
        if (libspindump_log_onceToken != -1) {
          dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
        }
        if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR)) {
          SPCheckHIDResponseTime2_cold_1();
        }
      }
    }
  }
}

uint64_t spindump_connection()
{
  if (spindump_connection_once != -1) {
    dispatch_once(&spindump_connection_once, &__block_literal_global_65);
  }
  if (!spindump_connection_connection)
  {
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
    }
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR)) {
      spindump_connection_cold_1();
    }
  }

  return spindump_connection_connection;
}

void SPReportHIDResponseDelay(unint64_t a1, unint64_t a2)
{
}

void SPGenerateSpindump( unsigned int a1, uint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5, const char *a6, const char *a7, const char *a8, const void *a9)
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  if (libspindump_log_onceToken != -1) {
    dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
  }
  unint64_t v16 = (os_log_s *)libspindump_log_logt;
  if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    double v31 = procname_btd(a1);
    __int16 v32 = 1024;
    unsigned int v33 = a1;
    __int16 v34 = 2080;
    uint64_t v35 = a6;
    _os_log_impl( &dword_187DB0000,  v16,  OS_LOG_TYPE_DEFAULT,  "Requesting spindump to be generated for %{public}s [%d] due to %s",  buf,  0x1Cu);
  }

  uint64_t v17 = spindump_connection();
  if (v17)
  {
    connection = (_xpc_connection_s *)v17;
    xpc_object_t empty = xpc_dictionary_create_empty();
    if (empty)
    {
      double v19 = empty;
      xpc_dictionary_set_int64(empty, "message", 9LL);
      if ((a1 & 0x80000000) == 0) {
        xpc_dictionary_set_int64(v19, "pid", a1);
      }
      if (a2) {
        xpc_dictionary_set_uint64(v19, "tid", a2);
      }
      if (a3) {
        xpc_dictionary_set_double(v19, "duration", (double)a3 / 1000.0);
      }
      if (a4) {
        xpc_dictionary_set_double(v19, "interval", (double)a4 / 1000000.0);
      }
      if (a5) {
        xpc_dictionary_set_uint64(v19, "flags", a5);
      }
      if (a6) {
        xpc_dictionary_set_string(v19, "reason", a6);
      }
      if (a8) {
        xpc_dictionary_set_string(v19, "filename", a8);
      }
      if (a7)
      {
        if (strnlen(a7, 0x100uLL) <= 0xFF)
        {
          xpc_dictionary_set_string(v19, "signature", a7);
          if (a9) {
            goto LABEL_26;
          }
          goto LABEL_36;
        }

        uint64_t v20 = (char *)malloc(0x100uLL);
        __strlcpy_chk();
        xpc_dictionary_set_string(v19, "signature", v20);
        if (v20) {
          free(v20);
        }
      }

      if (a9)
      {
LABEL_26:
        xpc_dictionary_set_BOOL(v19, "callback", 1);
        double v21 = _Block_copy(a9);
        dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
        handler[0] = MEMORY[0x1895F87A8];
        handler[1] = 3221225472LL;
        handler[2] = __SPGenerateSpindump_block_invoke;
        handler[3] = &unk_18A13FAF0;
        handler[4] = v21;
        xpc_connection_send_message_with_reply(connection, v19, global_queue, handler);
LABEL_37:
        xpc_release(v19);
        return;
      }

LABEL_36:
      xpc_connection_send_message(connection, v19);
      goto LABEL_37;
    }

    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
    }
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR)) {
      SPCheckHIDResponseTime2_cold_1();
    }
    int v23 = 12;
    if (a9)
    {
LABEL_34:
      dispatch_queue_global_t v24 = dispatch_get_global_queue(0LL, 0LL);
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __SPGenerateSpindump_block_invoke_2;
      block[3] = &unk_18A13FB18;
      block[4] = a9;
      int v28 = v23;
      dispatch_async(v24, block);
    }
  }

  else
  {
    int v23 = 2;
    if (a9) {
      goto LABEL_34;
    }
  }

_DWORD *procname_btd(int pid)
{
  if (procname_btd_onceToken != -1) {
    dispatch_once(&procname_btd_onceToken, &__block_literal_global_68);
  }
  do
    unsigned int v3 = __ldxr((unsigned int *)&procname_btd_index);
  while (__stxr(v3 + 1, (unsigned int *)&procname_btd_index));
  BOOL v4 = (-v3 & 0x80000000) != 0;
  int v5 = -v3 & 3;
  int v6 = v3 & 3;
  if (!v4) {
    int v6 = -v5;
  }
  uint64_t v2 = (_DWORD *)((char *)&procname_btd_names + 128 * (uint64_t)v6);
  *uint64_t v2 = 0;
  proc_name(pid, v2, 0x80u);
  return v2;
}

void __SPGenerateSpindump_block_invoke(uint64_t a1, void *a2)
{
  if (MEMORY[0x1895B7194](a2) != MEMORY[0x1895F9268] && MEMORY[0x1895B7194](a2) == MEMORY[0x1895F9250])
  {
    xpc_dictionary_get_int64(a2, "errno");
    xpc_dictionary_get_string(a2, "path");
    BOOL v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
  }

  else
  {
    BOOL v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
  }

  v4();
  _Block_release(*(const void **)(a1 + 32));
}

uint64_t __SPGenerateSpindump_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(unsigned int *)(a1 + 40),  0LL);
}

void SPReportCPUUsageResource( int a1, const char *a2, uint64_t a3, uint64_t a4, const char *a5, unint64_t a6, unint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  if (a1 <= 0)
  {
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
    }
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_FAULT)) {
      SPReportCPUUsageResource_cold_1();
    }
  }

  else
  {
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
    }
    double v19 = (os_log_s *)libspindump_log_logt;
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEFAULT))
    {
      if ((a4 & 1) != 0) {
        uint64_t v20 = "fatal ";
      }
      else {
        uint64_t v20 = (const char *)&unk_187DB5B92;
      }
      int v25 = 136447490;
      unint64_t v26 = v20;
      __int16 v27 = 2082;
      int v28 = procname_btd(a1);
      __int16 v29 = 1024;
      int v30 = a1;
      __int16 v31 = 2048;
      uint64_t v32 = a3;
      __int16 v33 = 2048;
      double v34 = (double)a6 / 1000000000.0;
      __int16 v35 = 2048;
      double v36 = (double)a7 / 1000000000.0;
      _os_log_impl( &dword_187DB0000,  v19,  OS_LOG_TYPE_DEFAULT,  "Reporting %{public}scpu usage for %{public}s [%d] thread %#llx using %.0fs cpu over the last %.0f seconds",  (uint8_t *)&v25,  0x3Au);
    }

    uint64_t v21 = spindump_connection();
    if (v21)
    {
      uint64_t v22 = (_xpc_connection_s *)v21;
      xpc_object_t empty = xpc_dictionary_create_empty();
      if (empty)
      {
        dispatch_queue_global_t v24 = empty;
        xpc_dictionary_set_int64(empty, "message", 3LL);
        xpc_dictionary_set_int64(v24, "pid", a1);
        if (a2) {
          xpc_dictionary_set_string(v24, "pname", a2);
        }
        if (a3) {
          xpc_dictionary_set_uint64(v24, "tid", a3);
        }
        if (a4) {
          xpc_dictionary_set_uint64(v24, "flags", a4);
        }
        if (a5) {
          xpc_dictionary_set_string(v24, "action", a5);
        }
        xpc_dictionary_set_double(v24, "cpu", (double)a6 / 1000000000.0);
        xpc_dictionary_set_double(v24, "duration", (double)a7 / 1000000000.0);
        xpc_dictionary_set_double(v24, "endtime", (double)a10 / 1000000000.0 + (double)a9 - *MEMORY[0x189604DA8]);
        if (a11 >= 1 && a12 >= 1)
        {
          xpc_dictionary_set_double(v24, "cpu_limit", (double)(unint64_t)a11 / 1000000000.0);
          xpc_dictionary_set_double(v24, "duration_limit", (double)(unint64_t)a12 / 1000000000.0);
        }

        xpc_connection_send_message(v22, v24);
        xpc_release(v24);
      }

      else
      {
        if (libspindump_log_onceToken != -1) {
          dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
        }
        if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR)) {
          SPCheckHIDResponseTime2_cold_1();
        }
      }
    }
  }

void SPReportDiskWritesResource( int a1, const char *a2, uint64_t a3, const char *a4, int64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, int64_t a9, unint64_t a10)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  if (a1 <= 0)
  {
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
    }
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_FAULT)) {
      SPReportDiskWritesResource_cold_1();
    }
  }

  else
  {
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
    }
    uint64_t v17 = (os_log_s *)libspindump_log_logt;
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEFAULT))
    {
      if ((a3 & 1) != 0) {
        uint64_t v18 = "fatal ";
      }
      else {
        uint64_t v18 = (const char *)&unk_187DB5B92;
      }
      *(_DWORD *)buf = 136447234;
      int v25 = v18;
      __int16 v26 = 2082;
      __int16 v27 = procname_btd(a1);
      __int16 v28 = 1024;
      int v29 = a1;
      __int16 v30 = 2048;
      int64_t v31 = a5;
      __int16 v32 = 2048;
      double v33 = (double)a6 / 1000000000.0;
      _os_log_impl( &dword_187DB0000,  v17,  OS_LOG_TYPE_DEFAULT,  "Reporting %{public}sdisk writes for %{public}s [%d] causing %{bytes}lld writes over the last %.0f seconds",  buf,  0x30u);
    }

    uint64_t v19 = spindump_connection();
    if (v19)
    {
      uint64_t v20 = (_xpc_connection_s *)v19;
      xpc_object_t empty = xpc_dictionary_create_empty();
      if (empty)
      {
        uint64_t v22 = empty;
        xpc_dictionary_set_int64(empty, "message", 5LL);
        xpc_dictionary_set_int64(v22, "pid", a1);
        if (a2) {
          xpc_dictionary_set_string(v22, "pname", a2);
        }
        if (a3) {
          xpc_dictionary_set_uint64(v22, "flags", a3);
        }
        if (a4) {
          xpc_dictionary_set_string(v22, "action", a4);
        }
        xpc_dictionary_set_int64(v22, "io", a5);
        xpc_dictionary_set_double(v22, "duration", (double)a6 / 1000000000.0);
        xpc_dictionary_set_double(v22, "endtime", (double)a8 / 1000000000.0 + (double)a7 - *MEMORY[0x189604DA8]);
        if (a9)
        {
          if (a10)
          {
            xpc_dictionary_set_int64(v22, "io_limit", a9);
            xpc_dictionary_set_double(v22, "duration_limit", (double)a10 / 1000000000.0);
          }
        }

        xpc_connection_send_message(v20, v22);
        xpc_release(v22);
      }

      else
      {
        if (libspindump_log_onceToken != -1) {
          dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
        }
        if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR)) {
          SPCheckHIDResponseTime2_cold_1();
        }
      }
    }
  }

void SPReportFileDescriptorExhaustion( int a1, const char *a2, uint64_t a3, const char *a4, int64_t a5, int64_t a6)
{
}

void _SPReportFileDescriptorExhaustion( int a1, const char *a2, uint64_t a3, const char *a4, int64_t a5, int64_t a6, int a7)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  if (a1 <= 0)
  {
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
    }
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_FAULT)) {
      _SPReportFileDescriptorExhaustion_cold_1();
    }
  }

  else
  {
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
    }
    v14 = (os_log_s *)libspindump_log_logt;
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEFAULT))
    {
      else {
        unint64_t v15 = "fatal ";
      }
      int v20 = 136446978;
      uint64_t v21 = v15;
      __int16 v22 = 2082;
      int v23 = procname_btd(a1);
      __int16 v24 = 1024;
      int v25 = a1;
      __int16 v26 = 2048;
      int64_t v27 = a5;
      _os_log_impl( &dword_187DB0000,  v14,  OS_LOG_TYPE_DEFAULT,  "Reporting %{public}sfile descriptor exhaustion for %{public}s [%d] at %lld file descriptors",  (uint8_t *)&v20,  0x26u);
    }

    uint64_t v16 = spindump_connection();
    if (v16)
    {
      uint64_t v17 = (_xpc_connection_s *)v16;
      xpc_object_t empty = xpc_dictionary_create_empty();
      if (empty)
      {
        uint64_t v19 = empty;
        xpc_dictionary_set_int64(empty, "message", 11LL);
        xpc_dictionary_set_int64(v19, "pid", a1);
        if (a2) {
          xpc_dictionary_set_string(v19, "pname", a2);
        }
        if (a3) {
          xpc_dictionary_set_uint64(v19, "flags", a3);
        }
        if (a4) {
          xpc_dictionary_set_string(v19, "action", a4);
        }
        xpc_dictionary_set_int64(v19, "num_fds", a5);
        if (a6 >= 1) {
          xpc_dictionary_set_int64(v19, "num_fds_limit", a6);
        }
        xpc_connection_send_message(v17, v19);
        xpc_release(v19);
      }

      else
      {
        if (libspindump_log_onceToken != -1) {
          dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
        }
        if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR)) {
          SPCheckHIDResponseTime2_cold_1();
        }
      }
    }
  }

void SPReportPortExhaustion(int a1, const char *a2, uint64_t a3, const char *a4, int64_t a5, int64_t a6)
{
}

void _SPReportPortExhaustion( int a1, const char *a2, uint64_t a3, const char *a4, int64_t a5, int64_t a6, int a7)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  if (a1 <= 0)
  {
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
    }
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_FAULT)) {
      _SPReportPortExhaustion_cold_1();
    }
  }

  else
  {
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
    }
    v14 = (os_log_s *)libspindump_log_logt;
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEFAULT))
    {
      else {
        unint64_t v15 = "fatal ";
      }
      int v20 = 136446978;
      uint64_t v21 = v15;
      __int16 v22 = 2082;
      int v23 = procname_btd(a1);
      __int16 v24 = 1024;
      int v25 = a1;
      __int16 v26 = 2048;
      int64_t v27 = a5;
      _os_log_impl( &dword_187DB0000,  v14,  OS_LOG_TYPE_DEFAULT,  "Reporting %{public}sport exhaustion for %{public}s [%d] at %lld ports",  (uint8_t *)&v20,  0x26u);
    }

    uint64_t v16 = spindump_connection();
    if (v16)
    {
      uint64_t v17 = (_xpc_connection_s *)v16;
      xpc_object_t empty = xpc_dictionary_create_empty();
      if (empty)
      {
        uint64_t v19 = empty;
        xpc_dictionary_set_int64(empty, "message", 12LL);
        xpc_dictionary_set_int64(v19, "pid", a1);
        if (a2) {
          xpc_dictionary_set_string(v19, "pname", a2);
        }
        if (a3) {
          xpc_dictionary_set_uint64(v19, "flags", a3);
        }
        if (a4) {
          xpc_dictionary_set_string(v19, "action", a4);
        }
        xpc_dictionary_set_int64(v19, "num_ports", a5);
        if (a6 >= 1) {
          xpc_dictionary_set_int64(v19, "num_ports_limit", a6);
        }
        xpc_connection_send_message(v17, v19);
        xpc_release(v19);
      }

      else
      {
        if (libspindump_log_onceToken != -1) {
          dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
        }
        if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR)) {
          SPCheckHIDResponseTime2_cold_1();
        }
      }
    }
  }

void SPReportKQWorkLoopExhaustion( int a1, const char *a2, uint64_t a3, const char *a4, int64_t a5, int64_t a6)
{
}

void _SPReportKQWorkLoopExhaustion( int a1, const char *a2, uint64_t a3, const char *a4, int64_t a5, int64_t a6, int a7)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  if (a1 <= 0)
  {
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
    }
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_FAULT)) {
      _SPReportKQWorkLoopExhaustion_cold_1();
    }
  }

  else
  {
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
    }
    v14 = (os_log_s *)libspindump_log_logt;
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEFAULT))
    {
      else {
        unint64_t v15 = "fatal ";
      }
      int v20 = 136446978;
      uint64_t v21 = v15;
      __int16 v22 = 2082;
      int v23 = procname_btd(a1);
      __int16 v24 = 1024;
      int v25 = a1;
      __int16 v26 = 2048;
      int64_t v27 = a5;
      _os_log_impl( &dword_187DB0000,  v14,  OS_LOG_TYPE_DEFAULT,  "Reporting %{public}skqworkloop exhaustion for %{public}s [%d] at %lld kqworkloops",  (uint8_t *)&v20,  0x26u);
    }

    uint64_t v16 = spindump_connection();
    if (v16)
    {
      uint64_t v17 = (_xpc_connection_s *)v16;
      xpc_object_t empty = xpc_dictionary_create_empty();
      if (empty)
      {
        uint64_t v19 = empty;
        xpc_dictionary_set_int64(empty, "message", 14LL);
        xpc_dictionary_set_int64(v19, "pid", a1);
        if (a2) {
          xpc_dictionary_set_string(v19, "pname", a2);
        }
        if (a3) {
          xpc_dictionary_set_uint64(v19, "flags", a3);
        }
        if (a4) {
          xpc_dictionary_set_string(v19, "action", a4);
        }
        xpc_dictionary_set_int64(v19, "num_kqworkloops", a5);
        if (a6 >= 1) {
          xpc_dictionary_set_int64(v19, "num_kqworkloops_limit", a6);
        }
        xpc_connection_send_message(v17, v19);
        xpc_release(v19);
      }

      else
      {
        if (libspindump_log_onceToken != -1) {
          dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
        }
        if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR)) {
          SPCheckHIDResponseTime2_cold_1();
        }
      }
    }
  }

void SPReportWorkflowResponsivenessDelay(const char *a1)
{
  if (a1)
  {
    uint64_t v2 = spindump_connection();
    if (v2)
    {
      unsigned int v3 = (_xpc_connection_s *)v2;
      xpc_object_t empty = xpc_dictionary_create_empty();
      if (empty)
      {
        int v5 = empty;
        xpc_dictionary_set_int64(empty, "message", 13LL);
        xpc_dictionary_set_string(v5, "filename", a1);
        xpc_connection_send_message(v3, v5);
        xpc_release(v5);
      }

      else
      {
        if (libspindump_log_onceToken != -1) {
          dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
        }
        if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR)) {
          SPCheckHIDResponseTime2_cold_1();
        }
      }
    }

    else
    {
      if (libspindump_log_onceToken != -1) {
        dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
      }
      if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR)) {
        SPReportWorkflowResponsivenessDelay_cold_2();
      }
    }
  }

  else
  {
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
    }
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_FAULT)) {
      SPReportWorkflowResponsivenessDelay_cold_1();
    }
  }

uint64_t __SPHIDResponseDelayThresholdMachAbs_block_invoke()
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue( @"HIDResponseDelayReportThresholdMs",  (CFStringRef)*MEMORY[0x189605188],  &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    if (AppIntegerValue < 0)
    {
      uint64_t result = -1LL;
      goto LABEL_7;
    }

    uint64_t v1 = 1000000 * AppIntegerValue;
  }

  else
  {
    uint64_t v1 = 500000000LL;
  }

  uint64_t result = NanoToMach(v1);
LABEL_7:
  SPHIDResponseDelayThresholdMachAbs_thresholdMachAbs = result;
  return result;
}

uint64_t NanoToMach(uint64_t a1)
{
  if (MachTimebase_onceToken != -1) {
    dispatch_once(&MachTimebase_onceToken, &__block_literal_global_34);
  }
  if ((_DWORD)MachTimebase_info != HIDWORD(MachTimebase_info))
  {
    if ((_DWORD)MachTimebase_info) {
      BOOL v2 = HIDWORD(MachTimebase_info) == 0;
    }
    else {
      BOOL v2 = 1;
    }
    if (v2) {
      return 0LL;
    }
    else {
      return __udivti3();
    }
  }

  return a1;
}

uint64_t __MachTimebase_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&MachTimebase_info);
}

uint64_t MachToNano(uint64_t a1)
{
  if (MachTimebase_onceToken != -1) {
    dispatch_once(&MachTimebase_onceToken, &__block_literal_global_34);
  }
  if ((_DWORD)MachTimebase_info != HIDWORD(MachTimebase_info))
  {
    if ((_DWORD)MachTimebase_info) {
      BOOL v2 = HIDWORD(MachTimebase_info) == 0;
    }
    else {
      BOOL v2 = 1;
    }
    if (v2) {
      return 0LL;
    }
    else {
      return __udivti3();
    }
  }

  return a1;
}

os_log_t __libspindump_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.libspindump", "logging");
  libspindump_log_logt = (uint64_t)result;
  if (!result) {
    __libspindump_log_block_invoke_cold_1();
  }
  return result;
}

uint64_t __SPAddToHIDTelemetry_block_invoke()
{
  uint64_t v0 = 0LL;
  uint64_t v29 = *MEMORY[0x1895F89C0];
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v13 = 0u;
  do
  {
    uint64_t v1 = (unint64_t *)((char *)&gHIDEventCountBuckets + 8 * v0);
    do
      unint64_t v2 = __ldxr(v1);
    while (__stxr(0LL, v1));
    *((void *)&v13 + v0) = v2;
    unsigned int v3 = (unint64_t *)((char *)&gHIDEventDurationMachAbsBuckets + 8 * v0);
    do
      uint64_t v4 = __ldxr(v3);
    while (__stxr(0LL, v3));
    *((void *)&v17 + ++v0) = MachToNano(v4);
  }

  while (v0 != 9);
  do
    unint64_t v5 = __ldxr(&gActionCount);
  while (__stxr(0LL, &gActionCount));
  uint64_t v6 = 0LL;
  uint64_t v7 = v17;
  uint64_t v8 = *((void *)&v21 + 1);
  do
  {
    uint64_t v9 = (char *)&v13 + 8 * v6;
    v7 += *((void *)v9 + 7);
    *((void *)v9 + 7) = v7;
    v8 += *((void *)v9 + 16);
    *((void *)v9 + 16) = v8;
    unint64_t v10 = v6 + 8;
    --v6;
  }

  while (v10 > 1);
  if (libspindump_log_onceToken != -1) {
    dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
  }
  v11 = (os_log_s *)libspindump_log_logt;
  if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134222592;
    *(void *)&uint8_t buf[4] = v5;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2048;
    double v23 = (double)*((unint64_t *)&v17 + 1) / 1000000000.0;
    *(_WORD *)__int16 v24 = 2048;
    *(void *)&v24[2] = *((void *)&v13 + 1);
    *(_WORD *)&v24[10] = 2048;
    *(double *)&v24[12] = (double)(unint64_t)v18 / 1000000000.0;
    *(_WORD *)&v24[20] = 2048;
    *(void *)&v24[22] = v14;
    *(_WORD *)&v24[30] = 2048;
    *(double *)&v24[32] = (double)*((unint64_t *)&v18 + 1) / 1000000000.0;
    *(_WORD *)int v25 = 2048;
    *(void *)&v25[2] = *((void *)&v14 + 1);
    *(_WORD *)&v25[10] = 2048;
    *(double *)&v25[12] = (double)(unint64_t)v19 / 1000000000.0;
    *(_WORD *)&v25[20] = 2048;
    *(void *)&v25[22] = v15;
    *(_WORD *)&v25[30] = 2048;
    *(double *)__int16 v26 = (double)*((unint64_t *)&v19 + 1) / 1000000000.0;
    *(_WORD *)&v26[8] = 2048;
    *(void *)&v26[10] = *((void *)&v15 + 1);
    *(_WORD *)&v26[18] = 2048;
    *(double *)&v26[20] = (double)(unint64_t)v20 / 1000000000.0;
    *(_WORD *)&v26[28] = 2048;
    *(void *)&v26[30] = v16;
    *(_WORD *)&v26[38] = 2048;
    *(double *)&v26[40] = (double)*((unint64_t *)&v20 + 1) / 1000000000.0;
    *(_WORD *)int64_t v27 = 2048;
    *(void *)&v27[2] = *((void *)&v16 + 1);
    *(_WORD *)&v27[10] = 2048;
    *(double *)&v27[12] = (double)(unint64_t)v21 / 1000000000.0;
    *(_WORD *)&v27[20] = 2048;
    *(void *)&v27[22] = v17;
    *(_WORD *)&v27[30] = 2048;
    double v28 = (double)*((unint64_t *)&v21 + 1) / 1000000000.0;
    _os_log_debug_impl( &dword_187DB0000,  v11,  OS_LOG_TYPE_DEBUG,  "HID statistics actions:%llu responseBuckets:%llu(%.3fs),%llu(%.3fs),%llu(%.3fs),%llu(%.3fs),%llu(%.3fs),%llu(%.3fs),%llu(%.3fs),%llu(%.3fs),%llu(%.3fs)",  buf,  0xC0u);
  }

  *(void *)&buf[8] = 3221225472LL;
  *(_OWORD *)&v26[16] = v18;
  *(_OWORD *)&v26[32] = v19;
  *(_OWORD *)int64_t v27 = v20;
  *(_OWORD *)&v27[16] = v21;
  *(_OWORD *)&v24[24] = v14;
  *(_OWORD *)int v25 = v15;
  *(_OWORD *)&v25[16] = v16;
  *(_OWORD *)__int16 v26 = v17;
  *(void *)buf = MEMORY[0x1895F87A8];
  *(void *)&buf[16] = __SPSubmitHIDTelemetry_block_invoke;
  double v23 = COERCE_DOUBLE(&__block_descriptor_184_e30___NSObject_OS_xpc_object__8__0l);
  *(void *)__int16 v24 = v5;
  *(_OWORD *)&v24[8] = v13;
  uint64_t result = analytics_send_event_lazy();
  SPAddToHIDTelemetry_telemetryPending = 0;
  return result;
}

xpc_object_t __SPSubmitHIDTelemetry_block_invoke(uint64_t *a1)
{
  unint64_t v2 = (void *)[MEMORY[0x1896077F8] mainBundle];
  unsigned int v3 = (void *)[v2 bundleIdentifier];
  uint64_t v4 = (void *)[v2 infoDictionary];
  unint64_t v5 = (void *)[v4 objectForKeyedSubscript:*MEMORY[0x189604E18]];
  uint64_t v6 = (void *)[v4 objectForKeyedSubscript:*MEMORY[0x189604AC8]];
  uint64_t v7 = [v6 length];
  uint64_t v8 = [v5 length];
  if (v7)
  {
    if (v8) {
      id v9 = (id)[objc_alloc(NSString) initWithFormat:@"%@ (%@)", v6, v5];
    }
    else {
      id v9 = v6;
    }
    goto LABEL_7;
  }

  if (v8)
  {
    id v9 = v5;
LABEL_7:
    unint64_t v10 = v9;
    goto LABEL_8;
  }

  unint64_t v10 = 0LL;
LABEL_8:
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "action_count", a1[4]);
  xpc_dictionary_set_uint64(empty, "all_count", a1[5]);
  xpc_dictionary_set_uint64(empty, "50ms_count", a1[6]);
  xpc_dictionary_set_uint64(empty, "100ms_count", a1[7]);
  xpc_dictionary_set_uint64(empty, "250ms_count", a1[8]);
  xpc_dictionary_set_uint64(empty, "500ms_count", a1[9]);
  xpc_dictionary_set_uint64(empty, "1s_count", a1[10]);
  xpc_dictionary_set_uint64(empty, "2s_count", a1[11]);
  xpc_dictionary_set_uint64(empty, "5s_count", a1[12]);
  xpc_dictionary_set_uint64(empty, "10s_count", a1[13]);
  xpc_dictionary_set_uint64(empty, "all_ns", a1[14]);
  xpc_dictionary_set_uint64(empty, "50ms_ns", a1[15]);
  xpc_dictionary_set_uint64(empty, "100ms_ns", a1[16]);
  xpc_dictionary_set_uint64(empty, "250ms_ns", a1[17]);
  xpc_dictionary_set_uint64(empty, "500ms_ns", a1[18]);
  xpc_dictionary_set_uint64(empty, "1s_ns", a1[19]);
  xpc_dictionary_set_uint64(empty, "2s_ns", a1[20]);
  xpc_dictionary_set_uint64(empty, "5s_ns", a1[21]);
  xpc_dictionary_set_uint64(empty, "10s_ns", a1[22]);
  v12 = (const char *)[v3 UTF8String];
  if (v12) {
    xpc_dictionary_set_string(empty, "bundle_id", v12);
  }
  __int128 v13 = (const char *)[v10 UTF8String];
  if (v13) {
    xpc_dictionary_set_string(empty, "bundle_version", v13);
  }

  return empty;
}

void __spindump_connection_block_invoke()
{
  mach_service = xpc_connection_create_mach_service("com.apple.spindump", 0LL, 2uLL);
  spindump_connection_connection = (uint64_t)mach_service;
  if (mach_service)
  {
    xpc_connection_set_event_handler(mach_service, &__block_literal_global_67);
    xpc_connection_resume((xpc_connection_t)spindump_connection_connection);
  }

void __spindump_connection_block_invoke_2(uint64_t a1, void *a2)
{
  if (MEMORY[0x1895B7194](a2) == MEMORY[0x1895F9268]
    && a2 != (void *)MEMORY[0x1895F9198]
    && a2 != (void *)MEMORY[0x1895F91C8])
  {
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
    }
    unint64_t v5 = (os_log_s *)libspindump_log_logt;
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR)) {
      __spindump_connection_block_invoke_2_cold_1(a2, v5);
    }
  }

void __procname_btd_block_invoke()
{
  int v0 = sandbox_check();
  if (v0 == -1)
  {
    if (libspindump_log_onceToken != -1) {
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_35);
    }
    unint64_t v2 = (os_log_s *)libspindump_log_logt;
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR)) {
      __procname_btd_block_invoke_cold_1(v2);
    }
    goto LABEL_9;
  }

  if (!v0)
  {
LABEL_9:
    char v1 = 0;
    goto LABEL_10;
  }

  if (v0 != 1) {
    return;
  }
  char v1 = 1;
LABEL_10:
  procname_btd_avoid_proc_name = v1;
}

void OUTLINED_FUNCTION_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void OUTLINED_FUNCTION_2( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_5( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_6(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void OUTLINED_FUNCTION_7(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

uint64_t OUTLINED_FUNCTION_10@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return MachToNano(a1 - a2);
}

void SPExpectedHIDResponseDelayUntil_cold_1(uint64_t a1)
{
}

void SPExpectedHIDResponseDelayUntil_cold_2()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_187DB0000, v0, v1, "Expected HID response delay for the next %.2fs (%llu)", v2);
  OUTLINED_FUNCTION_8();
}

void SPExpectedHIDResponseDelayUntil_cold_3()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_4();
  __int16 v3 = v0;
  uint64_t v4 = 0x4000000000000000LL;
  _os_log_fault_impl( &dword_187DB0000,  v1,  OS_LOG_TYPE_FAULT,  "Expected HID response delay for the next %.2fs (%llu is more than %.2fs in the future",  v2,  0x20u);
  OUTLINED_FUNCTION_9();
}

void SPExpectedHIDResponseDelayUntil_cold_4()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_187DB0000, v0, v1, "Expected HID response delay until %.2fs ago (%llu)", v2);
  OUTLINED_FUNCTION_8();
}

void SPPauseMonitoringHIDResponsiveness_cold_1(char **a1)
{
  qword_18C6F5090 = (uint64_t)*a1;
  _os_crash();
  __break(1u);
}

void SPResumeMonitoringHIDResponsiveness_cold_1(char **a1)
{
  qword_18C6F5090 = (uint64_t)*a1;
  _os_crash();
  __break(1u);
}

void SPResumeMonitoringHIDResponsiveness_cold_2(uint64_t *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v4 = a1 + 1;
  uint64_t v5 = OUTLINED_FUNCTION_10(a2, *a1);
  int v7 = 136446466;
  uint64_t v8 = v4;
  __int16 v9 = 2048;
  double v10 = (double)(unint64_t)v5 / 1000000000.0;
  OUTLINED_FUNCTION_7( &dword_187DB0000,  a3,  v6,  "Resuming HID responsiveness monitoring for %{public}s after %.2fs",  (uint8_t *)&v7);
  OUTLINED_FUNCTION_9();
}

void SPResumeMonitoringHIDResponsiveness_cold_3(uint64_t *a1, uint64_t a2)
{
}

void SPResumeMonitoringHIDResponsiveness_cold_4(uint64_t *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v4 = a1 + 1;
  uint64_t v5 = OUTLINED_FUNCTION_10(a2, *a1);
  int v6 = 136446722;
  uint64_t v7 = v4;
  __int16 v8 = 2048;
  double v9 = (double)(unint64_t)v5 / 1000000000.0;
  __int16 v10 = 1024;
  int v11 = gNumPauseReceipts;
  _os_log_debug_impl( &dword_187DB0000,  a3,  OS_LOG_TYPE_DEBUG,  "Resuming HID responsiveness monitoring for %{public}s after %.2fs, still waiting on %d others",  (uint8_t *)&v6,  0x1Cu);
}

void SPResumeMonitoringHIDResponsiveness_cold_5(char **a1)
{
  asprintf( a1,  "Receipt passed to SPResumeMonitoringHIDResponsiveness does not match any live receipt returned by SPPauseMonitoringH IDResponsiveness");
  qword_18C6F5090 = (uint64_t)*a1;
  _os_crash();
  __break(1u);
}

void SPCheckHIDResponseTime2_cold_1()
{
}

void SPCheckHIDResponseTime2_cold_2()
{
  OUTLINED_FUNCTION_0( &dword_187DB0000,  v0,  v1,  "Unable to get executable path for HID response delay: 0 return with 0-length buffer",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_1();
}

void SPCheckHIDResponseTime2_cold_3(int *a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v3 = *a1;
  v4[0] = 67109120;
  v4[1] = v3;
  OUTLINED_FUNCTION_6( &dword_187DB0000,  a2,  a3,  "Unable to get executable path for HID response delay with buffer of size %#x",  (uint8_t *)v4);
  OUTLINED_FUNCTION_1();
}

void SPCheckHIDResponseTime2_cold_4(int *a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v3 = *a1;
  v4[0] = 67109120;
  v4[1] = v3;
  OUTLINED_FUNCTION_6( &dword_187DB0000,  a2,  a3,  "Unable to get executable path for HID response delay, requires buffer of size %#x",  (uint8_t *)v4);
  OUTLINED_FUNCTION_1();
}

void SPCheckHIDResponseTime2_cold_5(char **a1, int a2)
{
  qword_18C6F5090 = (uint64_t)*a1;
  _os_crash();
  __break(1u);
}

void SPCheckHIDResponseTime2_cold_6(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_fault_impl( &dword_187DB0000,  log,  OS_LOG_TYPE_FAULT,  "Invalid timestamps for HID response delay: %llu to %llu",  (uint8_t *)&v3,  0x16u);
  OUTLINED_FUNCTION_8();
}

void spindump_connection_cold_1()
{
}

void SPReportCPUUsageResource_cold_1()
{
}

void SPReportDiskWritesResource_cold_1()
{
}

void _SPReportFileDescriptorExhaustion_cold_1()
{
}

void _SPReportPortExhaustion_cold_1()
{
}

void _SPReportKQWorkLoopExhaustion_cold_1()
{
}

void SPReportWorkflowResponsivenessDelay_cold_1()
{
}

void SPReportWorkflowResponsivenessDelay_cold_2()
{
  OUTLINED_FUNCTION_0(&dword_187DB0000, v0, v1, "Unable to connect to spindump, returning", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __libspindump_log_block_invoke_cold_1()
{
}

void __spindump_connection_block_invoke_2_cold_1(void *a1, os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  string = xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x1895F91B0]);
  int v4 = 136446210;
  uint64_t v5 = string;
  _os_log_error_impl( &dword_187DB0000,  a2,  OS_LOG_TYPE_ERROR,  "Got xpc error message: %{public}s\n",  (uint8_t *)&v4,  0xCu);
  OUTLINED_FUNCTION_9();
}

void __procname_btd_block_invoke_cold_1(os_log_s *a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v2 = *__error();
  v4[0] = 67109120;
  v4[1] = v2;
  OUTLINED_FUNCTION_6(&dword_187DB0000, a1, v3, "Unable to check for proc_name availability: %{errno}d", (uint8_t *)v4);
  OUTLINED_FUNCTION_8();
}

CFIndex CFPreferencesGetAppIntegerValue( CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x189602FA0](key, applicationID, keyExistsAndHasValidFormat);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1895F8720](aBlock);
}

void _Block_release(const void *aBlock)
{
}

int _NSGetExecutablePath(char *buf, uint32_t *bufsize)
{
  return MEMORY[0x1895F87D0](buf, bufsize);
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895F8A08]();
}

uint64_t __udivti3()
{
  return MEMORY[0x1895F8A38]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1895F8D68]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1895F8D78]();
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl( void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t analytics_send_event_lazy()
{
  return MEMORY[0x18960DAC8]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1895F9540](a1, a2);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1895FB8C0]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FBA98]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x1895FBAC8]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1895FBBF8](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1895FC600](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1895FC8C8](*(void *)&pid, buffer, *(void *)&buffersize);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC68](__ptr, __size);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1895FCD90]();
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FD0B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1895FD100](__s1, __n);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1895FD968](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply( xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1895FDBA0]();
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDC20](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1895FDC48](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

uint64_t xpc_dictionary_set_mach_send()
{
  return MEMORY[0x1895FDCF8]();
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}

void xpc_release(xpc_object_t object)
{
}