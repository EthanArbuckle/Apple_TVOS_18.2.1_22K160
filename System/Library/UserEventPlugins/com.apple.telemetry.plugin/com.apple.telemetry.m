void init_telemetry()
{
  dispatch_queue_attr_s *v0;
  dispatch_queue_s *v1;
  uint32_t v2;
  void v3[5];
  int v4;
  void handler[5];
  int out_token;
  v0 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_BACKGROUND, 0);
  v1 = dispatch_queue_create("com.apple.telemetry.microstackshots", v0);
  out_token = -1;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000LL;
  handler[2] = sub_1514;
  handler[3] = &unk_C288;
  handler[4] = v1;
  v2 = notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &out_token, v1, handler);
  if (v2) {
    _os_assumes_log(v2);
  }
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 0x40000000LL;
  v3[2] = sub_1738;
  v3[3] = &unk_C2A8;
  v3[4] = v1;
  v4 = out_token;
  dispatch_async(v1, v3);
}

void sub_1514(uint64_t a1, int a2)
{
  if (qword_C628 != -1) {
    dispatch_once(&qword_C628, &stru_C2E8);
  }
  if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEBUG)) {
    sub_6B84();
  }
  v4 = *(dispatch_queue_s **)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 0x40000000LL;
  v5[2] = sub_15D0;
  v5[3] = &unk_C268;
  v5[4] = v4;
  int v6 = a2;
  dispatch_async(v4, v5);
}

void sub_15D0(uint64_t a1)
{
}

void sub_15E0(uint64_t a1, int a2)
{
  if (qword_C5D0)
  {
    if (qword_C628 != -1) {
      dispatch_once(&qword_C628, &stru_C2E8);
    }
    if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEBUG)) {
      sub_6BB4();
    }
  }

  else if (MKBDeviceUnlockedSinceBoot())
  {
    if (qword_C628 != -1) {
      dispatch_once(&qword_C628, &stru_C2E8);
    }
    v4 = (os_log_s *)qword_C620;
    if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "Device unlocked; proceeding with initialization of telemetry plugin.",
        buf,
        2u);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_3524;
    block[3] = &unk_C348;
    int v6 = a2;
    block[4] = "/private/var/db/systemstats";
    block[5] = a1;
    if (qword_C5D8 != -1) {
      dispatch_once(&qword_C5D8, block);
    }
  }
}

void sub_1738(uint64_t a1)
{
}

uint64_t telemetry_notification(mach_port_name_t name)
{
  kern_return_t v1;
  mach_port_context_t context;
  v1 = mach_port_get_context(mach_task_self_, name, &context);
  if (v1) {
    _os_assumes_log(v1);
  }
  else {
    sub_1798((void *)context, 0);
  }
  return 0LL;
}

void sub_1798(void *a1, int a2)
{
  if (*((_BYTE *)a1 + 320))
  {
    if (qword_C628 != -1) {
      dispatch_once(&qword_C628, &stru_C2E8);
    }
    if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEBUG)) {
      sub_7100();
    }
    return;
  }

  if (*((_BYTE *)a1 + 322))
  {
    unsigned int v4 = __microstackshot(a1[3], *((unsigned int *)a1 + 8), 144LL);
    if (v4 > 0x10000)
    {
      if (qword_C628 != -1) {
        dispatch_once(&qword_C628, &stru_C2E8);
      }
      if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
        sub_6C14();
      }
      return;
    }

    v131[0] = 0LL;
    v131[1] = v131;
    v131[2] = 0x2000000000LL;
    char v132 = 0;
    v129[0] = 0LL;
    v129[1] = v129;
    v129[2] = 0x2000000000LL;
    char v130 = 0;
    v127[0] = 0LL;
    v127[1] = v127;
    v127[2] = 0x2000000000LL;
    char v128 = 0;
    uint64_t v123 = 0LL;
    v124 = &v123;
    uint64_t v125 = 0x2000000000LL;
    int v126 = 0;
    uint64_t v119 = 0LL;
    v120 = &v119;
    uint64_t v121 = 0x2000000000LL;
    int v122 = 0;
    uint64_t v115 = 0LL;
    v116 = (double *)&v115;
    uint64_t v117 = 0x2000000000LL;
    uint64_t v118 = 0LL;
    uint64_t v5 = a1[3];
    v114[0] = _NSConcreteStackBlock;
    v114[1] = 0x40000000LL;
    v114[2] = sub_5F28;
    v114[3] = &unk_C528;
    v114[9] = &v115;
    v114[10] = a1;
    v114[4] = v131;
    v114[5] = v129;
    v114[6] = &v123;
    v114[7] = v127;
    v114[8] = &v119;
    systemstats_foreach_micro(v5, v4, 0LL, v114);
    if (qword_C628 != -1) {
      dispatch_once(&qword_C628, &stru_C2E8);
    }
    int v6 = (os_log_s *)qword_C620;
    uint64_t v7 = os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEBUG);
    if ((_DWORD)v7)
    {
      double v41 = v116[3];
      int v42 = *((_DWORD *)v124 + 6);
      int v43 = *((_DWORD *)v120 + 6);
      *(_DWORD *)buf = 134218496;
      *(double *)&unint64_t v134 = v41;
      __int16 v135 = 1024;
      *(_DWORD *)v136 = v42;
      *(_WORD *)&v136[4] = 1024;
      *(_DWORD *)&v136[6] = v43;
      _os_log_debug_impl( &dword_0,  v6,  OS_LOG_TYPE_DEBUG,  "Saved %zu microstackshots (ignored %d known duplicates and %d likely duplicates)",  buf,  0x18u);
      if (!a2)
      {
LABEL_22:
        if (!*((_BYTE *)a1 + 321))
        {
          if (qword_C628 != -1) {
            dispatch_once(&qword_C628, &stru_C2E8);
          }
          if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEBUG)) {
            sub_6C78();
          }
          goto LABEL_205;
        }

        if (!a1[41])
        {
          if (qword_C628 != -1) {
            dispatch_once(&qword_C628, &stru_C2E8);
          }
          if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEBUG)) {
            sub_6CA8();
          }
          goto LABEL_205;
        }

        if (!*(void *)(*a1 + 120LL))
        {
          if (qword_C628 != -1) {
            dispatch_once(&qword_C628, &stru_C2E8);
          }
          v16 = (os_log_s *)qword_C620;
          if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEBUG)) {
            sub_6CD8((uint64_t)a1, v16, v17, v18, v19, v20, v21, v22);
          }
          goto LABEL_205;
        }

        uint64_t v8 = now_in_absolute_milliseconds(v7);
        uint64_t v9 = *a1;
        unint64_t v10 = *(void *)(*a1 + 168LL);
        double v11 = (double)(v8 - v10) / 1000.0;
        unint64_t v12 = a1[48];
        if (v12)
        {
          double v13 = (double)(v8 - v12) / 1000.0;
          double v14 = *((double *)a1 + 41);
          double v111 = *(double *)(*(void *)(v9 + 8) + 32LL);
          double v112 = *(double *)(v9 + 120);
          if (v11 + 1800.0 < 86400.0)
          {
            if (v12 < v10)
            {
              if (qword_C628 != -1) {
                dispatch_once(&qword_C628, &stru_C2E8);
              }
              v15 = (os_log_s *)qword_C620;
              if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 134219520;
                *(double *)&unint64_t v134 = v11;
                __int16 v135 = 2048;
                *(double *)v136 = v13;
                *(_WORD *)&v136[8] = 2048;
                double v137 = v112;
                __int16 v138 = 2048;
                double v139 = 0.0;
                __int16 v140 = 2048;
                double v141 = 0.0;
                __int16 v142 = 2048;
                double v143 = v14;
                __int16 v144 = 2048;
                double v145 = v111;
                _os_log_fault_impl( &dword_0,  v15,  OS_LOG_TYPE_FAULT,  "PMI adjustment: last pmi adjustment < last cleanup. time_since_cleanup:%.0fs time_since_adjustment:%.0 fs all_bytes_since_cleanup:%llu all_bytes_since_adjustment:%llu pmi_percent:%.0f%% pmi_interval:%llu quota:%llu",  buf,  0x48u);
              }

              a1[46] = 0LL;
              a1[47] = 0LL;
              double v13 = v11;
              a1[48] = 0LL;
            }

LABEL_46:
            double v110 = v14;
            if (v13 < 1800.0)
            {
              if (qword_C628 != -1) {
                dispatch_once(&qword_C628, &stru_C2E8);
              }
              uint64_t v23 = qword_C620;
              if (!os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_205;
              }
              *(_DWORD *)buf = 134219520;
              *(double *)&unint64_t v134 = v11;
              __int16 v135 = 2048;
              *(double *)v136 = v13;
              *(_WORD *)&v136[8] = 2048;
              double v137 = v112;
              __int16 v138 = 2048;
              double v139 = 0.0;
              __int16 v140 = 2048;
              double v141 = 0.0;
              __int16 v142 = 2048;
              double v143 = v14;
              __int16 v144 = 2048;
              double v145 = v111;
              v24 = "PMI adjustment: Adjusted PMI interval too recently, not checking daily budget. time_since_cleanup:%."
                    "0fs time_since_adjustment:%.0fs all_bytes_since_cleanup:%llu all_bytes_since_adjustment:%llu pmi_per"
                    "cent:%.0f%% pmi_interval:%llu quota:%llu";
              v25 = (os_log_s *)v23;
              uint32_t v26 = 72;
              goto LABEL_55;
            }

            *(double *)&unint64_t v28 = COERCE_DOUBLE(systemstats_get_pmi_cycle_interval());
            if (qword_C600 != -1) {
              dispatch_once(&qword_C600, &stru_C3E8);
            }
            v29 = (os_log_s *)qword_C5F8;
            if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134219520;
              *(double *)&unint64_t v134 = v11;
              __int16 v135 = 2048;
              *(double *)v136 = v13;
              *(_WORD *)&v136[8] = 2048;
              double v137 = v112;
              __int16 v138 = 2048;
              double v139 = 0.0;
              __int16 v140 = 2048;
              double v141 = 0.0;
              __int16 v142 = 2048;
              double v143 = v14;
              __int16 v144 = 2048;
              double v145 = v111;
              _os_log_debug_impl( &dword_0,  v29,  OS_LOG_TYPE_DEBUG,  ". time_since_cleanup:%.0fs time_since_adjustment:%.0fs all_bytes_since_cleanup:%llu all_bytes_since_adju stment:%llu pmi_percent:%.0f%% pmi_interval:%llu quota:%llu",  buf,  0x48u);
              double v30 = 86400.0 - v11;
              if (qword_C600 != -1)
              {
                dispatch_once(&qword_C600, &stru_C3E8);
                v31 = &CFDataGetBytePtr_ptr;
LABEL_61:
                v32 = (os_log_s *)v31[191];
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 134217984;
                  *(double *)&unint64_t v134 = v30;
                  _os_log_debug_impl(&dword_0, v32, OS_LOG_TYPE_DEBUG, "time_remaining_in_the_day_s:%.2f", buf, 0xCu);
                  v33 = (double *)(a1 + 8);
                  unint64_t v34 = a1[9];
                  if (qword_C600 != -1) {
                    dispatch_once(&qword_C600, &stru_C3E8);
                  }
                }

                else
                {
                  v33 = (double *)(a1 + 8);
                  unint64_t v34 = a1[9];
                }

                if (os_log_type_enabled((os_log_t)v31[191], OS_LOG_TYPE_DEBUG))
                {
                  sub_70A0();
                  if (v34)
                  {
LABEL_65:
                    uint64_t v35 = a1[46];
                    *(void *)&double v36 = v34 - v35;
                    if (qword_C600 != -1) {
                      dispatch_once(&qword_C600, &stru_C3E8);
                    }
                    if (os_log_type_enabled((os_log_t)v31[191], OS_LOG_TYPE_DEBUG)) {
                      sub_7040();
                    }
                    if (v34 == v35)
                    {
                      if (qword_C628 != -1) {
                        dispatch_once(&qword_C628, &stru_C2E8);
                      }
                      double v37 = v110;
                      uint64_t v38 = qword_C620;
                      double v39 = 0.0;
                      if (!os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_172;
                      }
                      *(_DWORD *)buf = 134219776;
                      unint64_t v134 = v28;
                      __int16 v135 = 2048;
                      *(double *)v136 = v11;
                      *(_WORD *)&v136[8] = 2048;
                      double v137 = v13;
                      __int16 v138 = 2048;
                      double v139 = v112;
                      __int16 v140 = 2048;
                      double v141 = 0.0;
                      __int16 v142 = 2048;
                      double v143 = 0.0;
                      __int16 v144 = 2048;
                      double v145 = v110;
                      __int16 v146 = 2048;
                      *(double *)&uint64_t v147 = v111;
                      v40 = "PMI adjustment: No microstackshots since last adjustment, resetting PMI interval to %llu. ti"
                            "me_since_cleanup:%.0fs time_since_adjustment:%.0fs all_bytes_since_cleanup:%llu all_bytes_si"
                            "nce_adjustment:%llu pmi_percent:%.0f%% pmi_interval:%llu quota:%llu";
                      goto LABEL_160;
                    }

                    uint64_t v44 = a1[25];
                    if (qword_C600 != -1) {
                      dispatch_once(&qword_C600, &stru_C3E8);
                    }
                    if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
                    {
                      sub_6FE0();
                      if (v44)
                      {
LABEL_80:
                        uint64_t v45 = a1[47];
                        if (qword_C600 != -1) {
                          dispatch_once(&qword_C600, &stru_C3E8);
                        }
                        unint64_t v108 = v44 - v45;
                        if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
                          sub_6F80();
                        }
                        if (v44 == v45)
                        {
                          if (qword_C628 != -1) {
                            dispatch_once(&qword_C628, &stru_C2E8);
                          }
                          double v37 = v110;
                          uint64_t v46 = qword_C620;
                          double v39 = 0.0;
                          if (!os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
                            goto LABEL_172;
                          }
                          *(_DWORD *)buf = 134220032;
                          *(double *)&unint64_t v134 = v36;
                          __int16 v135 = 2048;
                          *(void *)v136 = v28;
                          *(_WORD *)&v136[8] = 2048;
                          double v137 = v11;
                          __int16 v138 = 2048;
                          double v139 = v13;
                          __int16 v140 = 2048;
                          double v141 = v112;
                          __int16 v142 = 2048;
                          double v143 = 0.0;
                          __int16 v144 = 2048;
                          double v145 = 0.0;
                          __int16 v146 = 2048;
                          *(double *)&uint64_t v147 = v110;
                          __int16 v148 = 2048;
                          double v149 = v111;
                          v40 = "PMI adjustment: No PMI microstackshots since last adjustment (%llu bytes of other types)"
                                ", resetting PMI interval to %llu. time_since_cleanup:%.0fs time_since_adjustment:%.0fs a"
                                "ll_bytes_since_cleanup:%llu all_bytes_since_adjustment:%llu pmi_percent:%.0f%% pmi_inter"
                                "val:%llu quota:%llu";
                          v47 = (os_log_s *)v46;
                          goto LABEL_170;
                        }

                        double v48 = (double)v108;
                        double v49 = (double)*(unint64_t *)&v36;
                        if (qword_C600 != -1) {
                          dispatch_once(&qword_C600, &stru_C3E8);
                        }
                        v50 = (os_log_s *)qword_C5F8;
                        double v39 = v48 / v49;
                        if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 134217984;
                          *(double *)&unint64_t v134 = v48 / v49;
                          _os_log_debug_impl( &dword_0,  v50,  OS_LOG_TYPE_DEBUG,  "ratio_of_pmi_vs_all_since_last_adjustment:%.2f",  buf,  0xCu);
                          double v51 = (double)v34 / (double)*(unint64_t *)&v112;
                          if (qword_C600 != -1) {
                            dispatch_once(&qword_C600, &stru_C3E8);
                          }
                        }

                        else
                        {
                          double v51 = (double)v34 / (double)*(unint64_t *)&v112;
                        }

                        v52 = (os_log_s *)qword_C5F8;
                        if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 134217984;
                          *(double *)&unint64_t v134 = v51;
                          _os_log_debug_impl(&dword_0, v52, OS_LOG_TYPE_DEBUG, "compression_ratio:%.2f", buf, 0xCu);
                          *(void *)&double v53 = (unint64_t)(v49 / v51);
                          if (qword_C600 != -1) {
                            dispatch_once(&qword_C600, &stru_C3E8);
                          }
                        }

                        else
                        {
                          *(void *)&double v53 = (unint64_t)(v49 / v51);
                        }

                        v54 = (os_log_s *)qword_C5F8;
                        if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 134217984;
                          *(double *)&unint64_t v134 = v53;
                          _os_log_debug_impl( &dword_0,  v54,  OS_LOG_TYPE_DEBUG,  "all_compressed_bytes_written_since_last_adjustment:%llu",  buf,  0xCu);
                          double v55 = (double)*(unint64_t *)&v53 / v13;
                          if (qword_C600 != -1) {
                            dispatch_once(&qword_C600, &stru_C3E8);
                          }
                        }

                        else
                        {
                          double v55 = (double)*(unint64_t *)&v53 / v13;
                        }

                        v56 = (os_log_s *)qword_C5F8;
                        if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 134217984;
                          *(double *)&unint64_t v134 = v55;
                          _os_log_debug_impl( &dword_0,  v56,  OS_LOG_TYPE_DEBUG,  "all_compressed_bytes_written_per_second_since_last_adjustment:%.2f",  buf,  0xCu);
                          *(void *)&double v57 = (unint64_t)(v30 * v55);
                          if (qword_C600 != -1) {
                            dispatch_once(&qword_C600, &stru_C3E8);
                          }
                        }

                        else
                        {
                          *(void *)&double v57 = (unint64_t)(v30 * v55);
                        }

                        v58 = (os_log_s *)qword_C5F8;
                        if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 134217984;
                          *(double *)&unint64_t v134 = v57;
                          _os_log_debug_impl( &dword_0,  v58,  OS_LOG_TYPE_DEBUG,  "projected_remaining_all_compressed_bytes_written_in_the_day:%llu",  buf,  0xCu);
                          *(void *)&double v59 = *(void *)&v57 + *(void *)&v112;
                          if (qword_C600 != -1) {
                            dispatch_once(&qword_C600, &stru_C3E8);
                          }
                        }

                        else
                        {
                          *(void *)&double v59 = *(void *)&v57 + *(void *)&v112;
                        }

                        if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
                          sub_6F20();
                        }
                        double v60 = (double)*(unint64_t *)&v111;
                        if ((double)*(unint64_t *)&v111 * 1.1 >= (double)*(unint64_t *)&v59
                          && (v60 * 0.9 <= (double)*(unint64_t *)&v59 || *(void *)&v110 <= v28))
                        {
                          if (qword_C628 != -1) {
                            dispatch_once(&qword_C628, &stru_C2E8);
                          }
                          v62 = (os_log_s *)qword_C620;
                          if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_INFO))
                          {
                            *(_DWORD *)buf = 134220032;
                            *(double *)&unint64_t v134 = v59;
                            __int16 v135 = 2048;
                            *(double *)v136 = v111;
                            *(_WORD *)&v136[8] = 2048;
                            double v137 = v11;
                            __int16 v138 = 2048;
                            double v139 = v13;
                            __int16 v140 = 2048;
                            double v141 = v112;
                            __int16 v142 = 2048;
                            double v143 = v53;
                            __int16 v144 = 2048;
                            double v145 = v39 * 100.0;
                            __int16 v146 = 2048;
                            *(double *)&uint64_t v147 = v110;
                            __int16 v148 = 2048;
                            double v149 = v111;
                            _os_log_impl( &dword_0,  v62,  OS_LOG_TYPE_INFO,  "PMI adjustment: Projected microstackshots data volume (%llu) is within the thresholds our of daily budget (%llu), not adjusting the PMI interval. time_since_cleanup:%.0fs time_sinc e_adjustment:%.0fs all_bytes_since_cleanup:%llu all_bytes_since_adjustment:%llu pmi_percen t:%.0f%% pmi_interval:%llu quota:%llu",  buf,  0x5Cu);
                          }

                          goto LABEL_205;
                        }

                        if (qword_C628 != -1) {
                          dispatch_once(&qword_C628, &stru_C2E8);
                        }
                        v63 = (os_log_s *)qword_C620;
                        if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 134220032;
                          *(double *)&unint64_t v134 = v59;
                          __int16 v135 = 2048;
                          *(double *)v136 = v111;
                          *(_WORD *)&v136[8] = 2048;
                          double v137 = v11;
                          __int16 v138 = 2048;
                          double v139 = v13;
                          __int16 v140 = 2048;
                          double v141 = v112;
                          __int16 v142 = 2048;
                          double v143 = v53;
                          __int16 v144 = 2048;
                          double v145 = v39 * 100.0;
                          __int16 v146 = 2048;
                          *(double *)&uint64_t v147 = v110;
                          __int16 v148 = 2048;
                          double v149 = v111;
                          _os_log_debug_impl( &dword_0,  v63,  OS_LOG_TYPE_DEBUG,  "PMI adjustment: Projected microstackshots data volume (%llu) is outside the thresholds our o f daily budget (%llu), checking if we can adjust the PMI interval. time_since_cleanup:%.0fs time_since_adjustment:%.0fs all_bytes_since_cleanup:%llu all_bytes_since_adjustment:%llu pmi _percent:%.0f%% pmi_interval:%llu quota:%llu",  buf,  0x5Cu);
                        }

                        if (qword_C600 != -1) {
                          dispatch_once(&qword_C600, &stru_C3E8);
                        }
                        double v37 = v110;
                        *(void *)&double v64 = *(void *)&v36 - v108;
                        v65 = (os_log_s *)qword_C5F8;
                        if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 134217984;
                          *(double *)&unint64_t v134 = v64;
                          _os_log_debug_impl( &dword_0,  v65,  OS_LOG_TYPE_DEBUG,  "nonpmi_uncompressed_bytes_written_since_last_adjustment:%llu",  buf,  0xCu);
                          double v66 = v48 / (double)*(unint64_t *)&v64;
                          if (qword_C600 != -1) {
                            dispatch_once(&qword_C600, &stru_C3E8);
                          }
                          double v37 = v110;
                        }

                        else
                        {
                          double v66 = v48 / (double)*(unint64_t *)&v64;
                        }

                        v67 = (os_log_s *)qword_C5F8;
                        if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 134217984;
                          *(double *)&unint64_t v134 = v66;
                          _os_log_debug_impl( &dword_0,  v67,  OS_LOG_TYPE_DEBUG,  "ratio_pmi_vs_nonpmi_since_last_adjustment:%.2f",  buf,  0xCu);
                          double v68 = (double)*(unint64_t *)&v37;
                          unint64_t v28 = (unint64_t)(v66 * (double)*(unint64_t *)&v37);
                          if (qword_C600 != -1) {
                            dispatch_once(&qword_C600, &stru_C3E8);
                          }
                          double v37 = v110;
                        }

                        else
                        {
                          double v68 = (double)*(unint64_t *)&v37;
                          unint64_t v28 = (unint64_t)(v66 * (double)*(unint64_t *)&v37);
                        }

                        v69 = (os_log_s *)qword_C5F8;
                        if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 134217984;
                          unint64_t v134 = v28;
                          _os_log_debug_impl( &dword_0,  v69,  OS_LOG_TYPE_DEBUG,  "pmi_interval_to_equal_nonpmi_datarate:%llu",  buf,  0xCu);
                          unint64_t v70 = (unint64_t)(v60 * 0.95);
                          if (qword_C600 != -1) {
                            dispatch_once(&qword_C600, &stru_C3E8);
                          }
                          double v37 = v110;
                        }

                        else
                        {
                          unint64_t v70 = (unint64_t)(v60 * 0.95);
                        }

                        v71 = (os_log_s *)qword_C5F8;
                        if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
                          sub_6E9C(v70, v71);
                        }
                        unint64_t v72 = v70 - *(void *)&v112;
                        if (v70 <= *(void *)&v112)
                        {
                          if (qword_C628 != -1) {
                            dispatch_once(&qword_C628, &stru_C2E8);
                          }
                          uint64_t v93 = qword_C620;
                          if (!os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR))
                          {
LABEL_173:
                            unint64_t v98 = 100000000000LL;
                            if (v28 > 0x174876E7FFLL && *(void *)&v37 == 100000000000LL)
                            {
                              if (qword_C628 != -1) {
                                dispatch_once(&qword_C628, &stru_C2E8);
                              }
                              v99 = (os_log_s *)qword_C620;
                              if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR))
                              {
                                *(_DWORD *)buf = 134220032;
                                unint64_t v134 = 100000000000LL;
                                __int16 v135 = 2048;
                                *(void *)v136 = v28;
                                *(_WORD *)&v136[8] = 2048;
                                double v137 = v11;
                                __int16 v138 = 2048;
                                double v139 = v13;
                                __int16 v140 = 2048;
                                double v141 = v112;
                                __int16 v142 = 2048;
                                double v143 = v53;
                                __int16 v144 = 2048;
                                double v145 = v39 * 100.0;
                                __int16 v146 = 2048;
                                uint64_t v147 = 100000000000LL;
                                __int16 v148 = 2048;
                                double v149 = v111;
                                _os_log_error_impl( &dword_0,  v99,  OS_LOG_TYPE_ERROR,  "PMI adjustment: Attempting to increase PMI microstackshots interval from %llu to %llu to fit into daily budget, but already at max interval!. time_since_cleanup:%.0fs time_ since_adjustment:%.0fs all_bytes_since_cleanup:%llu all_bytes_since_adjustment:%llu pm i_percent:%.0f%% pmi_interval:%llu quota:%llu",  buf,  0x5Cu);
                              }

                              goto LABEL_205;
                            }

                            if (v28 <= 0x174876E800LL)
                            {
                              unint64_t v98 = v28;
                            }

                            else
                            {
                              if (qword_C628 != -1) {
                                dispatch_once(&qword_C628, &stru_C2E8);
                              }
                              v100 = (os_log_s *)qword_C620;
                              if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_INFO))
                              {
                                *(_DWORD *)buf = 134218240;
                                unint64_t v134 = v28;
                                __int16 v135 = 2048;
                                *(void *)v136 = 100000000000LL;
                                _os_log_impl( &dword_0,  v100,  OS_LOG_TYPE_INFO,  "PMI adjustment: Decreasing desired PMI interval %llu to max %llu",  buf,  0x16u);
                              }
                            }

                            if (v98 < systemstats_get_pmi_cycle_interval())
                            {
                              if (qword_C628 != -1) {
                                dispatch_once(&qword_C628, &stru_C2E8);
                              }
                              v101 = (os_log_s *)qword_C620;
                              if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_INFO))
                              {
                                uint64_t pmi_cycle_interval = systemstats_get_pmi_cycle_interval();
                                *(_DWORD *)buf = 134218240;
                                unint64_t v134 = v98;
                                __int16 v135 = 2048;
                                *(void *)v136 = pmi_cycle_interval;
                                _os_log_impl( &dword_0,  v101,  OS_LOG_TYPE_INFO,  "PMI adjustment: Increasing desired PMI interval %llu to default %llu",  buf,  0x16u);
                              }

                              *(double *)&unint64_t v98 = COERCE_DOUBLE(systemstats_get_pmi_cycle_interval());
                            }

                            if (v98 <= *(void *)&v37)
                            {
                              if (v98 >= *(void *)&v37)
                              {
LABEL_204:
                                *((double *)a1 + 42) = *(double *)&v98;
                                sub_3B00((uint64_t)a1, 1);
                                goto LABEL_205;
                              }

                              if (qword_C628 != -1) {
                                dispatch_once(&qword_C628, &stru_C2E8);
                              }
                              v105 = (os_log_s *)qword_C620;
                              if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEFAULT))
                              {
                                *(_DWORD *)buf = 134220032;
                                *(double *)&unint64_t v134 = v37;
                                __int16 v135 = 2048;
                                *(void *)v136 = v98;
                                *(_WORD *)&v136[8] = 2048;
                                double v137 = v11;
                                __int16 v138 = 2048;
                                double v139 = v13;
                                __int16 v140 = 2048;
                                double v141 = v112;
                                __int16 v142 = 2048;
                                double v143 = v53;
                                __int16 v144 = 2048;
                                double v145 = v39 * 100.0;
                                __int16 v146 = 2048;
                                *(double *)&uint64_t v147 = v37;
                                __int16 v148 = 2048;
                                double v149 = v111;
                                _os_log_impl( &dword_0,  v105,  OS_LOG_TYPE_DEFAULT,  "PMI adjustment: Decreasing PMI microstackshots interval from %llu to %llu since we hav e space in the daily budget. time_since_cleanup:%.0fs time_since_adjustment:%.0fs all_ bytes_since_cleanup:%llu all_bytes_since_adjustment:%llu pmi_percent:%.0f%% pmi_interv al:%llu quota:%llu",  buf,  0x5Cu);
                              }

                              v104 = a1 + 55;
                            }

                            else
                            {
                              if (qword_C628 != -1) {
                                dispatch_once(&qword_C628, &stru_C2E8);
                              }
                              v103 = (os_log_s *)qword_C620;
                              if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEFAULT))
                              {
                                *(_DWORD *)buf = 134220032;
                                *(double *)&unint64_t v134 = v37;
                                __int16 v135 = 2048;
                                *(void *)v136 = v98;
                                *(_WORD *)&v136[8] = 2048;
                                double v137 = v11;
                                __int16 v138 = 2048;
                                double v139 = v13;
                                __int16 v140 = 2048;
                                double v141 = v112;
                                __int16 v142 = 2048;
                                double v143 = v53;
                                __int16 v144 = 2048;
                                double v145 = v39 * 100.0;
                                __int16 v146 = 2048;
                                *(double *)&uint64_t v147 = v37;
                                __int16 v148 = 2048;
                                double v149 = v111;
                                _os_log_impl( &dword_0,  v103,  OS_LOG_TYPE_DEFAULT,  "PMI adjustment: Increasing PMI microstackshots interval from %llu to %llu to fit into daily budget. time_since_cleanup:%.0fs time_since_adjustment:%.0fs all_bytes_since_cle anup:%llu all_bytes_since_adjustment:%llu pmi_percent:%.0f%% pmi_interval:%llu quota:%llu",  buf,  0x5Cu);
                              }

                              v104 = a1 + 56;
                            }

                            ++*v104;
                            goto LABEL_204;
                          }

                          *(_DWORD *)buf = 134220288;
                          *(double *)&unint64_t v134 = v112;
                          __int16 v135 = 2048;
                          *(void *)v136 = v70;
                          *(_WORD *)&v136[8] = 2048;
                          double v137 = *(double *)&v28;
                          __int16 v138 = 2048;
                          double v139 = v11;
                          __int16 v140 = 2048;
                          double v141 = v13;
                          __int16 v142 = 2048;
                          double v143 = v112;
                          __int16 v144 = 2048;
                          double v145 = v53;
                          __int16 v146 = 2048;
                          *(double *)&uint64_t v147 = v39 * 100.0;
                          __int16 v148 = 2048;
                          double v149 = v37;
                          __int16 v150 = 2048;
                          double v151 = v111;
                          v94 = "PMI adjustment: Already exceeded daily target (%llu vs target %llu), setting PMI interva"
                                "l to be half of all microstackshot datarate: %llu. time_since_cleanup:%.0fs time_since_a"
                                "djustment:%.0fs all_bytes_since_cleanup:%llu all_bytes_since_adjustment:%llu pmi_percent"
                                ":%.0f%% pmi_interval:%llu quota:%llu";
                          v95 = (os_log_s *)v93;
                        }

                        else
                        {
                          if (qword_C600 != -1) {
                            dispatch_once(&qword_C600, &stru_C3E8);
                          }
                          if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
                            sub_6E08();
                          }
                          v73 = (os_log_s *)qword_C5F8;
                          if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)buf = 134217984;
                            unint64_t v134 = (unint64_t)(v51 * (double)v72);
                            _os_log_debug_impl( &dword_0,  v73,  OS_LOG_TYPE_DEBUG,  "target_remaining_all_uncompressed_bytes_written_in_the_day:%llu",  buf,  0xCu);
                            double v74 = (double)*(unint64_t *)&v57;
                            *(void *)&double v75 = (unint64_t)(v39 * (double)*(unint64_t *)&v57);
                            if (qword_C600 != -1) {
                              dispatch_once(&qword_C600, &stru_C3E8);
                            }
                          }

                          else
                          {
                            double v74 = (double)*(unint64_t *)&v57;
                            *(void *)&double v75 = (unint64_t)(v39 * (double)*(unint64_t *)&v57);
                          }

                          v76 = (os_log_s *)qword_C5F8;
                          if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)buf = 134217984;
                            *(double *)&unint64_t v134 = v75;
                            _os_log_debug_impl( &dword_0,  v76,  OS_LOG_TYPE_DEBUG,  "projected_pmi_remaining_compressed_bytes_written_in_the_day:%llu",  buf,  0xCu);
                            double v77 = 1.0 - v39;
                            if (qword_C600 != -1) {
                              dispatch_once(&qword_C600, &stru_C3E8);
                            }
                          }

                          else
                          {
                            double v77 = 1.0 - v39;
                          }

                          v78 = (os_log_s *)qword_C5F8;
                          if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)buf = 134217984;
                            *(double *)&unint64_t v134 = v77;
                            _os_log_debug_impl( &dword_0,  v78,  OS_LOG_TYPE_DEBUG,  "ratio_of_nonpmi_vs_all_since_last_adjustment:%.2f",  buf,  0xCu);
                            unint64_t v79 = (unint64_t)(v74 * v77);
                            if (qword_C600 != -1) {
                              dispatch_once(&qword_C600, &stru_C3E8);
                            }
                          }

                          else
                          {
                            unint64_t v79 = (unint64_t)(v74 * v77);
                          }

                          if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
                            sub_6DA8();
                          }
                          if (v72 > 2 * v79)
                          {
                            double v37 = v110;
                            if (qword_C600 != -1) {
                              dispatch_once(&qword_C600, &stru_C3E8);
                            }
                            *(void *)&double v80 = v72 - v79;
                            v81 = (os_log_s *)qword_C5F8;
                            if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
                            {
                              *(_DWORD *)buf = 134217984;
                              *(double *)&unint64_t v134 = v80;
                              _os_log_debug_impl( &dword_0,  v81,  OS_LOG_TYPE_DEBUG,  "target_pmi_remaining_compressed_bytes_written_in_the_day:%llu",  buf,  0xCu);
                              double v109 = (double)*(unint64_t *)&v80 / (double)*(unint64_t *)&v75;
                              if (qword_C600 != -1)
                              {
                                dispatch_once(&qword_C600, &stru_C3E8);
                                double v37 = v110;
                                goto LABEL_145;
                              }

                              double v82 = (double)*(unint64_t *)&v80 / (double)*(unint64_t *)&v75;
                              double v37 = v110;
                            }

                            else
                            {
                              double v82 = (double)*(unint64_t *)&v80 / (double)*(unint64_t *)&v75;
                            }

                            double v109 = v82;
LABEL_145:
                            v83 = (os_log_s *)qword_C5F8;
                            if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
                              sub_6D40(v83, v84, v85, v86, v87, v88, v89, v90);
                            }
                            if (qword_C628 != -1) {
                              dispatch_once(&qword_C628, &stru_C2E8);
                            }
                            unint64_t v28 = (unint64_t)(v68 / v109);
                            v91 = (os_log_s *)qword_C620;
                            if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_INFO))
                            {
                              *(_DWORD *)buf = 134219776;
                              unint64_t v134 = (unint64_t)(v68 / v109);
                              __int16 v135 = 2048;
                              *(double *)v136 = v11;
                              *(_WORD *)&v136[8] = 2048;
                              double v137 = v13;
                              __int16 v138 = 2048;
                              double v139 = v112;
                              __int16 v140 = 2048;
                              double v141 = v53;
                              __int16 v142 = 2048;
                              double v143 = v39 * 100.0;
                              __int16 v144 = 2048;
                              double v145 = v37;
                              __int16 v146 = 2048;
                              *(double *)&uint64_t v147 = v111;
                              _os_log_impl( &dword_0,  v91,  OS_LOG_TYPE_INFO,  "PMI adjustment: Calculated new PMI microstackshots interval to fit into daily budget: %l lu. time_since_cleanup:%.0fs time_since_adjustment:%.0fs all_bytes_since_cleanup:%llu al l_bytes_since_adjustment:%llu pmi_percent:%.0f%% pmi_interval:%llu quota:%llu",  buf,  0x52u);
                            }

                            goto LABEL_173;
                          }

                          if (qword_C628 != -1) {
                            dispatch_once(&qword_C628, &stru_C2E8);
                          }
                          uint64_t v107 = qword_C620;
                          if (!os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR))
                          {
                            double v37 = v110;
                            goto LABEL_173;
                          }

                          *(_DWORD *)buf = 134220288;
                          unint64_t v134 = v79;
                          __int16 v135 = 2048;
                          *(void *)v136 = v72;
                          *(_WORD *)&v136[8] = 2048;
                          double v137 = *(double *)&v28;
                          __int16 v138 = 2048;
                          double v139 = v11;
                          __int16 v140 = 2048;
                          double v141 = v13;
                          __int16 v142 = 2048;
                          double v143 = v112;
                          __int16 v144 = 2048;
                          double v145 = v53;
                          __int16 v146 = 2048;
                          *(double *)&uint64_t v147 = v39 * 100.0;
                          __int16 v148 = 2048;
                          double v149 = v110;
                          __int16 v150 = 2048;
                          double v151 = v111;
                          v94 = "PMI adjustment: Non-PMI microstackshots alone are on track exceed half of daily target ("
                                "%llu vs target remaining %llu), setting PMI interval to be half of all microstackshot da"
                                "tarate: %llu. time_since_cleanup:%.0fs time_since_adjustment:%.0fs all_bytes_since_clean"
                                "up:%llu all_bytes_since_adjustment:%llu pmi_percent:%.0f%% pmi_interval:%llu quota:%llu";
                          v95 = (os_log_s *)v107;
                          double v37 = v110;
                        }

                        _os_log_error_impl(&dword_0, v95, OS_LOG_TYPE_ERROR, v94, buf, 0x66u);
                        goto LABEL_173;
                      }
                    }

                    else if (v44)
                    {
                      goto LABEL_80;
                    }

                    if (qword_C628 != -1) {
                      dispatch_once(&qword_C628, &stru_C2E8);
                    }
                    double v37 = v110;
                    uint64_t v96 = qword_C620;
                    double v39 = 0.0;
                    if (!os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_172;
                    }
                    double v97 = *v33;
                    *(_DWORD *)buf = 134220032;
                    *(double *)&unint64_t v134 = v97;
                    __int16 v135 = 2048;
                    *(void *)v136 = v28;
                    *(_WORD *)&v136[8] = 2048;
                    double v137 = v11;
                    __int16 v138 = 2048;
                    double v139 = v13;
                    __int16 v140 = 2048;
                    double v141 = v112;
                    __int16 v142 = 2048;
                    double v143 = 0.0;
                    __int16 v144 = 2048;
                    double v145 = 0.0;
                    __int16 v146 = 2048;
                    *(double *)&uint64_t v147 = v110;
                    __int16 v148 = 2048;
                    double v149 = v111;
                    v40 = "PMI adjustment: No PMI microstackshots since last cleanup (%llu of other types), resetting PMI"
                          " interval to %llu. time_since_cleanup:%.0fs time_since_adjustment:%.0fs all_bytes_since_cleanu"
                          "p:%llu all_bytes_since_adjustment:%llu pmi_percent:%.0f%% pmi_interval:%llu quota:%llu";
                    v47 = (os_log_s *)v96;
LABEL_170:
                    uint32_t v92 = 92;
                    goto LABEL_171;
                  }
                }

                else if (v34)
                {
                  goto LABEL_65;
                }

                if (qword_C628 != -1) {
                  dispatch_once(&qword_C628, &stru_C2E8);
                }
                double v37 = v110;
                uint64_t v38 = qword_C620;
                double v39 = 0.0;
                if (!os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_172;
                }
                *(_DWORD *)buf = 134219776;
                unint64_t v134 = v28;
                __int16 v135 = 2048;
                *(double *)v136 = v11;
                *(_WORD *)&v136[8] = 2048;
                double v137 = v13;
                __int16 v138 = 2048;
                double v139 = v112;
                __int16 v140 = 2048;
                double v141 = 0.0;
                __int16 v142 = 2048;
                double v143 = 0.0;
                __int16 v144 = 2048;
                double v145 = v110;
                __int16 v146 = 2048;
                *(double *)&uint64_t v147 = v111;
                v40 = "PMI adjustment: No microstackshots since last cleanup, resetting PMI interval to %llu. time_since_"
                      "cleanup:%.0fs time_since_adjustment:%.0fs all_bytes_since_cleanup:%llu all_bytes_since_adjustment:"
                      "%llu pmi_percent:%.0f%% pmi_interval:%llu quota:%llu";
LABEL_160:
                v47 = (os_log_s *)v38;
                uint32_t v92 = 82;
LABEL_171:
                _os_log_error_impl(&dword_0, v47, OS_LOG_TYPE_ERROR, v40, buf, v92);
LABEL_172:
                double v53 = 0.0;
                goto LABEL_173;
              }
            }

            else
            {
              double v30 = 86400.0 - v11;
            }

            v31 = &CFDataGetBytePtr_ptr;
            goto LABEL_61;
          }
        }

        else
        {
          double v14 = *((double *)a1 + 41);
          double v111 = *(double *)(*(void *)(v9 + 8) + 32LL);
          double v112 = *(double *)(v9 + 120);
          double v13 = (double)(v8 - v10) / 1000.0;
          if (v11 + 1800.0 < 86400.0) {
            goto LABEL_46;
          }
        }

        if (qword_C628 != -1) {
          dispatch_once(&qword_C628, &stru_C2E8);
        }
        uint64_t v27 = qword_C620;
        if (!os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_205;
        }
        *(_DWORD *)buf = 134219776;
        *(double *)&unint64_t v134 = 86400.0 - v11;
        __int16 v135 = 2048;
        *(double *)v136 = v11;
        *(_WORD *)&v136[8] = 2048;
        double v137 = v13;
        __int16 v138 = 2048;
        double v139 = v112;
        __int16 v140 = 2048;
        double v141 = 0.0;
        __int16 v142 = 2048;
        double v143 = 0.0;
        __int16 v144 = 2048;
        double v145 = v14;
        __int16 v146 = 2048;
        *(double *)&uint64_t v147 = v111;
        v24 = "PMI adjustment: Cleanup expected in %.0fs, not checking daily budget. time_since_cleanup:%.0fs time_since_"
              "adjustment:%.0fs all_bytes_since_cleanup:%llu all_bytes_since_adjustment:%llu pmi_percent:%.0f%% pmi_inter"
              "val:%llu quota:%llu";
        v25 = (os_log_s *)v27;
        uint32_t v26 = 82;
LABEL_55:
        _os_log_debug_impl(&dword_0, v25, OS_LOG_TYPE_DEBUG, v24, buf, v26);
LABEL_205:
        *((_BYTE *)a1 + 320) = 1;
        v106 = (dispatch_queue_s *)a1[2];
        block[0] = _NSConcreteStackBlock;
        block[1] = 0x40000000LL;
        block[2] = sub_69C4;
        block[3] = &unk_C548;
        block[4] = a1;
        dispatch_async(v106, block);
        _Block_object_dispose(&v115, 8);
        _Block_object_dispose(&v119, 8);
        _Block_object_dispose(&v123, 8);
        _Block_object_dispose(v127, 8);
        _Block_object_dispose(v129, 8);
        _Block_object_dispose(v131, 8);
        return;
      }
    }

    else if (!a2)
    {
      goto LABEL_22;
    }

    uint64_t v7 = systemstats_stream_flush(*a1);
    goto LABEL_22;
  }

  if (qword_C628 != -1) {
    dispatch_once(&qword_C628, &stru_C2E8);
  }
  if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEBUG)) {
    sub_6BE4();
  }
}

void sub_34F8(id a1)
{
  qword_C620 = (uint64_t)os_log_create("com.apple.systemstats", "telemetry_plugin");
}

void sub_3524(uint64_t a1)
{
  kern_return_t v6;
  kern_return_t inserted;
  mach_port_t v8;
  kern_return_t v9;
  kern_return_t v10;
  dispatch_source_s *v11;
  dispatch_block_t v12;
  uint64_t v13;
  dispatch_queue_s *v14;
  uint32_t v15;
  dispatch_time_t v16;
  dispatch_source_s *v17;
  dispatch_queue_s *v18;
  uint32_t v19;
  uint64_t v20;
  uint32_t v21;
  uint32_t v22;
  char v23;
  char v24;
  char v25;
  char v26;
  uint64_t v27;
  mach_port_t poly[2];
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  uint64_t v32;
  void **block;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  int v2 = *(_DWORD *)(a1 + 48);
  if (v2 != -1) {
    notify_cancel(v2);
  }
  _systemstats_boot(*(void *)(a1 + 32), 0LL);
  systemstats_unlink_if_present(*(void *)(a1 + 32), "snapshots.db");
  systemstats_unlink_if_present(*(void *)(a1 + 32), "snapshots.db-shm");
  systemstats_unlink_if_present(*(void *)(a1 + 32), "snapshots.db-wal");
  qword_C5D0 = (uint64_t)calloc(1uLL, 0x1C8uLL);
  *(void *)(qword_C5D0 + 16) = *(void *)(a1 + 40);
  uint64_t v3 = _systemstats_stream_create(16LL, *(void *)(a1 + 32), 20180126LL);
  mach_port_context_t v4 = qword_C5D0;
  *(void *)qword_C5D0 = v3;
  if (!v3)
  {
    if (qword_C628 != -1) {
      dispatch_once(&qword_C628, &stru_C2E8);
    }
    if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
      sub_7130();
    }
    goto LABEL_41;
  }

  *(_DWORD *)(v4 + 32) = 0x10000;
  uint64_t v5 = malloc(0x10000uLL);
  *(void *)(v4 + 24) = v5;
  if (!v5)
  {
    if (qword_C628 != -1) {
      dispatch_once(&qword_C628, &stru_C2E8);
    }
    if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
      sub_715C();
    }
    goto LABEL_40;
  }

  int v6 = mach_port_allocate(mach_task_self_, 1u, poly);
  if (v6)
  {
    sub_7334(v6);
    if ((v23 & 1) == 0) {
      goto LABEL_35;
    }
    goto LABEL_37;
  }

  inserted = mach_port_insert_right(mach_task_self_, poly[0], poly[0], 0x14u);
  if (inserted)
  {
    sub_72B4(inserted);
    if ((v24 & 1) == 0) {
      goto LABEL_35;
    }
    goto LABEL_37;
  }

  uint64_t v8 = mach_host_self();
  uint64_t v9 = host_set_special_port(v8, 20, poly[0]);
  if (v9)
  {
    sub_7234(v9);
    if ((v25 & 1) == 0) {
      goto LABEL_35;
    }
    goto LABEL_37;
  }

  unint64_t v10 = mach_port_set_context(mach_task_self_, poly[0], v4);
  if (v10)
  {
    sub_71B4(v10);
    if ((v26 & 1) == 0)
    {
LABEL_35:
      if (qword_C628 != -1) {
        dispatch_once(&qword_C628, &stru_C2E8);
      }
    }

LABEL_37:
    if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
      sub_7188();
    }
    uint64_t v27 = qword_C5D0;
    free(*(void **)(qword_C5D0 + 24));
    *(void *)(v27 + 24) = 0LL;
LABEL_40:
    systemstats_stream_delete(*(void *)qword_C5D0);
    *(void *)qword_C5D0 = 0LL;
LABEL_41:
    free((void *)qword_C5D0);
    return;
  }

  double v11 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_mach_recv,  poly[0],  0LL,  *(dispatch_queue_t *)(v4 + 16));
  *(void *)(v4 + 288) = v11;
  block = _NSConcreteStackBlock;
  unint64_t v34 = 0x40000000LL;
  uint64_t v35 = sub_3EBC;
  double v36 = &unk_C368;
  LODWORD(v37) = poly[0];
  unint64_t v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, &block);
  dispatch_source_set_event_handler(v11, v12);
  dispatch_resume(*(dispatch_object_t *)(v4 + 288));
  block = _NSConcreteStackBlock;
  unint64_t v34 = 0x40000000LL;
  uint64_t v35 = sub_3EF0;
  double v36 = &unk_C3A8;
  double v37 = qword_C5D0;
  if (qword_C5E0 != -1) {
    dispatch_once(&qword_C5E0, &block);
  }
  double v13 = qword_C5D0;
  double v14 = *(dispatch_queue_s **)(qword_C5D0 + 16);
  block = _NSConcreteStackBlock;
  unint64_t v34 = 0x40000000LL;
  uint64_t v35 = sub_5E28;
  double v36 = &unk_C4A0;
  double v37 = qword_C5D0;
  v15 = notify_register_dispatch("com.apple.da.tasking_changed", (int *)(qword_C5D0 + 308), v14, &block);
  if (v15) {
    _os_assumes_log(v15);
  }
  *(void *)(v13 + 296) = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  *(dispatch_queue_t *)(v13 + 16));
  v16 = dispatch_time(0LL, 86400000000000LL);
  dispatch_source_set_timer(*(dispatch_source_t *)(v13 + 296), v16, 0x4E94914F0000uLL, 0x8BB2C97000uLL);
  uint64_t v17 = *(dispatch_source_s **)(v13 + 296);
  *(void *)poly = _NSConcreteStackBlock;
  v29 = 0x40000000LL;
  double v30 = sub_5EAC;
  v31 = &unk_C4C0;
  v32 = v13;
  dispatch_source_set_event_handler(v17, poly);
  dispatch_resume(*(dispatch_object_t *)(v13 + 296));
  uint64_t v18 = *(dispatch_queue_s **)(qword_C5D0 + 16);
  block = _NSConcreteStackBlock;
  unint64_t v34 = 0x40000000LL;
  uint64_t v35 = sub_5EB4;
  double v36 = &unk_C4E0;
  double v37 = qword_C5D0;
  uint64_t v19 = notify_register_dispatch("com.apple.telemetry.immediate", (int *)(qword_C5D0 + 304), v18, &block);
  if (v19) {
    _os_assumes_log(v19);
  }
  uint64_t v20 = qword_C5D0;
  block = _NSConcreteStackBlock;
  unint64_t v34 = 0x40000000LL;
  uint64_t v35 = sub_5F20;
  double v36 = &unk_C500;
  double v37 = qword_C5D0;
  uint64_t v21 = notify_register_dispatch( "com.apple.system.powersources.source",  (int *)(qword_C5D0 + 312),  *(dispatch_queue_t *)(qword_C5D0 + 16),  &block);
  if (v21) {
    _os_assumes_log(v21);
  }
  uint64_t v22 = notify_register_dispatch( "com.apple.springboard.lockstate",  (int *)(v20 + 316),  *(dispatch_queue_t *)(v20 + 16),  &block);
  if (v22) {
    _os_assumes_log(v22);
  }
  notify_suspend(*(_DWORD *)(v20 + 312));
  notify_suspend(*(_DWORD *)(v20 + 316));
  dispatch_async(*(dispatch_queue_t *)(a1 + 40), &stru_C328);
}

void sub_3A14(id a1)
{
}

void sub_3A48(uint64_t a1)
{
  uint32_t state = notify_get_state(*(_DWORD *)(a1 + 316), &state64);
  if (state64) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = state == 0;
  }
  if (v3) {
    int v4 = 3;
  }
  else {
    int v4 = 1;
  }
  if (IOPSGetTimeRemainingEstimate() != -2.0) {
    v4 |= 4u;
  }
  if (*(unsigned __int16 *)(a1 + 324) != v4)
  {
    sub_1798((void *)a1, 0);
    *(_WORD *)(a1 + 324) = v4;
  }

uint64_t sub_3ABC(uint64_t a1)
{
  uint64_t pmi_cycle_interval = systemstats_get_pmi_cycle_interval();
  *(void *)(a1 + 336) = pmi_cycle_interval;
  uint64_t result = systemstats_persistence_is_allowed();
  *(_BYTE *)(a1 + 321) = result;
  return result;
}

void sub_3B00(uint64_t a1, int a2)
{
  char v2 = a2;
  if (a2)
  {
    sub_4004(a1);
    uint64_t v4 = *(void *)(a1 + 336);
  }

  else
  {
    if (*(void *)(a1 + 328) == *(void *)(a1 + 336)) {
      goto LABEL_29;
    }
    sub_4004(a1);
    uint64_t v4 = *(void *)(a1 + 336);
    if (*(void *)(a1 + 328) == v4) {
      goto LABEL_29;
    }
  }

  if (!v4)
  {
    if (qword_C628 != -1) {
      dispatch_once(&qword_C628, &stru_C2E8);
    }
    uint64_t v5 = (os_log_s *)qword_C620;
    if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl( &dword_0,  v5,  OS_LOG_TYPE_DEFAULT,  "Disabling cycle-count-based microstackshots because settings changed.",  (uint8_t *)&v14,  2u);
    }
  }

  if (__telemetry(3LL, 0LL, 0LL, 0LL, 0LL, 0LL))
  {
    if (*(void *)(a1 + 328))
    {
      if (qword_C628 != -1) {
        dispatch_once(&qword_C628, &stru_C2E8);
      }
      int v6 = (os_log_s *)qword_C620;
      if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
        sub_7434(v6);
      }
    }
  }

  else
  {
    *(void *)(a1 + 328) = 0LL;
  }

  if ((v2 & 1) != 0 || *(void *)(a1 + 328) != *(void *)(a1 + 336))
  {
    if (qword_C628 != -1) {
      dispatch_once(&qword_C628, &stru_C2E8);
    }
    uint64_t v7 = (os_log_s *)qword_C620;
    if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 336);
      int v14 = 134217984;
      uint64_t v15 = v8;
      _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "Enabling cycle-count-based microstackshots at %llu cycles.",  (uint8_t *)&v14,  0xCu);
    }

    if (__telemetry(3LL, 2LL, *(void *)(a1 + 336), 0LL, 0LL, 0LL))
    {
      *(_BYTE *)(a1 + 408) = 1;
      if (qword_C628 != -1) {
        dispatch_once(&qword_C628, &stru_C2E8);
      }
      uint64_t v9 = (os_log_s *)qword_C620;
      if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
        sub_73B4(v9);
      }
    }

    else
    {
      *(void *)(a1 + 328) = *(void *)(a1 + 336);
      *(_DWORD *)(a1 + 352) = *(_DWORD *)(a1 + 356) + 1;
      uint64_t v10 = *(void *)(a1 + 200);
      *(void *)(a1 + 368) = *(void *)(a1 + 72);
      *(void *)(a1 + 376) = v10;
      *(void *)(a1 + 384) = now_in_absolute_milliseconds();
    }
  }

LABEL_29:
  if (*(_BYTE *)(a1 + 321))
  {
    if (*(_BYTE *)(a1 + 322)) {
      goto LABEL_43;
    }
    if (qword_C628 != -1) {
      dispatch_once(&qword_C628, &stru_C2E8);
    }
    double v11 = (os_log_s *)qword_C620;
    if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_DEFAULT,  "Enabling state change notifications since persistence is allowed.",  (uint8_t *)&v14,  2u);
    }

    notify_resume(*(_DWORD *)(a1 + 312));
    notify_resume(*(_DWORD *)(a1 + 316));
    char v12 = 1;
  }

  else
  {
    if (!*(_BYTE *)(a1 + 322)) {
      goto LABEL_43;
    }
    if (qword_C628 != -1) {
      dispatch_once(&qword_C628, &stru_C2E8);
    }
    double v13 = (os_log_s *)qword_C620;
    if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_DEFAULT,  "Disabling state change notifications since persistence is disallowed.",  (uint8_t *)&v14,  2u);
    }

    notify_suspend(*(_DWORD *)(a1 + 312));
    notify_suspend(*(_DWORD *)(a1 + 316));
    char v12 = 0;
  }

  *(_BYTE *)(a1 + 322) = v12;
LABEL_43:
  if (*(void *)(a1 + 328))
  {
    if (!*(void *)(a1 + 344)) {
      *(void *)(a1 + 344) = 1LL;
    }
  }

  unint64_t v79 = (os_log_s *)qword_C620;
  if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67111424;
    *(_DWORD *)&uint8_t buf[4] = v14;
    *(_WORD *)&buf[8] = 2048;
    *(void *)&buf[10] = v7;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = a2;
    *(_WORD *)&buf[28] = 2048;
    *(void *)&buf[30] = v6;
    *(_WORD *)&buf[38] = 2048;
    *(double *)&buf[40] = (double)v8 / (double)v9;
    *(_WORD *)&buf[48] = 2048;
    *(void *)&buf[50] = v83;
    *(_WORD *)&buf[58] = 2048;
    *(void *)&buf[60] = v82;
    *(_WORD *)&buf[68] = 2048;
    *(void *)&buf[70] = v81;
    *(_WORD *)&buf[78] = 2048;
    *(void *)&buf[80] = pmi_cycle_interval;
    *(_WORD *)&buf[88] = 2048;
    *(void *)&buf[90] = v13;
    _os_log_impl( &dword_0,  v79,  OS_LOG_TYPE_DEFAULT,  "Quota telemetry - exceeded_quota:%d quota:%llu bytes_written:%llu time_since_last_cleanup_s:%llus ratio_pmi:%.2f n um_interval_increases:%llu num_interval_decreases:%llu ending_pmi_interval:%llu default_pmi_interval:%llu time_sin ce_last_adjustment_s:%llus",  buf,  0x62u);
  }

  *(void *)buf = _NSConcreteStackBlock;
  *(void *)&buf[8] = 0x40000000LL;
  *(void *)&uint8_t buf[16] = sub_5CBC;
  *(void *)&buf[24] = &unk_C480;
  *(void *)&buf[32] = v14;
  *(void *)&buf[40] = v7;
  *(void *)&buf[48] = a2;
  *(void *)&buf[56] = v6;
  *(double *)&buf[64] = (double)v8 / (double)v9;
  *(void *)&buf[72] = v83;
  *(void *)&buf[80] = v82;
  *(void *)&buf[88] = v81;
  *(void *)&buf[96] = pmi_cycle_interval;
  uint64_t v85 = v13;
  return analytics_send_event_lazy("com.apple.microstackshots.diskQuota", buf);
}

void sub_3EBC(uint64_t a1)
{
  mach_msg_return_t v1;
  v1 = mach_msg_server_once( (BOOLean_t (__cdecl *)(mach_msg_header_t *, mach_msg_header_t *))sub_6ACC,  0x68u,  *(_DWORD *)(a1 + 32),  0);
  if (v1) {
    sub_74B4(v1);
  }
}

void sub_3EF0(uint64_t a1)
{
  qword_C5E8 = os_transaction_create("pending microstackshots");
  qword_C5F0 = (uint64_t)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  0xFuLL,  0LL,  *(dispatch_queue_t *)(*(void *)(a1 + 32) + 16LL));
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000LL;
  handler[2] = sub_3F90;
  handler[3] = &unk_C388;
  handler[4] = *(void *)(a1 + 32);
  dispatch_source_set_event_handler((dispatch_source_t)qword_C5F0, handler);
  dispatch_activate((dispatch_object_t)qword_C5F0);
}

void sub_3F90(uint64_t a1)
{
  uint64_t v3 = now_in_absolute_milliseconds(v2);
  sub_4D98( *(void **)(a1 + 32),  *(void *)(**(void **)(a1 + 32) + 120LL),  (double)(unint64_t)(v3 - *(void *)(**(void **)(a1 + 32) + 168LL)) / 1000.0);
  if (qword_C5E8)
  {
    os_release((void *)qword_C5E8);
    qword_C5E8 = 0LL;
  }

void sub_4004(uint64_t a1)
{
  mach_port_t v2 = mach_host_self();
  mach_msg_type_number_t host_info64_outCnt = 4;
  if (host_statistics64(v2, 3, (host_info64_t)host_info64_out, &host_info64_outCnt))
  {
    if (qword_C628 != -1) {
      dispatch_once(&qword_C628, &stru_C2E8);
    }
    if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
      sub_7AA4();
    }
    unint64_t v3 = 0LL;
  }

  else
  {
    unint64_t v3 = 10000000 * (*(unsigned int *)&host_info64_out[4] + (unint64_t)*(unsigned int *)host_info64_out);
  }

  if (*(void *)(a1 + 328))
  {
    if (qword_C600 != -1) {
      dispatch_once(&qword_C600, &stru_C3E8);
    }
    if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
      sub_7A74();
    }
    if (!*(void *)(a1 + 328))
    {
      if (qword_C600 != -1) {
        dispatch_once(&qword_C600, &stru_C3E8);
      }
      if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
        sub_7530();
      }
      int v14 = 0;
      int v50 = 0;
      int v15 = 0;
      int v55 = 0;
      uint64_t v54 = 0LL;
      int v53 = 0;
      uint64_t v51 = 0LL;
      unint64_t v52 = 0LL;
      unint64_t v16 = 0LL;
      uint64_t v17 = 0LL;
      uint64_t v18 = 0LL;
      unint64_t v19 = 0LL;
      uint64_t v20 = 0LL;
      goto LABEL_39;
    }

    if (!*(void *)(a1 + 344))
    {
      if (qword_C628 != -1) {
        dispatch_once(&qword_C628, &stru_C2E8);
      }
      double v13 = &CFDataGetBytePtr_ptr;
      if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
        sub_7560();
      }
      goto LABEL_44;
    }

    unint64_t v4 = *(void *)(a1 + 416);
    if (qword_C600 != -1) {
      dispatch_once(&qword_C600, &stru_C3E8);
    }
    uint64_t v5 = (os_log_s *)qword_C5F8;
    if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)host_info64_out = 134217984;
      *(void *)&host_info64_out[4] = v4;
      _os_log_debug_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "last_check_pmi_samples_recorded:%llu", host_info64_out, 0xCu);
      unint64_t v6 = *(void *)(a1 + 424);
      if (qword_C600 != -1) {
        dispatch_once(&qword_C600, &stru_C3E8);
      }
    }

    else
    {
      unint64_t v6 = *(void *)(a1 + 424);
    }

    uint64_t v7 = (os_log_s *)qword_C5F8;
    if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)host_info64_out = 134217984;
      *(void *)&host_info64_out[4] = v6;
      _os_log_debug_impl(&dword_0, v7, OS_LOG_TYPE_DEBUG, "last_check_pmi_samples_skipped:%llu", host_info64_out, 0xCu);
      unint64_t v8 = *(void *)(a1 + 432);
      if (qword_C600 != -1) {
        dispatch_once(&qword_C600, &stru_C3E8);
      }
    }

    else
    {
      unint64_t v8 = *(void *)(a1 + 432);
    }

    uint64_t v9 = (os_log_s *)qword_C5F8;
    if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)host_info64_out = 134217984;
      *(void *)&host_info64_out[4] = v8;
      _os_log_debug_impl(&dword_0, v9, OS_LOG_TYPE_DEBUG, "last_check_host_cpu_time_ns:%llu", host_info64_out, 0xCu);
      unint64_t v10 = *(void *)(a1 + 344) - 1LL;
      if (qword_C600 != -1) {
        dispatch_once(&qword_C600, &stru_C3E8);
      }
    }

    else
    {
      unint64_t v10 = *(void *)(a1 + 344) - 1LL;
    }

    double v11 = (os_log_s *)qword_C5F8;
    if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)host_info64_out = 134217984;
      *(void *)&host_info64_out[4] = v10;
      _os_log_debug_impl(&dword_0, v11, OS_LOG_TYPE_DEBUG, "current_pmi_samples_recorded:%llu", host_info64_out, 0xCu);
      unint64_t v12 = *(void *)(a1 + 360);
      if (qword_C600 != -1) {
        dispatch_once(&qword_C600, &stru_C3E8);
      }
    }

    else
    {
      unint64_t v12 = *(void *)(a1 + 360);
    }

    if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
      sub_79E0();
    }
    if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
    {
      sub_7980();
      if (!v3) {
        goto LABEL_63;
      }
    }

    else if (!v3)
    {
      goto LABEL_63;
    }

    if (!v8)
    {
      if (qword_C628 != -1) {
        dispatch_once(&qword_C628, &stru_C2E8);
      }
      double v13 = &CFDataGetBytePtr_ptr;
      if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_FAULT)) {
        sub_758C();
      }
LABEL_44:
      int v14 = 0;
      int v50 = 0;
      int v15 = 0;
      int v55 = 0;
      uint64_t v54 = 0LL;
      int v53 = 0;
      uint64_t v51 = 0LL;
      unint64_t v52 = 0LL;
      unint64_t v16 = 0LL;
      uint64_t v17 = 0LL;
      uint64_t v18 = 0LL;
      unint64_t v19 = 0LL;
      uint64_t v20 = 0LL;
      goto LABEL_45;
    }

LABEL_63:
    unint64_t v48 = v8;
    uint64_t v20 = *(void *)(a1 + 328);
    uint64_t v26 = now_in_absolute_milliseconds();
    uint64_t v27 = *(void *)(a1 + 384);
    if (!v27) {
      uint64_t v27 = *(void *)(*(void *)a1 + 168LL);
    }
    double v28 = (double)(unint64_t)(v26 - v27) / 1000.0;
    uint64_t v51 = *(void *)(a1 + 392);
    unint64_t v52 = *(void *)(a1 + 400);
    int v53 = *(unsigned __int8 *)(a1 + 408);
    LODWORD(v54) = *(unsigned __int8 *)(a1 + 409);
    HIDWORD(v54) = *(unsigned __int8 *)(a1 + 410);
    int v55 = *(unsigned __int8 *)(a1 + 411);
    uint64_t v18 = (void *)(v10 - v4);
    BOOL v46 = v10 < v4;
    if (v10 >= v4)
    {
      if (qword_C600 != -1) {
        dispatch_once(&qword_C600, &stru_C3E8);
      }
      if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
        sub_7920();
      }
      int v50 = 0;
    }

    else
    {
      if (qword_C628 != -1) {
        dispatch_once(&qword_C628, &stru_C2E8);
      }
      if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
        sub_78C0();
      }
      uint64_t v18 = 0LL;
      int v50 = 1;
    }

    unint64_t v19 = (unint64_t)v28;
    uint64_t v17 = (char *)(v12 - v6);
    if (v12 >= v6)
    {
      if (qword_C600 != -1) {
        dispatch_once(&qword_C600, &stru_C3E8);
      }
      if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
        sub_7860();
      }
      int v14 = 0;
      if (!v3) {
        goto LABEL_96;
      }
    }

    else
    {
      if (qword_C628 != -1) {
        dispatch_once(&qword_C628, &stru_C2E8);
      }
      if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
        sub_7800();
      }
      int v14 = 1;
      BOOL v46 = 1;
      if (!v3) {
        goto LABEL_96;
      }
    }

    if (v3 < v48)
    {
LABEL_96:
      if (qword_C628 != -1) {
        dispatch_once(&qword_C628, &stru_C2E8);
      }
      double v13 = &CFDataGetBytePtr_ptr;
      if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
        sub_75B8();
      }
      unint64_t v16 = 0LL;
      int v15 = 1;
      goto LABEL_45;
    }

    if (qword_C600 != -1) {
      dispatch_once(&qword_C600, &stru_C3E8);
    }
    if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
      sub_77A0();
    }
    unint64_t v45 = v3 - v48;
    if (v3 == v48)
    {
      unint64_t v16 = 0LL;
      if (v46)
      {
LABEL_124:
        int v15 = 0;
LABEL_39:
        double v13 = &CFDataGetBytePtr_ptr;
LABEL_45:
        if (qword_C628 != -1) {
          dispatch_once(&qword_C628, &stru_C2E8);
        }
        uint64_t v21 = (os_log_s *)v13[196];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)host_info64_out = 134221312;
          *(void *)&host_info64_out[4] = v20;
          *(_WORD *)&host_info64_out[12] = 2048;
          *(void *)&host_info64_out[14] = v19;
          *(_WORD *)&host_info64_out[22] = 2048;
          v58 = v18;
          *(_WORD *)double v59 = 2048;
          *(void *)&v59[2] = v17;
          *(_WORD *)&v59[10] = 2048;
          *(void *)&v59[12] = v16;
          *(_WORD *)&v59[20] = 2048;
          *(void *)&v59[22] = v51;
          *(_WORD *)&v59[30] = 2048;
          unint64_t v60 = v52;
          LOWORD(v61) = 1024;
          *(_DWORD *)((char *)&v61 + 2) = v53;
          HIWORD(v61) = 1024;
          *(_DWORD *)v62 = v54;
          *(_WORD *)&v62[4] = 1024;
          *(_DWORD *)&v62[6] = HIDWORD(v54);
          __int16 v63 = 1024;
          int v64 = v55;
          __int16 v65 = 1024;
          int v66 = v15;
          __int16 v67 = 1024;
          int v68 = v50;
          __int16 v69 = 1024;
          int v70 = v14;
          _os_log_impl( &dword_0,  v21,  OS_LOG_TYPE_DEFAULT,  "PMI telemetry - pmi_interval:%llu time_since_last_adjustment_s:%llus num_pmi_microstackshots_captured:%llu n um_pmi_microstackshots_skipped:%llu num_pmi_microstackshots_not_generated:%llu num_pmi_microstackshots_lost: %llu max_num_pmi_microstackshots_lost_at_once:%llu pmi_configuration_failure:%d pmi_microstackshots_wrong_so urce:%d pmi_microstackshots_wrong_interval:%d pmi_microstackshots_unexpected_configuration_change:%d bad_cpu _time:%d bad_samples_recorded:%d bad_samples_skipped:%d",  host_info64_out,  0x72u);
        }

        if (v20)
        {
          *(void *)host_info64_out = _NSConcreteStackBlock;
          *(void *)&host_info64_out[8] = 0x40000000LL;
          *(void *)&host_info64_out[16] = sub_5B1C;
          v58 = &unk_C460;
          *(void *)double v59 = v20;
          *(void *)&v59[8] = v19;
          *(void *)&v59[16] = v18;
          *(void *)&v59[24] = v17;
          unint64_t v60 = v16;
          uint64_t v61 = v51;
          *(void *)v62 = v52;
          v62[8] = v53;
          v62[9] = v54;
          LOBYTE(v63) = BYTE4(v54);
          HIBYTE(v63) = v55;
          LOBYTE(v64) = v15;
          BYTE1(v64) = v50;
          HIWORD(v64) = v14;
          analytics_send_event_lazy("com.apple.microstackshots.pmiStats", host_info64_out);
        }

        goto LABEL_51;
      }
    }

    else
    {
      if (qword_C608 != -1) {
        dispatch_once(&qword_C608, &stru_C428);
      }
      double v29 = (double)(v3 - v48) / 1000000000.0 * (double)(unint64_t)qword_C5C8;
      if (qword_C600 != -1) {
        dispatch_once(&qword_C600, &stru_C3E8);
      }
      if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
        sub_7740();
      }
      if (v46) {
        goto LABEL_136;
      }
      unint64_t v16 = (unint64_t)((double)(unint64_t)v29 * 0.9);
    }

    double v49 = &v17[(void)v18];
    if (qword_C600 != -1) {
      dispatch_once(&qword_C600, &stru_C3E8);
    }
    double v30 = (os_log_s *)qword_C5F8;
    if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)host_info64_out = 134217984;
      *(void *)&host_info64_out[4] = &v17[(void)v18];
      _os_log_debug_impl( &dword_0,  v30,  OS_LOG_TYPE_DEBUG,  "num_pmi_microstackshots_this_check:%llu",  host_info64_out,  0xCu);
      unint64_t v31 = v16 / *(void *)(a1 + 328);
      if (qword_C600 != -1) {
        dispatch_once(&qword_C600, &stru_C3E8);
      }
    }

    else
    {
      unint64_t v31 = v16 / *(void *)(a1 + 328);
    }

    if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
      sub_76E0();
    }
    if (v31 < 3)
    {
      unint64_t v32 = v45;
      if (qword_C600 != -1) {
        dispatch_once(&qword_C600, &stru_C3E8);
      }
      unint64_t v34 = (os_log_s *)qword_C5F8;
      if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
        sub_7678(v34, v35, v36, v37, v38, v39, v40, v41);
      }
      unint64_t v47 = 0LL;
      double v13 = &CFDataGetBytePtr_ptr;
    }

    else
    {
      unint64_t v47 = v31 - 2;
      if (qword_C600 != -1) {
        dispatch_once(&qword_C600, &stru_C3E8);
      }
      unint64_t v32 = v45;
      if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
        sub_7618();
      }
      unint64_t v16 = v47 - (void)v49;
      double v13 = &CFDataGetBytePtr_ptr;
      if (v47 > (unint64_t)v49)
      {
        if (qword_C628 != -1) {
          dispatch_once(&qword_C628, &stru_C2E8);
        }
        v33 = (os_log_s *)qword_C620;
        if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR))
        {
          uint64_t v44 = *(void *)(a1 + 328);
          if (qword_C608 != -1) {
            dispatch_once(&qword_C608, &stru_C428);
          }
          *(_DWORD *)host_info64_out = 134219264;
          *(void *)&host_info64_out[4] = &v17[(void)v18];
          *(_WORD *)&host_info64_out[12] = 2048;
          *(double *)&host_info64_out[14] = (double)v45 / 1000000000.0;
          *(_WORD *)&host_info64_out[22] = 2048;
          v58 = v17;
          *(_WORD *)double v59 = 2048;
          *(void *)&v59[2] = v47;
          *(_WORD *)&v59[10] = 2048;
          *(void *)&v59[12] = v44;
          *(_WORD *)&v59[20] = 2048;
          *(void *)&v59[22] = qword_C5C8;
          _os_log_error_impl( &dword_0,  v33,  OS_LOG_TYPE_ERROR,  "PMI microstackshot count is not at least what is expected: %llu in last %.0fs of cpu time (%llu skipped). Ex pect at least %llu given interval %llu and minumum cpu cycles per second %llu",  host_info64_out,  0x3Eu);
        }

        goto LABEL_124;
      }
    }

    if (qword_C628 != -1) {
      dispatch_once(&qword_C628, &stru_C2E8);
    }
    int v42 = (os_log_s *)qword_C620;
    if (!os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_INFO))
    {
      int v15 = 0;
      unint64_t v16 = 0LL;
      goto LABEL_45;
    }

    uint64_t v43 = *(void *)(a1 + 328);
    if (qword_C608 != -1) {
      dispatch_once(&qword_C608, &stru_C428);
    }
    *(_DWORD *)host_info64_out = 134219264;
    *(void *)&host_info64_out[4] = &v17[(void)v18];
    *(_WORD *)&host_info64_out[12] = 2048;
    *(double *)&host_info64_out[14] = (double)v32 / 1000000000.0;
    *(_WORD *)&host_info64_out[22] = 2048;
    v58 = v17;
    *(_WORD *)double v59 = 2048;
    *(void *)&v59[2] = v47;
    *(_WORD *)&v59[10] = 2048;
    *(void *)&v59[12] = v43;
    *(_WORD *)&v59[20] = 2048;
    *(void *)&v59[22] = qword_C5C8;
    _os_log_impl( &dword_0,  v42,  OS_LOG_TYPE_INFO,  "PMI microstackshot count is at least what is expected: %llu in last %.0fs of cpu time (%llu skipped). Expect at le ast %llu given interval %llu and minumum cpu cycles per second %llu",  host_info64_out,  0x3Eu);
LABEL_136:
    int v15 = 0;
    unint64_t v16 = 0LL;
    goto LABEL_39;
  }

LABEL_51:
  *(void *)(a1 + 392) = 0LL;
  *(void *)(a1 + 40sub_3B00(qword_C5D0, 0) = 0LL;
  *(_DWORD *)(a1 + 408) = 0;
  uint64_t v22 = *(void *)(a1 + 344);
  BOOL v23 = v22 != 0;
  uint64_t v24 = v22 - 1;
  if (!v23) {
    uint64_t v24 = 0LL;
  }
  uint64_t v25 = *(void *)(a1 + 360);
  *(void *)(a1 + 416) = v24;
  *(void *)(a1 + 424) = v25;
  *(void *)(a1 + 432) = v3;
}

uint64_t sub_4D98(void *a1, unint64_t a2, double a3)
{
  unint64_t v6 = (unint64_t)a3;
  unint64_t v7 = *(void *)(*(void *)(*a1 + 8LL) + 32LL);
  unint64_t v8 = a1[25];
  unint64_t v9 = a1[9];
  uint64_t v11 = a1[55];
  uint64_t v10 = a1[56];
  uint64_t v81 = a1[41];
  uint64_t pmi_cycle_interval = systemstats_get_pmi_cycle_interval();
  unint64_t v13 = v6;
  if (a1[48]) {
    unint64_t v13 = (unint64_t)((double)(unint64_t)(now_in_absolute_milliseconds() - a1[48]) / 1000.0);
  }
  uint64_t v82 = v11;
  if (v6 > 0x15180) {
    BOOL v14 = (double)a2 * 86400.0 / a3 > (double)v7;
  }
  else {
    BOOL v14 = v7 < a2;
  }
  uint64_t v83 = v10;
  if (a1[41])
  {
    if (v14)
    {
      if (qword_C628 != -1) {
        dispatch_once(&qword_C628, &stru_C2E8);
      }
      uint64_t v15 = qword_C620;
      if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR))
      {
        *(void *)&uint8_t buf[4] = a1[41];
        uint64_t v16 = a1[9];
        *(void *)&buf[64] = a1[8];
        uint64_t v17 = a1[15];
        *(void *)&buf[34] = v16;
        *(void *)&buf[74] = v16;
        uint64_t v18 = a1[17];
        uint64_t v91 = v17;
        uint64_t v95 = v18;
        uint64_t v19 = a1[19];
        uint64_t v97 = a1[18];
        uint64_t v20 = a1[21];
        uint64_t v99 = v19;
        uint64_t v103 = v20;
        uint64_t v21 = a1[23];
        uint64_t v105 = a1[22];
        uint64_t v22 = a1[25];
        uint64_t v107 = v21;
        uint64_t v111 = v22;
        uint64_t v23 = a1[27];
        uint64_t v113 = a1[26];
        uint64_t v115 = v23;
        uint64_t v24 = a1[11];
        *(void *)&buf[84] = a1[10];
        uint64_t v25 = a1[29];
        *(void *)&buf[94] = v24;
        uint64_t v119 = v25;
        uint64_t v26 = a1[31];
        uint64_t v121 = a1[30];
        uint64_t v27 = a1[33];
        uint64_t v123 = v26;
        uint64_t v127 = v27;
        uint64_t v28 = a1[35];
        uint64_t v129 = a1[34];
        uint64_t v131 = v28;
        uint64_t v29 = a1[13];
        unint64_t v85 = a1[12];
        uint64_t v87 = v29;
        uint64_t v89 = a1[14];
        uint64_t v93 = a1[16];
        uint64_t v101 = a1[20];
        uint64_t v109 = a1[24];
        uint64_t v117 = a1[28];
        uint64_t v125 = a1[32];
        *(_WORD *)&buf[12] = 2048;
        *(_WORD *)&buf[22] = 2048;
        *(_WORD *)&buf[32] = 2048;
        *(_WORD *)&buf[42] = 2048;
        *(_WORD *)&buf[52] = 2048;
        *(_WORD *)&buf[62] = 2048;
        *(_WORD *)&buf[72] = 2048;
        *(_WORD *)&buf[82] = 2048;
        *(_WORD *)&buf[92] = 2048;
        *(_WORD *)&buf[102] = 2048;
        __int16 v86 = 2048;
        __int16 v88 = 2048;
        __int16 v90 = 2048;
        __int16 v92 = 2048;
        __int16 v94 = 2048;
        __int16 v96 = 2048;
        __int16 v98 = 2048;
        __int16 v100 = 2048;
        __int16 v102 = 2048;
        __int16 v104 = 2048;
        __int16 v106 = 2048;
        __int16 v108 = 2048;
        __int16 v110 = 2048;
        __int16 v112 = 2048;
        __int16 v114 = 2048;
        __int16 v116 = 2048;
        __int16 v118 = 2048;
        __int16 v120 = 2048;
        __int16 v122 = 2048;
        __int16 v124 = 2048;
        __int16 v126 = 2048;
        __int16 v128 = 2048;
        __int16 v130 = 2048;
        *(_DWORD *)buf = 134226432;
        *(void *)&buf[14] = a2;
        *(void *)&buf[24] = v6;
        *(void *)&buf[44] = v7;
        *(void *)&buf[54] = v13;
        double v30 = "Microstackshot datarate exceeded daily budget with %llu cycle interval: %llu bytes written over the last %"
              "llus (%llu uncompressed), cleanup quota %llu, last adjustment %llus ago\n"
              "total     count         %llu\n"
              "          size          %llu\n"
              "          num_loadinfos %llu\n"
              "          num_frames    %llu\n"
              "\n"
              "interrupt count         %llu\n"
              "          size          %llu\n"
              "          num_loadinfos %llu\n"
              "          num_frames    %llu\n"
              "\n"
              "timer     count         %llu\n"
              "          size          %llu\n"
              "          num_loadinfos %llu\n"
              "          num_frames    %llu\n"
              "\n"
              "io        count         %llu\n"
              "          size          %llu\n"
              "          num_loadinfos %llu\n"
              "          num_frames    %llu\n"
              "\n"
              "pmi       count         %llu\n"
              "          size          %llu\n"
              "          num_loadinfos %llu\n"
              "          num_frames    %llu\n"
              "\n"
              "macf      count         %llu\n"
              "          size          %llu\n"
              "          num_loadinfos %llu\n"
              "          num_frames    %llu\n"
              "\n"
              "unknown   count         %llu\n"
              "          size          %llu\n"
              "          num_loadinfos %llu\n"
              "          num_frames    %llu\n";
        unint64_t v31 = (os_log_s *)v15;
        uint32_t v32 = 342;
LABEL_17:
        _os_log_error_impl(&dword_0, v31, OS_LOG_TYPE_ERROR, v30, buf, v32);
        goto LABEL_27;
      }

      goto LABEL_29;
    }

    if (qword_C628 != -1) {
      dispatch_once(&qword_C628, &stru_C2E8);
    }
    uint64_t v47 = qword_C620;
    if (!os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_29;
    }
    *(void *)&uint8_t buf[4] = a1[41];
    uint64_t v48 = a1[9];
    *(void *)&buf[64] = a1[8];
    uint64_t v49 = a1[15];
    *(void *)&buf[34] = v48;
    *(void *)&buf[74] = v48;
    uint64_t v50 = a1[17];
    uint64_t v91 = v49;
    uint64_t v95 = v50;
    uint64_t v51 = a1[19];
    uint64_t v97 = a1[18];
    uint64_t v52 = a1[21];
    uint64_t v99 = v51;
    uint64_t v103 = v52;
    uint64_t v53 = a1[23];
    uint64_t v105 = a1[22];
    uint64_t v54 = a1[25];
    uint64_t v107 = v53;
    uint64_t v111 = v54;
    uint64_t v55 = a1[27];
    uint64_t v113 = a1[26];
    uint64_t v115 = v55;
    uint64_t v56 = a1[11];
    *(void *)&buf[84] = a1[10];
    uint64_t v57 = a1[29];
    *(void *)&buf[94] = v56;
    uint64_t v119 = v57;
    uint64_t v58 = a1[31];
    uint64_t v121 = a1[30];
    uint64_t v59 = a1[33];
    uint64_t v123 = v58;
    uint64_t v127 = v59;
    uint64_t v60 = a1[35];
    uint64_t v129 = a1[34];
    uint64_t v131 = v60;
    uint64_t v61 = a1[13];
    unint64_t v85 = a1[12];
    uint64_t v87 = v61;
    uint64_t v89 = a1[14];
    uint64_t v93 = a1[16];
    uint64_t v101 = a1[20];
    uint64_t v109 = a1[24];
    uint64_t v117 = a1[28];
    uint64_t v125 = a1[32];
    *(_WORD *)&buf[12] = 2048;
    *(_WORD *)&buf[22] = 2048;
    *(_WORD *)&buf[32] = 2048;
    *(_WORD *)&buf[42] = 2048;
    *(_WORD *)&buf[52] = 2048;
    *(_WORD *)&buf[62] = 2048;
    *(_WORD *)&buf[72] = 2048;
    *(_WORD *)&buf[82] = 2048;
    *(_WORD *)&buf[92] = 2048;
    *(_WORD *)&buf[102] = 2048;
    __int16 v86 = 2048;
    __int16 v88 = 2048;
    __int16 v90 = 2048;
    __int16 v92 = 2048;
    __int16 v94 = 2048;
    __int16 v96 = 2048;
    __int16 v98 = 2048;
    __int16 v100 = 2048;
    __int16 v102 = 2048;
    __int16 v104 = 2048;
    __int16 v106 = 2048;
    __int16 v108 = 2048;
    __int16 v110 = 2048;
    __int16 v112 = 2048;
    __int16 v114 = 2048;
    __int16 v116 = 2048;
    __int16 v118 = 2048;
    __int16 v120 = 2048;
    __int16 v122 = 2048;
    __int16 v124 = 2048;
    __int16 v126 = 2048;
    __int16 v128 = 2048;
    __int16 v130 = 2048;
    *(_DWORD *)buf = 134226432;
    *(void *)&buf[14] = a2;
    *(void *)&buf[24] = v6;
    *(void *)&buf[44] = v7;
    *(void *)&buf[54] = v13;
    v62 = "Microstackshot datarate did not exceed daily budget with %llu cycle interval: %llu bytes written over the last"
          " %llus (%llu uncompressed), cleanup quota %llu, last adjustment %llus ago\n"
          "total     count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n"
          "\n"
          "interrupt count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n"
          "\n"
          "timer     count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n"
          "\n"
          "io        count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n"
          "\n"
          "pmi       count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n"
          "\n"
          "macf      count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n"
          "\n"
          "unknown   count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n";
    __int16 v63 = (os_log_s *)v47;
    uint32_t v64 = 342;
LABEL_26:
    _os_log_impl(&dword_0, v63, OS_LOG_TYPE_DEFAULT, v62, buf, v64);
LABEL_27:
    if (qword_C628 != -1) {
      dispatch_once(&qword_C628, &stru_C2E8);
    }
    goto LABEL_29;
  }

  if (!v14)
  {
    if (qword_C628 != -1) {
      dispatch_once(&qword_C628, &stru_C2E8);
    }
    uint64_t v65 = qword_C620;
    if (!os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_29;
    }
    uint64_t v66 = a1[8];
    *(void *)&buf[24] = a1[9];
    *(void *)&buf[44] = v66;
    *(void *)&buf[54] = *(void *)&buf[24];
    uint64_t v67 = a1[11];
    *(void *)&buf[64] = a1[10];
    uint64_t v68 = a1[17];
    *(void *)&buf[74] = v67;
    uint64_t v69 = a1[19];
    uint64_t v91 = v68;
    uint64_t v95 = v69;
    uint64_t v70 = a1[21];
    uint64_t v97 = a1[20];
    uint64_t v71 = a1[23];
    uint64_t v99 = v70;
    uint64_t v103 = v71;
    uint64_t v72 = a1[25];
    uint64_t v105 = a1[24];
    uint64_t v73 = a1[27];
    uint64_t v107 = v72;
    uint64_t v111 = v73;
    uint64_t v74 = a1[29];
    uint64_t v113 = a1[28];
    uint64_t v115 = v74;
    uint64_t v75 = a1[13];
    *(void *)&buf[84] = a1[12];
    uint64_t v76 = a1[31];
    *(void *)&buf[94] = v75;
    uint64_t v119 = v76;
    uint64_t v77 = a1[33];
    uint64_t v121 = a1[32];
    uint64_t v123 = v77;
    uint64_t v127 = a1[35];
    uint64_t v78 = a1[15];
    unint64_t v85 = a1[14];
    uint64_t v87 = v78;
    uint64_t v89 = a1[16];
    uint64_t v93 = a1[18];
    uint64_t v101 = a1[22];
    uint64_t v109 = a1[26];
    uint64_t v117 = a1[30];
    uint64_t v125 = a1[34];
    *(_WORD *)&buf[12] = 2048;
    *(_WORD *)&buf[22] = 2048;
    *(_WORD *)&buf[32] = 2048;
    *(_WORD *)&buf[42] = 2048;
    *(_WORD *)&buf[52] = 2048;
    *(_WORD *)&buf[62] = 2048;
    *(_WORD *)&buf[72] = 2048;
    *(_WORD *)&buf[82] = 2048;
    *(_WORD *)&buf[92] = 2048;
    *(_WORD *)&buf[102] = 2048;
    __int16 v86 = 2048;
    __int16 v88 = 2048;
    __int16 v90 = 2048;
    __int16 v92 = 2048;
    __int16 v94 = 2048;
    __int16 v96 = 2048;
    __int16 v98 = 2048;
    __int16 v100 = 2048;
    __int16 v102 = 2048;
    __int16 v104 = 2048;
    __int16 v106 = 2048;
    __int16 v108 = 2048;
    __int16 v110 = 2048;
    __int16 v112 = 2048;
    __int16 v114 = 2048;
    __int16 v116 = 2048;
    __int16 v118 = 2048;
    __int16 v120 = 2048;
    __int16 v122 = 2048;
    __int16 v124 = 2048;
    __int16 v126 = 2048;
    *(_DWORD *)buf = 134225920;
    *(void *)&uint8_t buf[4] = a2;
    *(void *)&buf[14] = v6;
    *(void *)&buf[34] = v7;
    v62 = "Microstackshot datarate did not exceed daily budget without PMI microstackshots: %llu bytes written over the l"
          "ast %llus (%llu uncompressed), cleanup quota %llu\n"
          "total     count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n"
          "\n"
          "interrupt count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n"
          "\n"
          "timer     count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n"
          "\n"
          "io        count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n"
          "\n"
          "pmi       count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n"
          "\n"
          "macf      count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n"
          "\n"
          "unknown   count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n";
    __int16 v63 = (os_log_s *)v65;
    uint32_t v64 = 322;
    goto LABEL_26;
  }

  if (qword_C628 != -1) {
    dispatch_once(&qword_C628, &stru_C2E8);
  }
  uint64_t v33 = qword_C620;
  if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR))
  {
    uint64_t v34 = a1[8];
    *(void *)&buf[24] = a1[9];
    *(void *)&buf[44] = v34;
    *(void *)&buf[54] = *(void *)&buf[24];
    uint64_t v35 = a1[11];
    *(void *)&buf[64] = a1[10];
    uint64_t v36 = a1[17];
    *(void *)&buf[74] = v35;
    uint64_t v37 = a1[19];
    uint64_t v91 = v36;
    uint64_t v95 = v37;
    uint64_t v38 = a1[21];
    uint64_t v97 = a1[20];
    uint64_t v39 = a1[23];
    uint64_t v99 = v38;
    uint64_t v103 = v39;
    uint64_t v40 = a1[25];
    uint64_t v105 = a1[24];
    uint64_t v41 = a1[27];
    uint64_t v107 = v40;
    uint64_t v111 = v41;
    uint64_t v42 = a1[29];
    uint64_t v113 = a1[28];
    uint64_t v115 = v42;
    uint64_t v43 = a1[13];
    *(void *)&buf[84] = a1[12];
    uint64_t v44 = a1[31];
    *(void *)&buf[94] = v43;
    uint64_t v119 = v44;
    uint64_t v45 = a1[33];
    uint64_t v121 = a1[32];
    uint64_t v123 = v45;
    uint64_t v127 = a1[35];
    uint64_t v46 = a1[15];
    unint64_t v85 = a1[14];
    uint64_t v87 = v46;
    uint64_t v89 = a1[16];
    uint64_t v93 = a1[18];
    uint64_t v101 = a1[22];
    uint64_t v109 = a1[26];
    uint64_t v117 = a1[30];
    uint64_t v125 = a1[34];
    *(_WORD *)&buf[12] = 2048;
    *(_WORD *)&buf[22] = 2048;
    *(_WORD *)&buf[32] = 2048;
    *(_WORD *)&buf[42] = 2048;
    *(_WORD *)&buf[52] = 2048;
    *(_WORD *)&buf[62] = 2048;
    *(_WORD *)&buf[72] = 2048;
    *(_WORD *)&buf[82] = 2048;
    *(_WORD *)&buf[92] = 2048;
    *(_WORD *)&buf[102] = 2048;
    __int16 v86 = 2048;
    __int16 v88 = 2048;
    __int16 v90 = 2048;
    __int16 v92 = 2048;
    __int16 v94 = 2048;
    __int16 v96 = 2048;
    __int16 v98 = 2048;
    __int16 v100 = 2048;
    __int16 v102 = 2048;
    __int16 v104 = 2048;
    __int16 v106 = 2048;
    __int16 v108 = 2048;
    __int16 v110 = 2048;
    __int16 v112 = 2048;
    __int16 v114 = 2048;
    __int16 v116 = 2048;
    __int16 v118 = 2048;
    __int16 v120 = 2048;
    __int16 v122 = 2048;
    __int16 v124 = 2048;
    __int16 v126 = 2048;
    *(_DWORD *)buf = 134225920;
    *(void *)&uint8_t buf[4] = a2;
    *(void *)&buf[14] = v6;
    *(void *)&buf[34] = v7;
    double v30 = "Microstackshot datarate exceeded daily budget without PMI microstackshots: %llu bytes written over the last %l"
          "lus (%llu uncompressed), cleanup quota %llu\n"
          "total     count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n"
          "\n"
          "interrupt count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n"
          "\n"
          "timer     count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n"
          "\n"
          "io        count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n"
          "\n"
          "pmi       count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n"
          "\n"
          "macf      count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n"
          "\n"
          "unknown   count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n";
    unint64_t v31 = (os_log_s *)v33;
    uint32_t v32 = 322;
    goto LABEL_17;
  }

void sub_572C(id a1)
{
  qword_C5F8 = (uint64_t)os_log_create("com.apple.systemstats", "internal_calculations");
}

void sub_5758(id a1)
{
  if (snprintf(__str, 0x80uLL, "%s%s", "IODeviceTree", ":/arm-io/pmgr") >= 0x81)
  {
    if (qword_C628 != -1) {
      dispatch_once(&qword_C628, &stru_C2E8);
    }
    if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
      sub_7B08();
    }
    return;
  }

  io_registry_entry_t v1 = IORegistryEntryFromPath(kIOMainPortDefault, __str);
  if (v1)
  {
    io_registry_entry_t v2 = v1;
    unsigned int v3 = 0;
    uint64_t v4 = 0LL;
    while (1)
    {
      CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v2, off_C448[v4], kCFAllocatorDefault, 0);
      if (CFProperty)
      {
        unint64_t v6 = CFProperty;
        unsigned int v7 = *(_DWORD *)CFDataGetBytePtr(CFProperty);
        CFRelease(v6);
        if (v7)
        {
          if (qword_C628 != -1) {
            dispatch_once(&qword_C628, &stru_C2E8);
          }
          unint64_t v8 = (os_log_s *)qword_C620;
          unsigned int v9 = 0x3E80000 / v7;
          if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218240;
            uint64_t v15 = v4;
            __int16 v16 = 1024;
            unsigned int v17 = v9;
            _os_log_debug_impl(&dword_0, v8, OS_LOG_TYPE_DEBUG, "Min cpu %zu frequency is %dMHz", buf, 0x12u);
          }

          if (v3 - 1 >= v9) {
            unsigned int v3 = v9;
          }
          goto LABEL_23;
        }

        if (qword_C628 != -1) {
          dispatch_once(&qword_C628, &stru_C2E8);
        }
        uint64_t v13 = qword_C620;
        if (!os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_23;
        }
        *(_DWORD *)buf = 134217984;
        uint64_t v15 = v4;
        uint64_t v11 = (os_log_s *)v13;
        unint64_t v12 = "Unable to determine min cpu %zu frequency (4)";
      }

      else
      {
        if (qword_C628 != -1) {
          dispatch_once(&qword_C628, &stru_C2E8);
        }
        uint64_t v10 = qword_C620;
        if (!os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_23;
        }
        *(_DWORD *)buf = 134217984;
        uint64_t v15 = v4;
        uint64_t v11 = (os_log_s *)v10;
        unint64_t v12 = "Unable to determine min cpu %zu frequency (3)";
      }

      _os_log_debug_impl(&dword_0, v11, OS_LOG_TYPE_DEBUG, v12, buf, 0xCu);
LABEL_23:
      if (++v4 == 3)
      {
        IOObjectRelease(v2);
        if (v3)
        {
          if (qword_C628 != -1) {
            dispatch_once(&qword_C628, &stru_C2E8);
          }
          if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEBUG)) {
            sub_7B8C();
          }
          qword_C5C8 = 1000000LL * v3;
        }

        else
        {
          if (qword_C628 != -1) {
            dispatch_once(&qword_C628, &stru_C2E8);
          }
          if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
            sub_7B60();
          }
        }

        return;
      }
    }
  }

  if (qword_C628 != -1) {
    dispatch_once(&qword_C628, &stru_C2E8);
  }
  if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
    sub_7B34();
  }
}

void *sub_5B1C(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  unsigned int v3 = v2;
  if (v2)
  {
    xpc_dictionary_set_uint64(v2, "num_pmi_microstackshots_captured", *(void *)(a1 + 48));
    xpc_dictionary_set_uint64(v3, "num_pmi_microstackshots_skipped", *(void *)(a1 + 56));
    xpc_dictionary_set_uint64(v3, "num_pmi_microstackshots_not_generated", *(void *)(a1 + 64));
    xpc_dictionary_set_uint64(v3, "num_pmi_microstackshots_lost", *(void *)(a1 + 72));
    xpc_dictionary_set_uint64(v3, "max_num_pmi_microstackshots_lost_at_once", *(void *)(a1 + 80));
    xpc_dictionary_set_uint64(v3, "pmi_interval", *(void *)(a1 + 32));
    xpc_dictionary_set_uint64(v3, "time_since_last_adjustment", *(void *)(a1 + 40));
    xpc_dictionary_set_BOOL(v3, "pmi_configuration_failure", *(_BYTE *)(a1 + 88));
    xpc_dictionary_set_BOOL(v3, "pmi_microstackshots_wrong_source", *(_BYTE *)(a1 + 89));
    xpc_dictionary_set_BOOL(v3, "pmi_microstackshots_wrong_interval", *(_BYTE *)(a1 + 90));
    xpc_dictionary_set_BOOL(v3, "pmi_microstackshots_unexpected_configuration_change", *(_BYTE *)(a1 + 91));
    xpc_dictionary_set_BOOL(v3, "bad_cpu_time", *(_BYTE *)(a1 + 92));
    xpc_dictionary_set_BOOL(v3, "bad_samples_recorded", *(_BYTE *)(a1 + 93));
    xpc_dictionary_set_BOOL(v3, "bad_samples_skipped", *(_BYTE *)(a1 + 94));
  }

  else
  {
    if (qword_C628 != -1) {
      dispatch_once(&qword_C628, &stru_C2E8);
    }
    if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_FAULT)) {
      sub_7BF8();
    }
  }

  return v3;
}

void *sub_5CBC(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  unsigned int v3 = v2;
  if (v2)
  {
    xpc_dictionary_set_string(v2, "type", "pmi");
    xpc_dictionary_set_BOOL(v3, "exceeded_quota", *(_BYTE *)(a1 + 32));
    xpc_dictionary_set_uint64(v3, "bytes_written", *(void *)(a1 + 48));
    xpc_dictionary_set_uint64(v3, "cleanup_quota", *(void *)(a1 + 40));
    xpc_dictionary_set_double(v3, "time_since_last_cleanup", (double)*(unint64_t *)(a1 + 56));
    xpc_dictionary_set_uint64(v3, "default_interval", *(void *)(a1 + 96));
    xpc_dictionary_set_uint64(v3, "ending_interval", *(void *)(a1 + 88));
    xpc_dictionary_set_uint64(v3, "num_interval_increases", *(void *)(a1 + 72));
    xpc_dictionary_set_uint64(v3, "num_interval_decreases", *(void *)(a1 + 80));
    xpc_dictionary_set_uint64(v3, "time_since_last_adjustment", *(void *)(a1 + 104));
    xpc_dictionary_set_double(v3, "ratio_pmi", *(double *)(a1 + 64));
  }

  else
  {
    if (qword_C628 != -1) {
      dispatch_once(&qword_C628, &stru_C2E8);
    }
    if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_FAULT)) {
      sub_7C24();
    }
  }

  return v3;
}

void sub_5E28(uint64_t a1)
{
}

void sub_5E30(uint64_t a1)
{
  if (qword_C628 != -1) {
    dispatch_once(&qword_C628, &stru_C2E8);
  }
  if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEBUG)) {
    sub_7C50();
  }
  sub_3ABC(a1);
  sub_3B00(a1, 0);
}

void sub_5EAC(uint64_t a1)
{
}

unint64_t sub_5EB4(unint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(_BYTE *)(v1 + 322))
  {
    unint64_t v2 = systemstats_mach_continuous_time();
    unint64_t v3 = *(void *)(v1 + 8);
    if (v2 <= v3 || (uint64_t result = absolute_time_to_absolute_milliseconds(v2 - v3), result >> 3 >= 0x271))
    {
      sub_1798((void *)v1, 1);
      *(void *)(v1 + 8) = v2;
      return notify_post("com.apple.telemetry.immediate-done");
    }
  }

  return result;
}

void sub_5F20(uint64_t a1)
{
}

uint64_t sub_5F28(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if ((*(_BYTE *)(a2 + 24) & 0x10) != 0)
  {
    unsigned int v10 = *(_DWORD *)(a3 + 193);
    int v11 = *(_DWORD *)(a3 + 197);
    unint64_t v12 = *(void *)(a3 + 209);
    uint64_t v64 = *(void *)(a3 + 201);
    uint64_t v65 = *(void *)(a3 + 217);
    uint64_t v13 = a1 + 10;
    if (v12 < *(void *)(a1[10] + 344LL))
    {
      if (qword_C600 != -1) {
        dispatch_once(&qword_C600, &stru_C3E8);
      }
      BOOL v14 = (os_log_s *)qword_C5F8;
      if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67110144;
        unsigned int v67 = v10;
        __int16 v68 = 1024;
        *(_DWORD *)uint64_t v69 = v11;
        *(_WORD *)&v69[4] = 2048;
        *(void *)&v69[6] = v64;
        *(_WORD *)&v69[14] = 2048;
        *(void *)&v69[16] = v12;
        *(_WORD *)&v69[24] = 2048;
        *(void *)&v69[26] = v65;
        _os_log_debug_impl( &dword_0,  v14,  OS_LOG_TYPE_DEBUG,  "PMI microstackshot generation:%u source:%u period:%llu samples_recorded:%llu samples_skipped:%llu - duplicate",  buf,  0x2Cu);
      }

      *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = 1;
      if (v12 == *(void *)(a1[10] + 344LL) - 1LL) {
        *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
      }
      ++*(_DWORD *)(*(void *)(a1[6] + 8LL) + 24LL);
      return 1LL;
    }

    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = 1;
    if (qword_C600 != -1) {
      dispatch_once(&qword_C600, &stru_C3E8);
    }
    uint64_t v15 = (os_log_s *)qword_C5F8;
    if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67110144;
      unsigned int v67 = v10;
      __int16 v68 = 1024;
      *(_DWORD *)uint64_t v69 = v11;
      *(_WORD *)&v69[4] = 2048;
      *(void *)&v69[6] = v64;
      *(_WORD *)&v69[14] = 2048;
      *(void *)&v69[16] = v12;
      *(_WORD *)&v69[24] = 2048;
      *(void *)&v69[26] = v65;
      _os_log_debug_impl( &dword_0,  v15,  OS_LOG_TYPE_DEBUG,  "PMI microstackshot generation:%u source:%u period:%llu samples_recorded:%llu samples_skipped:%llu",  buf,  0x2Cu);
    }

    uint64_t v16 = *v13;
    unsigned int v17 = *(_DWORD *)(*v13 + 352LL);
    int v18 = v10;
    if (v17 == v10)
    {
      if (v11 == 4)
      {
        if (v64 != *(void *)(v16 + 328))
        {
          if (qword_C628 != -1) {
            dispatch_once(&qword_C628, &stru_C2E8);
          }
          uint64_t v19 = (os_log_s *)qword_C620;
          if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_FAULT)) {
            sub_7DC4((uint64_t)(a1 + 10), v64, v19);
          }
          uint64_t v16 = *v13;
          *(_BYTE *)(*v13 + 410LL) = 1;
        }
      }

      else
      {
        if (qword_C628 != -1) {
          dispatch_once(&qword_C628, &stru_C2E8);
        }
        if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_FAULT)) {
          sub_7E4C();
        }
        uint64_t v16 = *v13;
        *(_BYTE *)(*v13 + 409LL) = 1;
      }
    }

    else if (v17 < v10)
    {
      if (v11 == 4 && v64 == *(void *)(v16 + 328))
      {
        if (qword_C628 != -1) {
          dispatch_once(&qword_C628, &stru_C2E8);
        }
        uint64_t v22 = (os_log_s *)qword_C620;
        if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
          sub_7EB8((uint64_t)(a1 + 10), v18, v22);
        }
        uint64_t v16 = *v13;
        *(_DWORD *)(*v13 + 352LL) = v18;
      }

      else
      {
        if (qword_C628 != -1) {
          dispatch_once(&qword_C628, &stru_C2E8);
        }
        uint64_t v27 = (os_log_s *)qword_C620;
        if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR))
        {
          unsigned int v62 = *(_DWORD *)(*v13 + 352LL);
          uint64_t v63 = *(void *)(*v13 + 328LL);
          *(_DWORD *)buf = 67110144;
          unsigned int v67 = v62;
          __int16 v68 = 1024;
          *(_DWORD *)uint64_t v69 = v10;
          *(_WORD *)&v69[4] = 1024;
          *(_DWORD *)&v69[6] = v11;
          *(_WORD *)&v69[10] = 2048;
          *(void *)&v69[12] = v64;
          *(_WORD *)&v69[20] = 2048;
          *(void *)&v69[22] = v63;
          _os_log_error_impl( &dword_0,  v27,  OS_LOG_TYPE_ERROR,  "generation incremented unexpectedly %u -> %u, and settings are wrong! source:%d period:%llu, should be %llu",  buf,  0x28u);
        }

        uint64_t v16 = *v13;
        *(_BYTE *)(*v13 + 411LL) = 1;
        int v18 = v10;
      }
    }

    if (*(_DWORD *)(v16 + 352) == v18)
    {
      unint64_t v28 = *(void *)(v16 + 344);
      unint64_t v29 = v12 - v28;
      if (v12 > v28 && v28 >= 2)
      {
        if (qword_C628 != -1) {
          dispatch_once(&qword_C628, &stru_C2E8);
        }
        if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
          sub_7D58();
        }
        uint64_t v16 = *v13;
        unint64_t v30 = *(void *)(*v13 + 400LL);
        *(void *)(*v13 + 392LL) += v29;
        if (v30 < v29) {
          *(void *)(v16 + 40sub_3B00(qword_C5D0, 0) = v29;
        }
      }

      *(void *)(v16 + 344) = v12 + 1;
      *(void *)(v16 + 36sub_3B00(qword_C5D0, 0) = v65;
    }

    *(_DWORD *)(v16 + 356) = v18;
    goto LABEL_70;
  }

  if (*(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL))
  {
    if (qword_C600 != -1) {
      dispatch_once(&qword_C600, &stru_C3E8);
    }
    if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
      sub_7CEC();
    }
    goto LABEL_70;
  }

  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    unint64_t v23 = *(void *)(a2 + 8);
    if (qword_C610 >= v23 && (qword_C610 != v23 || (unint64_t)qword_C618 >= *(void *)(a2 + 16)))
    {
      ++*(_DWORD *)(*(void *)(a1[8] + 8LL) + 24LL);
      if (qword_C600 != -1) {
        dispatch_once(&qword_C600, &stru_C3E8);
      }
      uint64_t v58 = (os_log_s *)qword_C5F8;
      if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_101;
      }
      return 1LL;
    }

    if (qword_C600 != -1) {
      dispatch_once(&qword_C600, &stru_C3E8);
    }
    uint64_t v21 = (os_log_s *)qword_C5F8;
    if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
    {
LABEL_48:
      unsigned int v24 = *(unsigned __int8 *)(a2 + 24);
      uint64_t v25 = *(void *)(a2 + 8);
      uint64_t v26 = *(void *)(a2 + 16);
      *(_DWORD *)buf = 67109632;
      unsigned int v67 = v24;
      __int16 v68 = 2048;
      *(void *)uint64_t v69 = v25;
      *(_WORD *)&v69[8] = 2048;
      *(void *)&v69[10] = v26;
      _os_log_debug_impl(&dword_0, v21, OS_LOG_TYPE_DEBUG, "non-PMI microstackshot 0x%x @ %llu.%0llu", buf, 0x1Cu);
    }

LABEL_70:
    ++*(void *)(*(void *)(a1[9] + 8LL) + 24LL);
    unint64_t v31 = (void *)a1[10];
    *(_WORD *)(a2 + 25) = *((_WORD *)v31 + 162);
    uint64_t v32 = v31[9] + a5;
    ++v31[8];
    v31[9] = v32;
    uint64_t v33 = *(unsigned int *)(a3 + 56);
    uint64_t v34 = v31[11];
    v31[10] += v33;
    uint64_t v35 = (*(_DWORD *)(a4 + 8) + *(_DWORD *)(a4 + 4));
    v31[11] = v34 + v35;
    char v36 = *(_BYTE *)(a2 + 24);
    if ((v36 & 1) != 0)
    {
      uint64_t v50 = v31[13] + a5;
      ++v31[12];
      v31[13] = v50;
      uint64_t v51 = v31[15] + v35;
      v31[14] += v33;
      v31[15] = v51;
      if ((v36 & 2) == 0)
      {
LABEL_72:
        if ((v36 & 8) == 0) {
          goto LABEL_73;
        }
        goto LABEL_85;
      }
    }

    else if ((*(_BYTE *)(a2 + 24) & 2) == 0)
    {
      goto LABEL_72;
    }

    uint64_t v52 = v31[17] + a5;
    ++v31[16];
    v31[17] = v52;
    uint64_t v53 = v31[19] + v35;
    v31[18] += v33;
    v31[19] = v53;
    if ((v36 & 8) == 0)
    {
LABEL_73:
      if ((v36 & 0x10) == 0) {
        goto LABEL_74;
      }
      goto LABEL_86;
    }

LABEL_85:
    uint64_t v54 = v31[21] + a5;
    ++v31[20];
    v31[21] = v54;
    uint64_t v55 = v31[23] + v35;
    v31[22] += v33;
    v31[23] = v55;
    if ((v36 & 0x10) == 0)
    {
LABEL_74:
      if ((v36 & 0x20) == 0)
      {
LABEL_76:
        if ((v36 & 0x3B) == 0)
        {
          uint64_t v39 = v31[33] + a5;
          ++v31[32];
          v31[33] = v39;
          uint64_t v40 = v31[35] + v35;
          v31[34] += v33;
          v31[35] = v40;
        }

        unint64_t v41 = *(void *)(*v31 + 168LL);
        uint64_t v42 = *(void *)(*v31 + 120LL);
        systemstats_write_microstackshot();
        uint64_t v43 = (void *)a1[10];
        unint64_t v44 = *(void *)(*v43 + 168LL);
        BOOL v45 = v44 > v41;
        unint64_t v46 = v44 - v41;
        if (v45)
        {
          sub_4D98(v43, v42 + a5, (double)v46 / 1000.0);
          sub_4004(a1[10]);
          uint64_t v47 = a1[10];
          *(_OWORD *)(v47 + 64) = 0u;
          *(_OWORD *)(v47 + 8sub_3B00(qword_C5D0, 0) = 0u;
          *(_OWORD *)(v47 + 96) = 0u;
          *(_OWORD *)(v47 + 112) = 0u;
          *(_OWORD *)(v47 + 128) = 0u;
          *(_OWORD *)(v47 + 144) = 0u;
          *(_OWORD *)(v47 + 16sub_3B00(qword_C5D0, 0) = 0u;
          *(_OWORD *)(v47 + 176) = 0u;
          *(_OWORD *)(v47 + 192) = 0u;
          *(_OWORD *)(v47 + 208) = 0u;
          *(_OWORD *)(v47 + 224) = 0u;
          *(_OWORD *)(v47 + 24sub_3B00(qword_C5D0, 0) = 0u;
          *(_OWORD *)(v47 + 256) = 0u;
          *(_OWORD *)(v47 + 272) = 0u;
          *(void *)(v47 + 368) = 0LL;
          *(void *)(v47 + 376) = 0LL;
          *(void *)(v47 + 384) = 0LL;
          *(void *)(v47 + 44sub_3B00(qword_C5D0, 0) = 0LL;
          *(void *)(v47 + 448) = 0LL;
        }

        uint64_t v48 = *(void *)(a2 + 16);
        qword_C610 = *(void *)(a2 + 8);
        qword_C618 = v48;
        return 1LL;
      }

LABEL_75:
      uint64_t v37 = v31[29] + a5;
      ++v31[28];
      v31[29] = v37;
      uint64_t v38 = v31[31] + v35;
      v31[30] += v33;
      v31[31] = v38;
      goto LABEL_76;
    }

LABEL_86:
    uint64_t v56 = v31[25] + a5;
    ++v31[24];
    v31[25] = v56;
    uint64_t v57 = v31[27] + v35;
    v31[26] += v33;
    v31[27] = v57;
    if ((v36 & 0x20) == 0) {
      goto LABEL_76;
    }
    goto LABEL_75;
  }

  if (!*(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL))
  {
    ++*(_DWORD *)(*(void *)(a1[6] + 8LL) + 24LL);
    if (qword_C600 != -1) {
      dispatch_once(&qword_C600, &stru_C3E8);
    }
    if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
      sub_7C80();
    }
    return 1LL;
  }

  unint64_t v20 = *(void *)(a2 + 8);
  if (qword_C610 < v20 || qword_C610 == v20 && (unint64_t)qword_C618 < *(void *)(a2 + 16))
  {
    if (qword_C600 != -1) {
      dispatch_once(&qword_C600, &stru_C3E8);
    }
    uint64_t v21 = (os_log_s *)qword_C5F8;
    if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_48;
    }
    goto LABEL_70;
  }

  ++*(_DWORD *)(*(void *)(a1[8] + 8LL) + 24LL);
  if (qword_C600 != -1) {
    dispatch_once(&qword_C600, &stru_C3E8);
  }
  uint64_t v58 = (os_log_s *)qword_C5F8;
  if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
  {
LABEL_101:
    unsigned int v59 = *(unsigned __int8 *)(a2 + 24);
    uint64_t v60 = *(void *)(a2 + 8);
    uint64_t v61 = *(void *)(a2 + 16);
    *(_DWORD *)buf = 67109632;
    unsigned int v67 = v59;
    __int16 v68 = 2048;
    *(void *)uint64_t v69 = v60;
    *(_WORD *)&v69[8] = 2048;
    *(void *)&v69[10] = v61;
    _os_log_debug_impl( &dword_0,  v58,  OS_LOG_TYPE_DEBUG,  "non-PMI microstackshot 0x%x @ %llu.%0llu - likely duplicate",  buf,  0x1Cu);
  }

  return 1LL;
}

uint64_t sub_69C4(uint64_t result)
{
  *(_BYTE *)(*(void *)(result + 32) + 320LL) = 0;
  return result;
}

void sub_69D0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_69E0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

void sub_69FC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

BOOL sub_6A24()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG);
}

void sub_6A30(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

  ;
}

void sub_6A68(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_6A74( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t sub_6AA4(int a1)
{
  return _os_assumes_log(a1);
}

void sub_6AAC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

uint64_t sub_6ACC(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 2sub_3B00(qword_C5D0, 0) = v3;
  if (a1[5] == 5100)
  {
    if ((*a1 & 0x80000000) != 0 || a1[1] != 36)
    {
      *(_DWORD *)(a2 + 32) = -304;
      *(NDR_record_t *)(a2 + 24) = NDR_record;
    }

    else
    {
      *(_DWORD *)(a2 + 32) = telemetry_notification(a1[3]);
    }

    return 1LL;
  }

  else
  {
    uint64_t result = 0LL;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }

  return result;
}

void sub_6B84()
{
}

void sub_6BB4()
{
}

void sub_6BE4()
{
}

void sub_6C14()
{
  sub_6A68(&dword_0, v0, v1, "__microstackshot returned invalid buffer of size: %d", v2);
  sub_69F4();
}

void sub_6C78()
{
}

void sub_6CA8()
{
}

void sub_6CD8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_6D40( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_6DA8()
{
}

uint64_t sub_6E08()
{
  if (qword_C600 == -1) {
    return 1LL;
  }
  dispatch_once(&qword_C600, &stru_C3E8);
  return 0LL;
}

void sub_6E9C(uint64_t a1, os_log_s *a2)
{
  int v2 = 134218240;
  uint64_t v3 = a1;
  __int16 v4 = 2048;
  uint64_t v5 = 0x3FEE666666666666LL;
  _os_log_debug_impl( &dword_0,  a2,  OS_LOG_TYPE_DEBUG,  "target_all_compressed_bytes:%llu target_ratio:%.2f",  (uint8_t *)&v2,  0x16u);
  sub_69EC();
}

void sub_6F20()
{
}

void sub_6F80()
{
}

void sub_6FE0()
{
}

void sub_7040()
{
}

void sub_70A0()
{
}

void sub_7100()
{
}

void sub_7130()
{
}

void sub_715C()
{
}

void sub_7188()
{
}

void sub_71B4(int a1)
{
  if (qword_C628 != -1) {
    dispatch_once(&qword_C628, &stru_C2E8);
  }
  uint64_t v1 = (os_log_s *)qword_C620;
  if (sub_6A24())
  {
    *(_WORD *)uint64_t v3 = 0;
    sub_69E0(&dword_0, v1, v2, "failed to set context for inbound notifications on the mach port", v3);
  }

  sub_6A5C();
}

void sub_7234(int a1)
{
  if (qword_C628 != -1) {
    dispatch_once(&qword_C628, &stru_C2E8);
  }
  uint64_t v1 = (os_log_s *)qword_C620;
  if (sub_6A24())
  {
    *(_WORD *)uint64_t v3 = 0;
    sub_69E0(&dword_0, v1, v2, "failed to bind host special port", v3);
  }

  sub_6A5C();
}

void sub_72B4(int a1)
{
  if (qword_C628 != -1) {
    dispatch_once(&qword_C628, &stru_C2E8);
  }
  uint64_t v1 = (os_log_s *)qword_C620;
  if (sub_6A24())
  {
    *(_WORD *)uint64_t v3 = 0;
    sub_69E0(&dword_0, v1, v2, "failed to insert send right", v3);
  }

  sub_6A5C();
}

void sub_7334(int a1)
{
  if (qword_C628 != -1) {
    dispatch_once(&qword_C628, &stru_C2E8);
  }
  uint64_t v1 = (os_log_s *)qword_C620;
  if (sub_6A24())
  {
    *(_WORD *)uint64_t v3 = 0;
    sub_69E0(&dword_0, v1, v2, "failed to allocate a mach port", v3);
  }

  sub_6A5C();
}

void sub_73B4(os_log_s *a1)
{
  int v2 = *__error();
  v4[0] = 67109120;
  v4[1] = v2;
  sub_6A68(&dword_0, a1, v3, "__telemetry returned error: %{errno}d", (uint8_t *)v4);
  sub_69EC();
}

void sub_7434(os_log_s *a1)
{
  int v2 = *__error();
  v4[0] = 67109120;
  v4[1] = v2;
  sub_6A68(&dword_0, a1, v3, "__telemetry off returned error: %{errno}d", (uint8_t *)v4);
  sub_69EC();
}

void sub_74B4(int a1)
{
  if (qword_C628 != -1) {
    dispatch_once(&qword_C628, &stru_C2E8);
  }
  uint64_t v1 = (os_log_s *)qword_C620;
  if (sub_6A24())
  {
    *(_WORD *)uint64_t v3 = 0;
    sub_69E0(&dword_0, v1, v2, "failed to set context for inbound notifications on the mach port", v3);
  }

  sub_69EC();
}

void sub_7530()
{
}

void sub_7560()
{
}

void sub_758C()
{
}

void sub_75B8()
{
}

void sub_7618()
{
}

void sub_7678( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_76E0()
{
}

void sub_7740()
{
}

void sub_77A0()
{
}

void sub_7800()
{
}

void sub_7860()
{
}

void sub_78C0()
{
}

void sub_7920()
{
}

void sub_7980()
{
}

uint64_t sub_79E0()
{
  if (qword_C600 == -1) {
    return 1LL;
  }
  dispatch_once(&qword_C600, &stru_C3E8);
  return 0LL;
}

void sub_7A74()
{
}

void sub_7AA4()
{
}

void sub_7B08()
{
}

void sub_7B34()
{
}

void sub_7B60()
{
}

void sub_7B8C()
{
}

void sub_7BF8()
{
}

void sub_7C24()
{
}

void sub_7C50()
{
}

void sub_7C80()
{
}

void sub_7CEC()
{
}

void sub_7D58()
{
}

void sub_7DC4(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(*(void *)a1 + 328LL);
  int v4 = 134218240;
  uint64_t v5 = a2;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  _os_log_fault_impl( &dword_0,  log,  OS_LOG_TYPE_FAULT,  "Wrong microstackshot interval %llu, should be %llu",  (uint8_t *)&v4,  0x16u);
  sub_69EC();
}

void sub_7E4C()
{
}

void sub_7EB8(uint64_t a1, int a2, os_log_t log)
{
  int v3 = *(_DWORD *)(*(void *)a1 + 352LL);
  v4[0] = 67109376;
  v4[1] = v3;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "generation incremented unexpectedly %u -> %u, but settings are correct",  (uint8_t *)v4,  0xEu);
  sub_69EC();
}