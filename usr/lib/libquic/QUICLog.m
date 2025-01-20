@interface QUICLog
+ (id)categoryString:(int)a3;
+ (id)congestionStateString:(unsigned __int8)a3;
+ (id)congestionTriggerString:(unsigned __int8)a3;
+ (id)eventTypeString:(int)a3;
+ (id)flowTypeString:(unsigned __int8)a3;
+ (id)ownerString:(unsigned __int8)a3;
+ (id)packetLostTriggerString:(unsigned __int8)a3;
+ (id)packetSentRecievedTriggerString:(int)a3;
+ (id)packetTypeString:(int)a3;
+ (id)streamSideString:(unsigned __int8)a3;
+ (id)streamTypeString:(unsigned __int8)a3;
+ (int)packetType:(quic_packet *)a3;
- (QUICLog)init;
- (id)addEventValues:(id)a3 event:(quiclog_event *)a4;
- (id)addFrameList:(id)a3 frame_list:(quic_frame_list *)a4;
- (id)addMandatoryCharPointerToObject:(id)a3 key:(id)a4 value:(const char *)a5 function_name:(const char *)a6;
- (id)addMandatorySuperBoolToObject:(id)a3 key:(id)a4 value:(char)a5 function_name:(const char *)a6;
- (id)addMandatoryUint64ToObject:(id)a3 key:(id)a4 value:(unint64_t)a5 function_name:(const char *)a6;
- (id)addOptionalCharPointerToObject:(id)a3 key:(id)a4 value:(const char *)a5;
- (id)addOptionalSuperBoolToObject:(id)a3 key:(id)a4 value:(char)a5;
- (id)addOptionalUint64ToObject:(id)a3 key:(id)a4 value:(unint64_t)a5;
- (id)addPacketHeader:(id)a3 header:(packet_header *)a4;
- (id)dictToJsonString:(id)a3;
- (id)dumpData:(id)a3;
- (id)jsonStringToDict:(id)a3;
- (id)processCongestionStateUpdated:(quiclog_event *)a3;
- (id)processMetricsUpdated:(quiclog_event *)a3;
- (id)processPacketLost:(quiclog_event *)a3;
- (id)processPacketSentAndPacketRecieved:(quiclog_event *)a3;
- (id)processParametersSet:(quiclog_event *)a3;
- (id)processStreamStateUpdated:(quiclog_event *)a3;
- (id)processStreamTypeSet:(quiclog_event *)a3;
- (quiclog_event)createEvent:(int)a3;
- (void)dealloc;
- (void)deallocEvent:(quiclog_event *)a3;
- (void)disableTimestamps:(BOOL)a3;
- (void)logCongestionStateUpdated:(unsigned __int8)a3 new_state:(unsigned __int8)a4 trigger:(unsigned __int8)a5;
- (void)logStreamTypeSet:(unint64_t)a3 owner:(unsigned __int8)a4 old_state:(unsigned __int8)a5 new_state:(unsigned __int8)a6;
- (void)metricsUpdated:(unint64_t)a3 smoothed_rtt:(unint64_t)a4 latest_rtt:(unint64_t)a5 rtt_variance:(unint64_t)a6 pto_count:(unint64_t)a7 congestion_window:(unint64_t)a8 bytes_in_flight:(unint64_t)a9 ssthresh:(unint64_t)a10 packets_in_flight:(unint64_t)a11 in_recovery:(char)a12;
- (void)packetLost:(quic_packet *)a3 trigger:(unsigned __int8)a4;
- (void)packetReceived:(quic_packet *)a3 isCoalesced:(BOOL)a4;
- (void)packetSent:(quic_packet *)a3;
- (void)parametersSet:(unsigned __int8)a3 resumption_allowed:(char)a4 early_data_enabled:(char)a5 tls_cipher:(const char *)a6 original_dcid:(unsigned __int8 *)(a7 initial_scid:retry_scid:disable_active_migration:max_idle_timeout:max_udp_payload_size:ack_delay_exponent:max_ack_delay:active_cid_limit:initial_max_data:initial_msd_bidi_remote:initial_msd_bidi_local:initial_msd_uni:initial_ms_bidi:initial_ms_uni:preferred_address:;
- (void)setEntryInTopLevelObject:(id)a3 value:(id)a4;
- (void)streamStateUpdated:(unint64_t)a3 stream_type:(unsigned __int8)a4 old_state:(unsigned __int8)a5 new_state:(unsigned __int8)a6 stream_side:(unsigned __int8)a7;
@end

@implementation QUICLog

- (QUICLog)init
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___QUICLog;
  v2 = -[QUICLog init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->events_list.stqh_first = 0LL;
    v2->events_list.stqh_last = &v2->events_list.stqh_first;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    top_level_object = v3->top_level_object;
    v3->top_level_object = v4;

    -[NSMutableDictionary setValue:forKey:]( v3->top_level_object,  "setValue:forKey:",  @"draft-01",  @"qlog_version");
  }

  if (qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = _os_log_pack_size();
    v7 = (char *)&v10 - ((MEMORY[0x1895F8858](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136446210;
    *(void *)(v8 + 4) = "-[QUICLog init]";
    qlog_internal(2, (uint64_t)v7, 164LL);
  }

  return v3;
}

- (void)dealloc
{
  p_events_list = &self->events_list;
  for (i = self->events_list.stqh_first; i; i = self->events_list.stqh_first)
  {
    var19 = (quiclog_event *)i->var3.var0.var19;
    p_events_list->stqh_first = var19;
    if (!var19) {
      self->events_list.stqh_last = &p_events_list->stqh_first;
    }
    -[QUICLog deallocEvent:](self, "deallocEvent:");
  }

  top_level_object = self->top_level_object;
  self->top_level_object = 0LL;

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___QUICLog;
  -[QUICLog dealloc](&v7, sel_dealloc);
}

- (void)disableTimestamps:(BOOL)a3
{
  self->disable_timestamps = a3;
}

- (quiclog_event)createEvent:(int)a3
{
  uint64_t v6 = (quiclog_event *)calloc(1uLL, 0x110uLL);
  if (!v6)
  {
    qlog_abort_internal("%s strict_calloc(%zu, %zu) failed", "strict_calloc", 1uLL, 0x110uLL);
    goto LABEL_7;
  }

  v3 = v6;
  if (!self->disable_timestamps)
  {
    self = (QUICLog *)mach_continuous_time();
    if (timebase_info_once == -1)
    {
LABEL_4:
      v3->var2 = timebase_info_info * (unint64_t)self / dword_18C4D003C / 0x3E8;
      goto LABEL_5;
    }

- (void)deallocEvent:(quiclog_event *)a3
{
  if (a3->var0 <= 6u && ((1 << a3->var0) & 0x46) != 0)
  {
    quic_frame_list_flush((uint64_t)&a3->var3.var0.var2);
    var2 = a3->var3.var1.var2;
    if (var2) {
      free(var2);
    }
  }

  free(a3);
}

- (void)parametersSet:(unsigned __int8)a3 resumption_allowed:(char)a4 early_data_enabled:(char)a5 tls_cipher:(const char *)a6 original_dcid:(unsigned __int8 *)(a7 initial_scid:retry_scid:disable_active_migration:max_idle_timeout:max_udp_payload_size:ack_delay_exponent:max_ack_delay:active_cid_limit:initial_max_data:initial_msd_bidi_remote:initial_msd_bidi_local:initial_msd_uni:initial_ms_bidi:initial_ms_uni:preferred_address:
{
  v29 = -[QUICLog createEvent:](self, "createEvent:", 0LL);
  v29->var3.var0.var12 = a3;
  v29->var3.var0.var9 = a4;
  v29->var3.var0.var10 = a5;
  if (a6)
  {
    int v30 = *(unsigned __int8 *)a6;
    v29->var3.var0.var5[0] = v30;
    if (v30)
    {
      int v31 = *((unsigned __int8 *)a6 + 1);
      v29->var3.var0.var5[1] = v31;
      if (v31)
      {
        int v32 = *((unsigned __int8 *)a6 + 2);
        v29->var3.var0.var5[2] = v32;
        if (v32)
        {
          int v33 = *((unsigned __int8 *)a6 + 3);
          v29->var3.var0.var5[3] = v33;
          if (v33)
          {
            int v34 = *((unsigned __int8 *)a6 + 4);
            v29->var3.var0.var5[4] = v34;
            if (v34)
            {
              int v35 = *((unsigned __int8 *)a6 + 5);
              v29->var3.var0.var5[5] = v35;
              if (v35)
              {
                int v36 = *((unsigned __int8 *)a6 + 6);
                v29->var3.var0.var5[6] = v36;
                if (v36)
                {
                  int v37 = *((unsigned __int8 *)a6 + 7);
                  v29->var3.var0.var5[7] = v37;
                  if (v37)
                  {
                    int v38 = *((unsigned __int8 *)a6 + 8);
                    v29->var3.var0.var5[8] = v38;
                    if (v38)
                    {
                      int v39 = *((unsigned __int8 *)a6 + 9);
                      v29->var3.var0.var5[9] = v39;
                      if (v39)
                      {
                        int v40 = *((unsigned __int8 *)a6 + 10);
                        v29->var3.var0.var5[10] = v40;
                        if (v40)
                        {
                          int v41 = *((unsigned __int8 *)a6 + 11);
                          v29->var3.var0.var5[11] = v41;
                          if (v41)
                          {
                            int v42 = *((unsigned __int8 *)a6 + 12);
                            v29->var3.var0.var5[12] = v42;
                            if (v42)
                            {
                              int v43 = *((unsigned __int8 *)a6 + 13);
                              v29->var3.var0.var5[13] = v43;
                              if (v43)
                              {
                                int v44 = *((unsigned __int8 *)a6 + 14);
                                v29->var3.var0.var5[14] = v44;
                                if (v44)
                                {
                                  int v45 = *((unsigned __int8 *)a6 + 15);
                                  v29->var3.var0.var5[15] = v45;
                                  if (v45)
                                  {
                                    int v46 = *((unsigned __int8 *)a6 + 16);
                                    v29->var3.var0.var5[16] = v46;
                                    if (v46)
                                    {
                                      int v47 = *((unsigned __int8 *)a6 + 17);
                                      v29->var3.var0.var5[17] = v47;
                                      if (v47)
                                      {
                                        int v48 = *((unsigned __int8 *)a6 + 18);
                                        v29->var3.var0.var5[18] = v48;
                                        if (v48)
                                        {
                                          int v49 = *((unsigned __int8 *)a6 + 19);
                                          v29->var3.var0.var5[19] = v49;
                                          if (v49)
                                          {
                                            int v50 = *((unsigned __int8 *)a6 + 20);
                                            v29->var3.var0.var5[20] = v50;
                                            if (v50)
                                            {
                                              int v51 = *((unsigned __int8 *)a6 + 21);
                                              v29->var3.var0.var5[21] = v51;
                                              if (v51)
                                              {
                                                int v52 = *((unsigned __int8 *)a6 + 22);
                                                v29->var3.var0.var5[22] = v52;
                                                if (v52)
                                                {
                                                  int v53 = *((unsigned __int8 *)a6 + 23);
                                                  v29->var3.var0.var5[23] = v53;
                                                  if (v53)
                                                  {
                                                    int v54 = *((unsigned __int8 *)a6 + 24);
                                                    v29->var3.var0.var5[24] = v54;
                                                    if (v54)
                                                    {
                                                      int v55 = *((unsigned __int8 *)a6 + 25);
                                                      v29->var3.var0.var5[25] = v55;
                                                      if (v55)
                                                      {
                                                        int v56 = *((unsigned __int8 *)a6 + 26);
                                                        v29->var3.var0.var5[26] = v56;
                                                        if (v56)
                                                        {
                                                          int v57 = *((unsigned __int8 *)a6 + 27);
                                                          v29->var3.var0.var5[27] = v57;
                                                          if (v57)
                                                          {
                                                            int v58 = *((unsigned __int8 *)a6 + 28);
                                                            v29->var3.var0.var5[28] = v58;
                                                            if (v58)
                                                            {
                                                              int v59 = *((unsigned __int8 *)a6 + 29);
                                                              v29->var3.var0.var5[29] = v59;
                                                              if (v59)
                                                              {
                                                                int v60 = *((unsigned __int8 *)a6 + 30);
                                                                v29->var3.var0.var5[30] = v60;
                                                                if (v60) {
                                                                  v29->var3.var0.var5[31] = 0;
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }

    if (a7)
    {
      v29->var3.var0.var8[0] = (*a7)[0];
      int v61 = *(_DWORD *)&(*a7)[17];
      *($CF3CFCADD49FFABBD8EB2B3F6C1884D1 *)((char *)&v29->var3.var5 + 115) = *($CF3CFCADD49FFABBD8EB2B3F6C1884D1 *)&(*a7)[1];
      *(_DWORD *)((char *)&v29->var3.var5 + 131) = v61;
    }

    if (a8)
    {
      v29->var3.var0.var6[0] = (*a8)[0];
      int v62 = *(_DWORD *)&(*a8)[17];
      *($CF3CFCADD49FFABBD8EB2B3F6C1884D1 *)((char *)&v29->var3.var5 + 73) = *($CF3CFCADD49FFABBD8EB2B3F6C1884D1 *)&(*a8)[1];
      *(_DWORD *)((char *)&v29->var3.var5 + 89) = v62;
    }

    if (a9)
    {
      v29->var3.var0.var7[0] = (*a9)[0];
      int v63 = *(_DWORD *)&(*a9)[17];
      *($CF3CFCADD49FFABBD8EB2B3F6C1884D1 *)((char *)&v29->var3.var5 + 94) = *($CF3CFCADD49FFABBD8EB2B3F6C1884D1 *)&(*a9)[1];
      *(_DWORD *)((char *)&v29->var3.var5 + 110) = v63;
    }

    v29->var3.var0.var11 = a10;
    v29->var3.var0.var0 = a11;
    v29->var3.var0.var1 = a12;
    v29->var3.var0.var2 = a13;
    v29->var3.var0.var4 = a15;
    *((void *)&v29->var3.var5 + 25) = a16;
    v29->var3.var0.var14 = a18;
    v29->var3.var0.var15 = a17;
    v29->var3.var0.var16 = a19;
    v29->var3.var0.var17 = a20;
    v29->var3.var0.var18 = a21;
    if (a22)
    {
      $CF3CFCADD49FFABBD8EB2B3F6C1884D1 v64 = *($CF3CFCADD49FFABBD8EB2B3F6C1884D1 *)&a22->var0.s_addr;
      $CF3CFCADD49FFABBD8EB2B3F6C1884D1 v65 = *($CF3CFCADD49FFABBD8EB2B3F6C1884D1 *)((char *)&a22->var2 + 8);
      $CF3CFCADD49FFABBD8EB2B3F6C1884D1 v66 = *($CF3CFCADD49FFABBD8EB2B3F6C1884D1 *)&a22->var4[6];
      *($CF3CFCADD49FFABBD8EB2B3F6C1884D1 *)((char *)&v29->var3.var5 + 184) = *($CF3CFCADD49FFABBD8EB2B3F6C1884D1 *)&a22->var4[19];
      *($CF3CFCADD49FFABBD8EB2B3F6C1884D1 *)((char *)&v29->var3.var5 + 171) = v66;
      *($CF3CFCADD49FFABBD8EB2B3F6C1884D1 *)((char *)&v29->var3.var5 + 155) = v65;
      *($CF3CFCADD49FFABBD8EB2B3F6C1884D1 *)((char *)&v29->var3.var5 + 139) = v64;
    }

    v29->var3.var0.var19 = 0LL;
    *self->events_list.stqh_last = v29;
    self->events_list.stqh_last = (quiclog_event **)&v29->var3.var0.var19;
  }

  else
  {
    v67 = (QUICLog *)qlog_abort_internal("%s strict_strlcpy called with NULL src", "_strict_strlcpy");
    -[QUICLog packetSent:](v67, v68, v69);
  }

- (void)packetSent:(quic_packet *)a3
{
  v5 = -[QUICLog createEvent:](self, "createEvent:", 1LL);
  v5->var3.var1.var0 = +[QUICLog packetType:](&OBJC_CLASS___QUICLog, "packetType:", a3);
  uint64_t v6 = calloc(1uLL, 0x78uLL);
  if (!v6) {
    goto LABEL_118;
  }
  v5->var3.var0.var1 = (unint64_t)v6;
  *uint64_t v6 = a3->var20;
  *(void *)(v5->var3.var0.var1 + 8) = a3->var14;
  *(void *)(v5->var3.var0.var1 + 16) = a3->var13;
  *(_BYTE *)(v5->var3.var0.var1 + 32) = a3->var6[0];
  *(_BYTE *)(v5->var3.var0.var1 + 33) = a3->var5[0];
  var1 = (_BYTE *)v5->var3.var0.var1;
  unint64_t v8 = 0x18C4CF000uLL;
  if (quic_cid_describe_state % 3 == 2) {
    v9 = (unsigned __int8 *)&quic_cid_describe_cid_buf2;
  }
  else {
    v9 = (unsigned __int8 *)&quic_cid_describe_cid_buf3;
  }
  if (quic_cid_describe_state % 3) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = (unsigned __int8 *)&quic_cid_describe_cid_buf1;
  }
  ++quic_cid_describe_state;
  if (a3->var6[0] >= 0x14u) {
    uint64_t v11 = 20LL;
  }
  else {
    uint64_t v11 = a3->var6[0];
  }
  *(_OWORD *)(v10 + 25) = 0u;
  *(_OWORD *)uint64_t v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  if ((_DWORD)v11)
  {
    uint64_t v12 = &a3->var6[1];
    do
    {
      int v13 = *v12++;
      snprintf((char *)v10, 0x29uLL, "%s%02x", (const char *)v10, v13);
      --v11;
    }

    while (v11);
    int v14 = *v10;
    var1[34] = v14;
    unint64_t v8 = 0x18C4CF000LL;
    if (!v14) {
      goto LABEL_57;
    }
    int v15 = v10[1];
    var1[35] = v15;
    if (!v15) {
      goto LABEL_57;
    }
    int v16 = v10[2];
    var1[36] = v16;
    if (!v16) {
      goto LABEL_57;
    }
    int v17 = v10[3];
    var1[37] = v17;
    if (!v17) {
      goto LABEL_57;
    }
    int v18 = v10[4];
    var1[38] = v18;
    if (!v18) {
      goto LABEL_57;
    }
    int v19 = v10[5];
    var1[39] = v19;
    if (!v19) {
      goto LABEL_57;
    }
    int v20 = v10[6];
    var1[40] = v20;
    if (!v20) {
      goto LABEL_57;
    }
    int v21 = v10[7];
    var1[41] = v21;
    if (!v21) {
      goto LABEL_57;
    }
    int v22 = v10[8];
    var1[42] = v22;
    if (!v22) {
      goto LABEL_57;
    }
    int v23 = v10[9];
    var1[43] = v23;
    if (!v23) {
      goto LABEL_57;
    }
    int v24 = v10[10];
    var1[44] = v24;
    if (!v24) {
      goto LABEL_57;
    }
    int v25 = v10[11];
    var1[45] = v25;
    if (!v25) {
      goto LABEL_57;
    }
    int v26 = v10[12];
    var1[46] = v26;
    if (!v26) {
      goto LABEL_57;
    }
    int v27 = v10[13];
    var1[47] = v27;
    if (!v27) {
      goto LABEL_57;
    }
    int v28 = v10[14];
    var1[48] = v28;
    if (!v28) {
      goto LABEL_57;
    }
    int v29 = v10[15];
    var1[49] = v29;
    if (!v29) {
      goto LABEL_57;
    }
    int v30 = v10[16];
    var1[50] = v30;
    if (!v30) {
      goto LABEL_57;
    }
    int v31 = v10[17];
    var1[51] = v31;
    if (!v31) {
      goto LABEL_57;
    }
    int v32 = v10[18];
    var1[52] = v32;
    if (!v32) {
      goto LABEL_57;
    }
    int v33 = v10[19];
    var1[53] = v33;
    if (!v33) {
      goto LABEL_57;
    }
    int v34 = v10[20];
    var1[54] = v34;
    if (!v34) {
      goto LABEL_57;
    }
    int v35 = v10[21];
    var1[55] = v35;
    if (!v35) {
      goto LABEL_57;
    }
    int v36 = v10[22];
    var1[56] = v36;
    if (!v36) {
      goto LABEL_57;
    }
    int v37 = v10[23];
    var1[57] = v37;
    if (!v37) {
      goto LABEL_57;
    }
    int v38 = v10[24];
    var1[58] = v38;
    if (!v38) {
      goto LABEL_57;
    }
    int v39 = v10[25];
    var1[59] = v39;
    if (!v39) {
      goto LABEL_57;
    }
    int v40 = v10[26];
    var1[60] = v40;
    if (!v40) {
      goto LABEL_57;
    }
    int v41 = v10[27];
    var1[61] = v41;
    if (!v41) {
      goto LABEL_57;
    }
    int v42 = v10[28];
    var1[62] = v42;
    if (!v42) {
      goto LABEL_57;
    }
    int v43 = v10[29];
    var1[63] = v43;
    if (!v43) {
      goto LABEL_57;
    }
    int v44 = v10[30];
    var1[64] = v44;
    if (!v44) {
      goto LABEL_57;
    }
    int v45 = v10[31];
    var1[65] = v45;
    if (!v45) {
      goto LABEL_57;
    }
    int v46 = v10[32];
    var1[66] = v46;
    if (!v46) {
      goto LABEL_57;
    }
    int v47 = v10[33];
    var1[67] = v47;
    if (!v47) {
      goto LABEL_57;
    }
    int v48 = v10[34];
    var1[68] = v48;
    if (!v48) {
      goto LABEL_57;
    }
    int v49 = v10[35];
    var1[69] = v49;
    if (!v49) {
      goto LABEL_57;
    }
    int v50 = v10[36];
    var1[70] = v50;
    if (!v50) {
      goto LABEL_57;
    }
    int v51 = v10[37];
    var1[71] = v51;
    if (!v51) {
      goto LABEL_57;
    }
    int v52 = v10[38];
    var1[72] = v52;
    if (!v52) {
      goto LABEL_57;
    }
    int v53 = v10[39];
    var1[73] = v53;
    if (!v53) {
      goto LABEL_57;
    }
    int v54 = var1 + 74;
  }

  else
  {
    int v54 = var1 + 34;
  }

  *int v54 = 0;
LABEL_57:
  int v55 = (_BYTE *)v5->var3.var0.var1;
  int v56 = *(_DWORD *)(v8 + 4036);
  if (v56 % 3 == 2) {
    int v57 = (unsigned __int8 *)&quic_cid_describe_cid_buf2;
  }
  else {
    int v57 = (unsigned __int8 *)&quic_cid_describe_cid_buf3;
  }
  if (v56 % 3) {
    int v58 = v57;
  }
  else {
    int v58 = (unsigned __int8 *)&quic_cid_describe_cid_buf1;
  }
  *(_DWORD *)(v8 + 4036) = v56 + 1;
  unsigned int v59 = a3->var5[0];
  *(_OWORD *)(v58 + 25) = 0u;
  if (v59 >= 0x14) {
    uint64_t v60 = 20LL;
  }
  else {
    uint64_t v60 = v59;
  }
  *(_OWORD *)int v58 = 0uLL;
  *((_OWORD *)v58 + 1) = 0uLL;
  if (!(_DWORD)v60)
  {
    v103 = v55 + 75;
    goto LABEL_111;
  }

  int v61 = &a3->var5[1];
  do
  {
    int v62 = *v61++;
    snprintf((char *)v58, 0x29uLL, "%s%02x", (const char *)v58, v62);
    --v60;
  }

  while (v60);
  int v63 = *v58;
  v55[75] = v63;
  if (v63)
  {
    int v64 = v58[1];
    v55[76] = v64;
    if (v64)
    {
      int v65 = v58[2];
      v55[77] = v65;
      if (v65)
      {
        int v66 = v58[3];
        v55[78] = v66;
        if (v66)
        {
          int v67 = v58[4];
          v55[79] = v67;
          if (v67)
          {
            int v68 = v58[5];
            v55[80] = v68;
            if (v68)
            {
              int v69 = v58[6];
              v55[81] = v69;
              if (v69)
              {
                int v70 = v58[7];
                v55[82] = v70;
                if (v70)
                {
                  int v71 = v58[8];
                  v55[83] = v71;
                  if (v71)
                  {
                    int v72 = v58[9];
                    v55[84] = v72;
                    if (v72)
                    {
                      int v73 = v58[10];
                      v55[85] = v73;
                      if (v73)
                      {
                        int v74 = v58[11];
                        v55[86] = v74;
                        if (v74)
                        {
                          int v75 = v58[12];
                          v55[87] = v75;
                          if (v75)
                          {
                            int v76 = v58[13];
                            v55[88] = v76;
                            if (v76)
                            {
                              int v77 = v58[14];
                              v55[89] = v77;
                              if (v77)
                              {
                                int v78 = v58[15];
                                v55[90] = v78;
                                if (v78)
                                {
                                  int v79 = v58[16];
                                  v55[91] = v79;
                                  if (v79)
                                  {
                                    int v80 = v58[17];
                                    v55[92] = v80;
                                    if (v80)
                                    {
                                      int v81 = v58[18];
                                      v55[93] = v81;
                                      if (v81)
                                      {
                                        int v82 = v58[19];
                                        v55[94] = v82;
                                        if (v82)
                                        {
                                          int v83 = v58[20];
                                          v55[95] = v83;
                                          if (v83)
                                          {
                                            int v84 = v58[21];
                                            v55[96] = v84;
                                            if (v84)
                                            {
                                              int v85 = v58[22];
                                              v55[97] = v85;
                                              if (v85)
                                              {
                                                int v86 = v58[23];
                                                v55[98] = v86;
                                                if (v86)
                                                {
                                                  int v87 = v58[24];
                                                  v55[99] = v87;
                                                  if (v87)
                                                  {
                                                    int v88 = v58[25];
                                                    v55[100] = v88;
                                                    if (v88)
                                                    {
                                                      int v89 = v58[26];
                                                      v55[101] = v89;
                                                      if (v89)
                                                      {
                                                        int v90 = v58[27];
                                                        v55[102] = v90;
                                                        if (v90)
                                                        {
                                                          int v91 = v58[28];
                                                          v55[103] = v91;
                                                          if (v91)
                                                          {
                                                            int v92 = v58[29];
                                                            v55[104] = v92;
                                                            if (v92)
                                                            {
                                                              int v93 = v58[30];
                                                              v55[105] = v93;
                                                              if (v93)
                                                              {
                                                                int v94 = v58[31];
                                                                v55[106] = v94;
                                                                if (v94)
                                                                {
                                                                  int v95 = v58[32];
                                                                  v55[107] = v95;
                                                                  if (v95)
                                                                  {
                                                                    int v96 = v58[33];
                                                                    v55[108] = v96;
                                                                    if (v96)
                                                                    {
                                                                      int v97 = v58[34];
                                                                      v55[109] = v97;
                                                                      if (v97)
                                                                      {
                                                                        int v98 = v58[35];
                                                                        v55[110] = v98;
                                                                        if (v98)
                                                                        {
                                                                          int v99 = v58[36];
                                                                          v55[111] = v99;
                                                                          if (v99)
                                                                          {
                                                                            int v100 = v58[37];
                                                                            v55[112] = v100;
                                                                            if (v100)
                                                                            {
                                                                              int v101 = v58[38];
                                                                              v55[113] = v101;
                                                                              if (v101)
                                                                              {
                                                                                int v102 = v58[39];
                                                                                v55[114] = v102;
                                                                                if (v102)
                                                                                {
                                                                                  v103 = v55 + 115;
LABEL_111:
                                                                                  _BYTE *v103 = 0;
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  v5->var3.var0.var2 = 0LL;
  v5->var3.var0.var3 = (unint64_t)&v5->var3.var0.var2;
  for (i = a3->var25.var0; i; i = (quic_frame *)*((void *)i + 12))
  {
    v105 = (uint64_t *)calloc(1uLL, 0x80uLL);
    if (!v105)
    {
      for (uint64_t j = 128LL; ; uint64_t j = 120LL)
      {
        qlog_abort_internal("%s strict_calloc(%zu, %zu) failed", "strict_calloc", 1uLL, j);
LABEL_118:
        ;
      }
    }

    v106 = v105;
    quic_frame_copy_metadata(v105, (const void **)i);
    v106[12] = 0LL;
    v107 = v5->var3.var1.var3.var1;
    v106[13] = (uint64_t)v107;
    *v107 = (quic_frame *)v106;
    v5->var3.var0.var3 = (unint64_t)(v106 + 12);
  }

  v5->var3.var1.var4 = -1;
  v5->var3.var1.var6.var0 = 5;
  v5->var3.var0.var19 = 0LL;
  *self->events_list.stqh_last = v5;
  self->events_list.stqh_last = (quiclog_event **)&v5->var3.var0.var19;
}

- (void)packetReceived:(quic_packet *)a3 isCoalesced:(BOOL)a4
{
  objc_super v7 = -[QUICLog createEvent:](self, "createEvent:", 2LL);
  v7->var3.var1.var0 = +[QUICLog packetType:](&OBJC_CLASS___QUICLog, "packetType:", a3);
  unint64_t v8 = calloc(1uLL, 0x78uLL);
  if (!v8) {
    goto LABEL_118;
  }
  v7->var3.var0.var1 = (unint64_t)v8;
  *unint64_t v8 = a3->var20;
  *(void *)(v7->var3.var0.var1 + 8) = a3->var14;
  *(void *)(v7->var3.var0.var1 + 16) = a3->var13;
  *(_BYTE *)(v7->var3.var0.var1 + 32) = a3->var6[0];
  *(_BYTE *)(v7->var3.var0.var1 + 33) = a3->var5[0];
  var1 = (_BYTE *)v7->var3.var0.var1;
  unint64_t v10 = 0x18C4CF000uLL;
  if (quic_cid_describe_state % 3 == 2) {
    uint64_t v11 = (unsigned __int8 *)&quic_cid_describe_cid_buf2;
  }
  else {
    uint64_t v11 = (unsigned __int8 *)&quic_cid_describe_cid_buf3;
  }
  if (quic_cid_describe_state % 3) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = (unsigned __int8 *)&quic_cid_describe_cid_buf1;
  }
  ++quic_cid_describe_state;
  if (a3->var6[0] >= 0x14u) {
    uint64_t v13 = 20LL;
  }
  else {
    uint64_t v13 = a3->var6[0];
  }
  *(_OWORD *)(v12 + 25) = 0u;
  *(_OWORD *)uint64_t v12 = 0u;
  *((_OWORD *)v12 + 1) = 0u;
  if ((_DWORD)v13)
  {
    int v14 = &a3->var6[1];
    do
    {
      int v15 = *v14++;
      snprintf((char *)v12, 0x29uLL, "%s%02x", (const char *)v12, v15);
      --v13;
    }

    while (v13);
    int v16 = *v12;
    var1[34] = v16;
    unint64_t v10 = 0x18C4CF000LL;
    if (!v16) {
      goto LABEL_57;
    }
    int v17 = v12[1];
    var1[35] = v17;
    if (!v17) {
      goto LABEL_57;
    }
    int v18 = v12[2];
    var1[36] = v18;
    if (!v18) {
      goto LABEL_57;
    }
    int v19 = v12[3];
    var1[37] = v19;
    if (!v19) {
      goto LABEL_57;
    }
    int v20 = v12[4];
    var1[38] = v20;
    if (!v20) {
      goto LABEL_57;
    }
    int v21 = v12[5];
    var1[39] = v21;
    if (!v21) {
      goto LABEL_57;
    }
    int v22 = v12[6];
    var1[40] = v22;
    if (!v22) {
      goto LABEL_57;
    }
    int v23 = v12[7];
    var1[41] = v23;
    if (!v23) {
      goto LABEL_57;
    }
    int v24 = v12[8];
    var1[42] = v24;
    if (!v24) {
      goto LABEL_57;
    }
    int v25 = v12[9];
    var1[43] = v25;
    if (!v25) {
      goto LABEL_57;
    }
    int v26 = v12[10];
    var1[44] = v26;
    if (!v26) {
      goto LABEL_57;
    }
    int v27 = v12[11];
    var1[45] = v27;
    if (!v27) {
      goto LABEL_57;
    }
    int v28 = v12[12];
    var1[46] = v28;
    if (!v28) {
      goto LABEL_57;
    }
    int v29 = v12[13];
    var1[47] = v29;
    if (!v29) {
      goto LABEL_57;
    }
    int v30 = v12[14];
    var1[48] = v30;
    if (!v30) {
      goto LABEL_57;
    }
    int v31 = v12[15];
    var1[49] = v31;
    if (!v31) {
      goto LABEL_57;
    }
    int v32 = v12[16];
    var1[50] = v32;
    if (!v32) {
      goto LABEL_57;
    }
    int v33 = v12[17];
    var1[51] = v33;
    if (!v33) {
      goto LABEL_57;
    }
    int v34 = v12[18];
    var1[52] = v34;
    if (!v34) {
      goto LABEL_57;
    }
    int v35 = v12[19];
    var1[53] = v35;
    if (!v35) {
      goto LABEL_57;
    }
    int v36 = v12[20];
    var1[54] = v36;
    if (!v36) {
      goto LABEL_57;
    }
    int v37 = v12[21];
    var1[55] = v37;
    if (!v37) {
      goto LABEL_57;
    }
    int v38 = v12[22];
    var1[56] = v38;
    if (!v38) {
      goto LABEL_57;
    }
    int v39 = v12[23];
    var1[57] = v39;
    if (!v39) {
      goto LABEL_57;
    }
    int v40 = v12[24];
    var1[58] = v40;
    if (!v40) {
      goto LABEL_57;
    }
    int v41 = v12[25];
    var1[59] = v41;
    if (!v41) {
      goto LABEL_57;
    }
    int v42 = v12[26];
    var1[60] = v42;
    if (!v42) {
      goto LABEL_57;
    }
    int v43 = v12[27];
    var1[61] = v43;
    if (!v43) {
      goto LABEL_57;
    }
    int v44 = v12[28];
    var1[62] = v44;
    if (!v44) {
      goto LABEL_57;
    }
    int v45 = v12[29];
    var1[63] = v45;
    if (!v45) {
      goto LABEL_57;
    }
    int v46 = v12[30];
    var1[64] = v46;
    if (!v46) {
      goto LABEL_57;
    }
    int v47 = v12[31];
    var1[65] = v47;
    if (!v47) {
      goto LABEL_57;
    }
    int v48 = v12[32];
    var1[66] = v48;
    if (!v48) {
      goto LABEL_57;
    }
    int v49 = v12[33];
    var1[67] = v49;
    if (!v49) {
      goto LABEL_57;
    }
    int v50 = v12[34];
    var1[68] = v50;
    if (!v50) {
      goto LABEL_57;
    }
    int v51 = v12[35];
    var1[69] = v51;
    if (!v51) {
      goto LABEL_57;
    }
    int v52 = v12[36];
    var1[70] = v52;
    if (!v52) {
      goto LABEL_57;
    }
    int v53 = v12[37];
    var1[71] = v53;
    if (!v53) {
      goto LABEL_57;
    }
    int v54 = v12[38];
    var1[72] = v54;
    if (!v54) {
      goto LABEL_57;
    }
    int v55 = v12[39];
    var1[73] = v55;
    if (!v55) {
      goto LABEL_57;
    }
    int v56 = var1 + 74;
  }

  else
  {
    int v56 = var1 + 34;
  }

  *int v56 = 0;
LABEL_57:
  int v57 = (_BYTE *)v7->var3.var0.var1;
  int v58 = *(_DWORD *)(v10 + 4036);
  if (v58 % 3 == 2) {
    unsigned int v59 = (unsigned __int8 *)&quic_cid_describe_cid_buf2;
  }
  else {
    unsigned int v59 = (unsigned __int8 *)&quic_cid_describe_cid_buf3;
  }
  if (v58 % 3) {
    uint64_t v60 = v59;
  }
  else {
    uint64_t v60 = (unsigned __int8 *)&quic_cid_describe_cid_buf1;
  }
  *(_DWORD *)(v10 + 4036) = v58 + 1;
  unsigned int v61 = a3->var5[0];
  *(_OWORD *)(v60 + 25) = 0u;
  if (v61 >= 0x14) {
    uint64_t v62 = 20LL;
  }
  else {
    uint64_t v62 = v61;
  }
  *(_OWORD *)uint64_t v60 = 0uLL;
  *((_OWORD *)v60 + 1) = 0uLL;
  if (!(_DWORD)v62)
  {
    v105 = v57 + 75;
    goto LABEL_111;
  }

  int v63 = &a3->var5[1];
  do
  {
    int v64 = *v63++;
    snprintf((char *)v60, 0x29uLL, "%s%02x", (const char *)v60, v64);
    --v62;
  }

  while (v62);
  int v65 = *v60;
  v57[75] = v65;
  if (v65)
  {
    int v66 = v60[1];
    v57[76] = v66;
    if (v66)
    {
      int v67 = v60[2];
      v57[77] = v67;
      if (v67)
      {
        int v68 = v60[3];
        v57[78] = v68;
        if (v68)
        {
          int v69 = v60[4];
          v57[79] = v69;
          if (v69)
          {
            int v70 = v60[5];
            v57[80] = v70;
            if (v70)
            {
              int v71 = v60[6];
              v57[81] = v71;
              if (v71)
              {
                int v72 = v60[7];
                v57[82] = v72;
                if (v72)
                {
                  int v73 = v60[8];
                  v57[83] = v73;
                  if (v73)
                  {
                    int v74 = v60[9];
                    v57[84] = v74;
                    if (v74)
                    {
                      int v75 = v60[10];
                      v57[85] = v75;
                      if (v75)
                      {
                        int v76 = v60[11];
                        v57[86] = v76;
                        if (v76)
                        {
                          int v77 = v60[12];
                          v57[87] = v77;
                          if (v77)
                          {
                            int v78 = v60[13];
                            v57[88] = v78;
                            if (v78)
                            {
                              int v79 = v60[14];
                              v57[89] = v79;
                              if (v79)
                              {
                                int v80 = v60[15];
                                v57[90] = v80;
                                if (v80)
                                {
                                  int v81 = v60[16];
                                  v57[91] = v81;
                                  if (v81)
                                  {
                                    int v82 = v60[17];
                                    v57[92] = v82;
                                    if (v82)
                                    {
                                      int v83 = v60[18];
                                      v57[93] = v83;
                                      if (v83)
                                      {
                                        int v84 = v60[19];
                                        v57[94] = v84;
                                        if (v84)
                                        {
                                          int v85 = v60[20];
                                          v57[95] = v85;
                                          if (v85)
                                          {
                                            int v86 = v60[21];
                                            v57[96] = v86;
                                            if (v86)
                                            {
                                              int v87 = v60[22];
                                              v57[97] = v87;
                                              if (v87)
                                              {
                                                int v88 = v60[23];
                                                v57[98] = v88;
                                                if (v88)
                                                {
                                                  int v89 = v60[24];
                                                  v57[99] = v89;
                                                  if (v89)
                                                  {
                                                    int v90 = v60[25];
                                                    v57[100] = v90;
                                                    if (v90)
                                                    {
                                                      int v91 = v60[26];
                                                      v57[101] = v91;
                                                      if (v91)
                                                      {
                                                        int v92 = v60[27];
                                                        v57[102] = v92;
                                                        if (v92)
                                                        {
                                                          int v93 = v60[28];
                                                          v57[103] = v93;
                                                          if (v93)
                                                          {
                                                            int v94 = v60[29];
                                                            v57[104] = v94;
                                                            if (v94)
                                                            {
                                                              int v95 = v60[30];
                                                              v57[105] = v95;
                                                              if (v95)
                                                              {
                                                                int v96 = v60[31];
                                                                v57[106] = v96;
                                                                if (v96)
                                                                {
                                                                  int v97 = v60[32];
                                                                  v57[107] = v97;
                                                                  if (v97)
                                                                  {
                                                                    int v98 = v60[33];
                                                                    v57[108] = v98;
                                                                    if (v98)
                                                                    {
                                                                      int v99 = v60[34];
                                                                      v57[109] = v99;
                                                                      if (v99)
                                                                      {
                                                                        int v100 = v60[35];
                                                                        v57[110] = v100;
                                                                        if (v100)
                                                                        {
                                                                          int v101 = v60[36];
                                                                          v57[111] = v101;
                                                                          if (v101)
                                                                          {
                                                                            int v102 = v60[37];
                                                                            v57[112] = v102;
                                                                            if (v102)
                                                                            {
                                                                              int v103 = v60[38];
                                                                              v57[113] = v103;
                                                                              if (v103)
                                                                              {
                                                                                int v104 = v60[39];
                                                                                v57[114] = v104;
                                                                                if (v104)
                                                                                {
                                                                                  v105 = v57 + 115;
LABEL_111:
                                                                                  _BYTE *v105 = 0;
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  v7->var3.var0.var2 = 0LL;
  v7->var3.var0.var3 = (unint64_t)&v7->var3.var0.var2;
  for (i = a3->var25.var0; i; i = (quic_frame *)*((void *)i + 12))
  {
    v107 = (uint64_t *)calloc(1uLL, 0x80uLL);
    if (!v107)
    {
      for (uint64_t j = 128LL; ; uint64_t j = 120LL)
      {
        qlog_abort_internal("%s strict_calloc(%zu, %zu) failed", "strict_calloc", 1uLL, j);
LABEL_118:
        ;
      }
    }

    v108 = v107;
    quic_frame_copy_metadata(v107, (const void **)i);
    v108[12] = 0LL;
    v109 = v7->var3.var1.var3.var1;
    v108[13] = (uint64_t)v109;
    *v109 = (quic_frame *)v108;
    v7->var3.var0.var3 = (unint64_t)(v108 + 12);
  }

  v7->var3.var1.var4 = a4;
  v7->var3.var1.var6.var0 = 5;
  v7->var3.var0.var19 = 0LL;
  *self->events_list.stqh_last = v7;
  self->events_list.stqh_last = (quiclog_event **)&v7->var3.var0.var19;
}

- (void)packetLost:(quic_packet *)a3 trigger:(unsigned __int8)a4
{
  objc_super v7 = -[QUICLog createEvent:](self, "createEvent:", 6LL);
  v7->var3.var1.var0 = +[QUICLog packetType:](&OBJC_CLASS___QUICLog, "packetType:", a3);
  unint64_t v8 = calloc(1uLL, 0x78uLL);
  if (!v8) {
    goto LABEL_118;
  }
  v7->var3.var0.var1 = (unint64_t)v8;
  *unint64_t v8 = a3->var20;
  *(void *)(v7->var3.var0.var1 + 8) = a3->var14;
  *(void *)(v7->var3.var0.var1 + 16) = a3->var13;
  *(_BYTE *)(v7->var3.var0.var1 + 32) = a3->var6[0];
  *(_BYTE *)(v7->var3.var0.var1 + 33) = a3->var5[0];
  var1 = (_BYTE *)v7->var3.var0.var1;
  unint64_t v10 = 0x18C4CF000uLL;
  if (quic_cid_describe_state % 3 == 2) {
    uint64_t v11 = (unsigned __int8 *)&quic_cid_describe_cid_buf2;
  }
  else {
    uint64_t v11 = (unsigned __int8 *)&quic_cid_describe_cid_buf3;
  }
  if (quic_cid_describe_state % 3) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = (unsigned __int8 *)&quic_cid_describe_cid_buf1;
  }
  ++quic_cid_describe_state;
  if (a3->var6[0] >= 0x14u) {
    uint64_t v13 = 20LL;
  }
  else {
    uint64_t v13 = a3->var6[0];
  }
  *(_OWORD *)(v12 + 25) = 0u;
  *(_OWORD *)uint64_t v12 = 0u;
  *((_OWORD *)v12 + 1) = 0u;
  if ((_DWORD)v13)
  {
    int v14 = &a3->var6[1];
    do
    {
      int v15 = *v14++;
      snprintf((char *)v12, 0x29uLL, "%s%02x", (const char *)v12, v15);
      --v13;
    }

    while (v13);
    int v16 = *v12;
    var1[34] = v16;
    unint64_t v10 = 0x18C4CF000LL;
    if (!v16) {
      goto LABEL_57;
    }
    int v17 = v12[1];
    var1[35] = v17;
    if (!v17) {
      goto LABEL_57;
    }
    int v18 = v12[2];
    var1[36] = v18;
    if (!v18) {
      goto LABEL_57;
    }
    int v19 = v12[3];
    var1[37] = v19;
    if (!v19) {
      goto LABEL_57;
    }
    int v20 = v12[4];
    var1[38] = v20;
    if (!v20) {
      goto LABEL_57;
    }
    int v21 = v12[5];
    var1[39] = v21;
    if (!v21) {
      goto LABEL_57;
    }
    int v22 = v12[6];
    var1[40] = v22;
    if (!v22) {
      goto LABEL_57;
    }
    int v23 = v12[7];
    var1[41] = v23;
    if (!v23) {
      goto LABEL_57;
    }
    int v24 = v12[8];
    var1[42] = v24;
    if (!v24) {
      goto LABEL_57;
    }
    int v25 = v12[9];
    var1[43] = v25;
    if (!v25) {
      goto LABEL_57;
    }
    int v26 = v12[10];
    var1[44] = v26;
    if (!v26) {
      goto LABEL_57;
    }
    int v27 = v12[11];
    var1[45] = v27;
    if (!v27) {
      goto LABEL_57;
    }
    int v28 = v12[12];
    var1[46] = v28;
    if (!v28) {
      goto LABEL_57;
    }
    int v29 = v12[13];
    var1[47] = v29;
    if (!v29) {
      goto LABEL_57;
    }
    int v30 = v12[14];
    var1[48] = v30;
    if (!v30) {
      goto LABEL_57;
    }
    int v31 = v12[15];
    var1[49] = v31;
    if (!v31) {
      goto LABEL_57;
    }
    int v32 = v12[16];
    var1[50] = v32;
    if (!v32) {
      goto LABEL_57;
    }
    int v33 = v12[17];
    var1[51] = v33;
    if (!v33) {
      goto LABEL_57;
    }
    int v34 = v12[18];
    var1[52] = v34;
    if (!v34) {
      goto LABEL_57;
    }
    int v35 = v12[19];
    var1[53] = v35;
    if (!v35) {
      goto LABEL_57;
    }
    int v36 = v12[20];
    var1[54] = v36;
    if (!v36) {
      goto LABEL_57;
    }
    int v37 = v12[21];
    var1[55] = v37;
    if (!v37) {
      goto LABEL_57;
    }
    int v38 = v12[22];
    var1[56] = v38;
    if (!v38) {
      goto LABEL_57;
    }
    int v39 = v12[23];
    var1[57] = v39;
    if (!v39) {
      goto LABEL_57;
    }
    int v40 = v12[24];
    var1[58] = v40;
    if (!v40) {
      goto LABEL_57;
    }
    int v41 = v12[25];
    var1[59] = v41;
    if (!v41) {
      goto LABEL_57;
    }
    int v42 = v12[26];
    var1[60] = v42;
    if (!v42) {
      goto LABEL_57;
    }
    int v43 = v12[27];
    var1[61] = v43;
    if (!v43) {
      goto LABEL_57;
    }
    int v44 = v12[28];
    var1[62] = v44;
    if (!v44) {
      goto LABEL_57;
    }
    int v45 = v12[29];
    var1[63] = v45;
    if (!v45) {
      goto LABEL_57;
    }
    int v46 = v12[30];
    var1[64] = v46;
    if (!v46) {
      goto LABEL_57;
    }
    int v47 = v12[31];
    var1[65] = v47;
    if (!v47) {
      goto LABEL_57;
    }
    int v48 = v12[32];
    var1[66] = v48;
    if (!v48) {
      goto LABEL_57;
    }
    int v49 = v12[33];
    var1[67] = v49;
    if (!v49) {
      goto LABEL_57;
    }
    int v50 = v12[34];
    var1[68] = v50;
    if (!v50) {
      goto LABEL_57;
    }
    int v51 = v12[35];
    var1[69] = v51;
    if (!v51) {
      goto LABEL_57;
    }
    int v52 = v12[36];
    var1[70] = v52;
    if (!v52) {
      goto LABEL_57;
    }
    int v53 = v12[37];
    var1[71] = v53;
    if (!v53) {
      goto LABEL_57;
    }
    int v54 = v12[38];
    var1[72] = v54;
    if (!v54) {
      goto LABEL_57;
    }
    int v55 = v12[39];
    var1[73] = v55;
    if (!v55) {
      goto LABEL_57;
    }
    int v56 = var1 + 74;
  }

  else
  {
    int v56 = var1 + 34;
  }

  *int v56 = 0;
LABEL_57:
  int v57 = (_BYTE *)v7->var3.var0.var1;
  int v58 = *(_DWORD *)(v10 + 4036);
  if (v58 % 3 == 2) {
    unsigned int v59 = (unsigned __int8 *)&quic_cid_describe_cid_buf2;
  }
  else {
    unsigned int v59 = (unsigned __int8 *)&quic_cid_describe_cid_buf3;
  }
  if (v58 % 3) {
    uint64_t v60 = v59;
  }
  else {
    uint64_t v60 = (unsigned __int8 *)&quic_cid_describe_cid_buf1;
  }
  *(_DWORD *)(v10 + 4036) = v58 + 1;
  unsigned int v61 = a3->var5[0];
  *(_OWORD *)(v60 + 25) = 0u;
  if (v61 >= 0x14) {
    uint64_t v62 = 20LL;
  }
  else {
    uint64_t v62 = v61;
  }
  *(_OWORD *)uint64_t v60 = 0uLL;
  *((_OWORD *)v60 + 1) = 0uLL;
  if (!(_DWORD)v62)
  {
    v105 = v57 + 75;
    goto LABEL_111;
  }

  int v63 = &a3->var5[1];
  do
  {
    int v64 = *v63++;
    snprintf((char *)v60, 0x29uLL, "%s%02x", (const char *)v60, v64);
    --v62;
  }

  while (v62);
  int v65 = *v60;
  v57[75] = v65;
  if (v65)
  {
    int v66 = v60[1];
    v57[76] = v66;
    if (v66)
    {
      int v67 = v60[2];
      v57[77] = v67;
      if (v67)
      {
        int v68 = v60[3];
        v57[78] = v68;
        if (v68)
        {
          int v69 = v60[4];
          v57[79] = v69;
          if (v69)
          {
            int v70 = v60[5];
            v57[80] = v70;
            if (v70)
            {
              int v71 = v60[6];
              v57[81] = v71;
              if (v71)
              {
                int v72 = v60[7];
                v57[82] = v72;
                if (v72)
                {
                  int v73 = v60[8];
                  v57[83] = v73;
                  if (v73)
                  {
                    int v74 = v60[9];
                    v57[84] = v74;
                    if (v74)
                    {
                      int v75 = v60[10];
                      v57[85] = v75;
                      if (v75)
                      {
                        int v76 = v60[11];
                        v57[86] = v76;
                        if (v76)
                        {
                          int v77 = v60[12];
                          v57[87] = v77;
                          if (v77)
                          {
                            int v78 = v60[13];
                            v57[88] = v78;
                            if (v78)
                            {
                              int v79 = v60[14];
                              v57[89] = v79;
                              if (v79)
                              {
                                int v80 = v60[15];
                                v57[90] = v80;
                                if (v80)
                                {
                                  int v81 = v60[16];
                                  v57[91] = v81;
                                  if (v81)
                                  {
                                    int v82 = v60[17];
                                    v57[92] = v82;
                                    if (v82)
                                    {
                                      int v83 = v60[18];
                                      v57[93] = v83;
                                      if (v83)
                                      {
                                        int v84 = v60[19];
                                        v57[94] = v84;
                                        if (v84)
                                        {
                                          int v85 = v60[20];
                                          v57[95] = v85;
                                          if (v85)
                                          {
                                            int v86 = v60[21];
                                            v57[96] = v86;
                                            if (v86)
                                            {
                                              int v87 = v60[22];
                                              v57[97] = v87;
                                              if (v87)
                                              {
                                                int v88 = v60[23];
                                                v57[98] = v88;
                                                if (v88)
                                                {
                                                  int v89 = v60[24];
                                                  v57[99] = v89;
                                                  if (v89)
                                                  {
                                                    int v90 = v60[25];
                                                    v57[100] = v90;
                                                    if (v90)
                                                    {
                                                      int v91 = v60[26];
                                                      v57[101] = v91;
                                                      if (v91)
                                                      {
                                                        int v92 = v60[27];
                                                        v57[102] = v92;
                                                        if (v92)
                                                        {
                                                          int v93 = v60[28];
                                                          v57[103] = v93;
                                                          if (v93)
                                                          {
                                                            int v94 = v60[29];
                                                            v57[104] = v94;
                                                            if (v94)
                                                            {
                                                              int v95 = v60[30];
                                                              v57[105] = v95;
                                                              if (v95)
                                                              {
                                                                int v96 = v60[31];
                                                                v57[106] = v96;
                                                                if (v96)
                                                                {
                                                                  int v97 = v60[32];
                                                                  v57[107] = v97;
                                                                  if (v97)
                                                                  {
                                                                    int v98 = v60[33];
                                                                    v57[108] = v98;
                                                                    if (v98)
                                                                    {
                                                                      int v99 = v60[34];
                                                                      v57[109] = v99;
                                                                      if (v99)
                                                                      {
                                                                        int v100 = v60[35];
                                                                        v57[110] = v100;
                                                                        if (v100)
                                                                        {
                                                                          int v101 = v60[36];
                                                                          v57[111] = v101;
                                                                          if (v101)
                                                                          {
                                                                            int v102 = v60[37];
                                                                            v57[112] = v102;
                                                                            if (v102)
                                                                            {
                                                                              int v103 = v60[38];
                                                                              v57[113] = v103;
                                                                              if (v103)
                                                                              {
                                                                                int v104 = v60[39];
                                                                                v57[114] = v104;
                                                                                if (v104)
                                                                                {
                                                                                  v105 = v57 + 115;
LABEL_111:
                                                                                  _BYTE *v105 = 0;
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  v7->var3.var0.var2 = 0LL;
  v7->var3.var0.var3 = (unint64_t)&v7->var3.var0.var2;
  for (i = a3->var25.var0; i; i = (quic_frame *)*((void *)i + 12))
  {
    v107 = (uint64_t *)calloc(1uLL, 0x80uLL);
    if (!v107)
    {
      for (uint64_t j = 128LL; ; uint64_t j = 120LL)
      {
        qlog_abort_internal("%s strict_calloc(%zu, %zu) failed", "strict_calloc", 1uLL, j);
LABEL_118:
        ;
      }
    }

    v108 = v107;
    quic_frame_copy_metadata(v107, (const void **)i);
    v108[12] = 0LL;
    v109 = v7->var3.var1.var3.var1;
    v108[13] = (uint64_t)v109;
    *v109 = (quic_frame *)v108;
    v7->var3.var0.var3 = (unint64_t)(v108 + 12);
  }

  v7->var3.var1.var4 = -1;
  v7->var3.var1.var6.var1 = a4;
  v7->var3.var0.var19 = 0LL;
  *self->events_list.stqh_last = v7;
  self->events_list.stqh_last = (quiclog_event **)&v7->var3.var0.var19;
}

- (void)metricsUpdated:(unint64_t)a3 smoothed_rtt:(unint64_t)a4 latest_rtt:(unint64_t)a5 rtt_variance:(unint64_t)a6 pto_count:(unint64_t)a7 congestion_window:(unint64_t)a8 bytes_in_flight:(unint64_t)a9 ssthresh:(unint64_t)a10 packets_in_flight:(unint64_t)a11 in_recovery:(char)a12
{
  int v19 = -[QUICLog createEvent:](self, "createEvent:", 4LL);
  v19->var3.var0.var0 = a3;
  v19->var3.var0.var1 = a4;
  v19->var3.var0.var2 = a5;
  v19->var3.var0.var3 = a6;
  v19->var3.var0.var4 = a7;
  v19->var3.var3.var5 = a8;
  *((_OWORD *)&v19->var3.var5 + 3) = *(_OWORD *)&a9;
  v19->var3.var3.var8 = a11;
  v19->var3.var0.var6[0] = a12;
  v19->var3.var0.var19 = 0LL;
  *self->events_list.stqh_last = v19;
  self->events_list.stqh_last = (quiclog_event **)&v19->var3.var0.var19;
}

- (void)streamStateUpdated:(unint64_t)a3 stream_type:(unsigned __int8)a4 old_state:(unsigned __int8)a5 new_state:(unsigned __int8)a6 stream_side:(unsigned __int8)a7
{
  uint64_t v13 = -[QUICLog createEvent:](self, "createEvent:", 3LL);
  v13->var3.var0.var0 = a3;
  v13->var3.var2.var1 = a4;
  v13->var3.var2.var2 = a5;
  v13->var3.var2.var3 = a6;
  v13->var3.var2.var5 = a7;
  v13->var3.var0.var19 = 0LL;
  *self->events_list.stqh_last = v13;
  self->events_list.stqh_last = (quiclog_event **)&v13->var3.var0.var19;
}

- (void)logCongestionStateUpdated:(unsigned __int8)a3 new_state:(unsigned __int8)a4 trigger:(unsigned __int8)a5
{
  v9 = -[QUICLog createEvent:](self, "createEvent:", 5LL);
  v9->var3.var4.var0 = a3;
  v9->var3.var4.var1 = a4;
  v9->var3.var4.var2 = a5;
  v9->var3.var0.var19 = 0LL;
  *self->events_list.stqh_last = v9;
  self->events_list.stqh_last = (quiclog_event **)&v9->var3.var0.var19;
}

- (void)logStreamTypeSet:(unint64_t)a3 owner:(unsigned __int8)a4 old_state:(unsigned __int8)a5 new_state:(unsigned __int8)a6
{
  uint64_t v11 = -[QUICLog createEvent:](self, "createEvent:", 7LL);
  v11->var3.var0.var0 = a3;
  v11->var3.var2.var1 = a4;
  v11->var3.var2.var2 = a5;
  v11->var3.var2.var3 = a6;
  v11->var3.var0.var19 = 0LL;
  *self->events_list.stqh_last = v11;
  self->events_list.stqh_last = (quiclog_event **)&v11->var3.var0.var19;
}

- (id)dumpData:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v5 setValue:@"network" forKey:@"type"];
  [v5 setValue:v4 forKey:@"flow"];
  id v19 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v6 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v6 setValue:v5 forKey:@"vantage_point"];
  id v7 = objc_alloc_init(MEMORY[0x189603FA8]);
  [v7 addObject:@"time"];
  [v7 addObject:@"CATEGORY"];
  [v7 addObject:@"EVENT_TYPE"];
  [v7 addObject:@"DATA"];
  [v6 setValue:v7 forKey:@"event_fields"];
  id v8 = objc_alloc_init(MEMORY[0x189603FA8]);
  p_events_list = &self->events_list;
  stqh_first = self->events_list.stqh_first;
  if (stqh_first)
  {
    uint64_t v11 = 0LL;
    do
    {
      switch(stqh_first->var0)
      {
        case 0:
          uint64_t v12 = -[QUICLog processParametersSet:](self, "processParametersSet:", stqh_first);
          goto LABEL_12;
        case 1:
        case 2:
          uint64_t v12 = -[QUICLog processPacketSentAndPacketRecieved:](self, "processPacketSentAndPacketRecieved:", stqh_first);
          goto LABEL_12;
        case 3:
          uint64_t v12 = -[QUICLog processStreamStateUpdated:](self, "processStreamStateUpdated:", stqh_first);
          goto LABEL_12;
        case 4:
          uint64_t v12 = -[QUICLog processMetricsUpdated:](self, "processMetricsUpdated:", stqh_first);
          goto LABEL_12;
        case 5:
          uint64_t v12 = -[QUICLog processCongestionStateUpdated:](self, "processCongestionStateUpdated:", stqh_first);
          goto LABEL_12;
        case 6:
          uint64_t v12 = -[QUICLog processPacketLost:](self, "processPacketLost:", stqh_first);
          goto LABEL_12;
        case 7:
          uint64_t v12 = -[QUICLog processStreamTypeSet:](self, "processStreamTypeSet:", stqh_first);
LABEL_12:
          uint64_t v13 = (void *)v12;

          uint64_t v11 = v13;
          break;
        default:
          break;
      }

      objc_msgSend(v8, "addObject:", v11, v19);
      var19 = (quiclog_event *)p_events_list->stqh_first->var3.var0.var19;
      p_events_list->stqh_first = var19;
      if (!var19) {
        self->events_list.stqh_last = &p_events_list->stqh_first;
      }
      -[QUICLog deallocEvent:](self, "deallocEvent:", stqh_first);
      stqh_first = self->events_list.stqh_first;
    }

    while (stqh_first);
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  objc_msgSend(v6, "setValue:forKey:", v8, @"events", v19);
  id v15 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v15 setValue:@"us" forKey:@"time_units"];
  [v6 setValue:v15 forKey:@"configuration"];
  [v20 addObject:v6];
  -[NSMutableDictionary setValue:forKey:](self->top_level_object, "setValue:forKey:", v20, @"traces");
  -[QUICLog dictToJsonString:](self, "dictToJsonString:", self->top_level_object);
  int v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 dataUsingEncoding:1];
  int v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)processParametersSet:(quiclog_event *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
  -[QUICLog addEventValues:event:](self, "addEventValues:event:", v5, a3);
  int v42 = (void *)objc_claimAutoreleasedReturnValue();

  id v6 = objc_alloc_init(MEMORY[0x189603FC8]);
  if (a3->var3.var0.var12 != 2)
  {
    +[QUICLog ownerString:](&OBJC_CLASS___QUICLog, "ownerString:");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setValue:v7 forKey:@"owner"];
  }

  -[QUICLog addOptionalSuperBoolToObject:key:value:]( self,  "addOptionalSuperBoolToObject:key:value:",  v6,  @"resumption_allowed",  a3->var3.var0.var9);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[QUICLog addOptionalSuperBoolToObject:key:value:]( self,  "addOptionalSuperBoolToObject:key:value:",  v8,  @"early_data_enabled",  a3->var3.var0.var10);
  -[QUICLog addOptionalCharPointerToObject:key:value:]( self,  "addOptionalCharPointerToObject:key:value:",  v9,  @"tls_cipher",  (char *)&a3->var3.var5 + 40);
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v11 = &quic_cid_describe_cid_buf3;
  if (quic_cid_describe_state % 3 == 2) {
    uint64_t v11 = &quic_cid_describe_cid_buf2;
  }
  if (quic_cid_describe_state % 3) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = &quic_cid_describe_cid_buf1;
  }
  ++quic_cid_describe_state;
  if (a3->var3.var0.var8[0] >= 0x14u) {
    uint64_t v13 = 20LL;
  }
  else {
    uint64_t v13 = a3->var3.var0.var8[0];
  }
  *uint64_t v12 = 0u;
  v12[1] = 0u;
  *(_OWORD *)((char *)v12 + 25) = 0u;
  if ((_DWORD)v13)
  {
    int v14 = &a3->var3.var0.var8[1];
    do
    {
      int v15 = *v14++;
      snprintf((char *)v12, 0x29uLL, "%s%02x", (const char *)v12, v15);
      --v13;
    }

    while (v13);
  }

  -[QUICLog addOptionalCharPointerToObject:key:value:]( self,  "addOptionalCharPointerToObject:key:value:",  v10,  @"original_destination_connection_id",  v12);
  int v16 = (void *)objc_claimAutoreleasedReturnValue();

  int v17 = &quic_cid_describe_cid_buf2;
  if (quic_cid_describe_state % 3 != 2) {
    int v17 = &quic_cid_describe_cid_buf3;
  }
  if (quic_cid_describe_state % 3) {
    int v18 = v17;
  }
  else {
    int v18 = &quic_cid_describe_cid_buf1;
  }
  ++quic_cid_describe_state;
  if (a3->var3.var0.var7[0] >= 0x14u) {
    uint64_t v19 = 20LL;
  }
  else {
    uint64_t v19 = a3->var3.var0.var7[0];
  }
  *int v18 = 0u;
  v18[1] = 0u;
  *(_OWORD *)((char *)v18 + 25) = 0u;
  if ((_DWORD)v19)
  {
    id v20 = &a3->var3.var0.var7[1];
    do
    {
      int v21 = *v20++;
      snprintf((char *)v18, 0x29uLL, "%s%02x", (const char *)v18, v21);
      --v19;
    }

    while (v19);
  }

  -[QUICLog addOptionalCharPointerToObject:key:value:]( self,  "addOptionalCharPointerToObject:key:value:",  v16,  @"retry_source_connection_id",  v18);
  int v22 = (void *)objc_claimAutoreleasedReturnValue();

  int v23 = &quic_cid_describe_cid_buf2;
  if (quic_cid_describe_state % 3 != 2) {
    int v23 = &quic_cid_describe_cid_buf3;
  }
  if (quic_cid_describe_state % 3) {
    int v24 = v23;
  }
  else {
    int v24 = &quic_cid_describe_cid_buf1;
  }
  ++quic_cid_describe_state;
  if (a3->var3.var0.var6[0] >= 0x14u) {
    uint64_t v25 = 20LL;
  }
  else {
    uint64_t v25 = a3->var3.var0.var6[0];
  }
  *int v24 = 0u;
  v24[1] = 0u;
  *(_OWORD *)((char *)v24 + 25) = 0u;
  if ((_DWORD)v25)
  {
    var10 = a3->var3.var3.var10;
    do
    {
      int v27 = *var10++;
      snprintf((char *)v24, 0x29uLL, "%s%02x", (const char *)v24, v27);
      --v25;
    }

    while (v25);
  }

  -[QUICLog addOptionalCharPointerToObject:key:value:]( self,  "addOptionalCharPointerToObject:key:value:",  v22,  @"initial_source_connection_id",  v24);
  int v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalSuperBoolToObject:key:value:]( self,  "addOptionalSuperBoolToObject:key:value:",  v28,  @"disable_active_migration",  a3->var3.var0.var11);
  int v29 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalUint64ToObject:key:value:]( self,  "addOptionalUint64ToObject:key:value:",  v29,  @"max_idle_timeout",  a3->var3.var0.var0);
  int v30 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalUint64ToObject:key:value:]( self,  "addOptionalUint64ToObject:key:value:",  v30,  @"max_udp_payload_size",  a3->var3.var0.var1);
  int v31 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalUint64ToObject:key:value:]( self,  "addOptionalUint64ToObject:key:value:",  v31,  @"ack_delay_exponent",  a3->var3.var0.var3);
  int v32 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalUint64ToObject:key:value:]( self,  "addOptionalUint64ToObject:key:value:",  v32,  @"max_ack_delay",  a3->var3.var0.var2);
  int v33 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalUint64ToObject:key:value:]( self,  "addOptionalUint64ToObject:key:value:",  v33,  @"active_connection_id_limit",  a3->var3.var0.var4);
  int v34 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalUint64ToObject:key:value:]( self,  "addOptionalUint64ToObject:key:value:",  v34,  @"initial_max_data",  *((void *)&a3->var3.var5 + 25));
  int v35 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalUint64ToObject:key:value:]( self,  "addOptionalUint64ToObject:key:value:",  v35,  @"initial_max_stream_data_bidi_local",  a3->var3.var0.var14);
  int v36 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalUint64ToObject:key:value:]( self,  "addOptionalUint64ToObject:key:value:",  v36,  @"initial_max_stream_data_bidi_remote",  a3->var3.var0.var15);
  int v37 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalUint64ToObject:key:value:]( self,  "addOptionalUint64ToObject:key:value:",  v37,  @"initial_max_stream_data_uni",  a3->var3.var0.var16);
  int v38 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalUint64ToObject:key:value:]( self,  "addOptionalUint64ToObject:key:value:",  v38,  @"initial_max_streams_bidi",  a3->var3.var0.var17);
  int v39 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalUint64ToObject:key:value:]( self,  "addOptionalUint64ToObject:key:value:",  v39,  @"initial_max_streams_uni",  a3->var3.var0.var18);
  int v40 = (void *)objc_claimAutoreleasedReturnValue();

  [v42 addObject:v40];
  return v42;
}

- (id)processPacketSentAndPacketRecieved:(quiclog_event *)a3
{
  v17[1] = *MEMORY[0x1895F89C0];
  id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
  -[QUICLog addEventValues:event:](self, "addEventValues:event:", v5, a3);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  id v7 = objc_alloc_init(MEMORY[0x189603FC8]);
  +[QUICLog packetTypeString:](&OBJC_CLASS___QUICLog, "packetTypeString:", a3->var3.var1.var0);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setValue:v8 forKey:@"packet_type"];

  if (a3->var3.var0.var1)
  {
    uint64_t v9 = -[QUICLog addPacketHeader:header:](self, "addPacketHeader:header:", v7);

    id v7 = (id)v9;
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v14 = _os_log_pack_size();
    int v15 = (char *)v17 - ((MEMORY[0x1895F8858](v14, v14) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136446210;
    *(void *)(v16 + 4) = "-[QUICLog processPacketSentAndPacketRecieved:]";
    qlog_internal(17, (uint64_t)v15, 687LL);
  }

  if (a3->var3.var0.var2)
  {
    uint64_t v10 = -[QUICLog addFrameList:frame_list:](self, "addFrameList:frame_list:", v7, &a3->var3.var5 + 1);

    id v7 = (id)v10;
  }

  -[QUICLog addOptionalSuperBoolToObject:key:value:]( self,  "addOptionalSuperBoolToObject:key:value:",  v7,  @"is_coalesced",  a3->var3.var1.var4);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3->var3.var1.var6.var0 != 5)
  {
    +[QUICLog packetSentRecievedTriggerString:](&OBJC_CLASS___QUICLog, "packetSentRecievedTriggerString:");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 setValue:v12 forKey:@"trigger"];
  }

  [v6 addObject:v11];

  return v6;
}

- (id)processStreamStateUpdated:(quiclog_event *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
  -[QUICLog addEventValues:event:](self, "addEventValues:event:", v5, a3);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  id v7 = objc_alloc_init(MEMORY[0x189603FC8]);
  -[QUICLog addMandatoryUint64ToObject:key:value:function_name:]( self,  "addMandatoryUint64ToObject:key:value:function_name:",  v7,  @"stream_id",  a3->var3.var0.var0,  "-[QUICLog processStreamStateUpdated:]");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[QUICLog streamTypeString:](&OBJC_CLASS___QUICLog, "streamTypeString:", a3->var3.var2.var1);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setValue:v9 forKey:@"stream_type"];
  if (a3->var3.var2.var2)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithInt:");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setValue:v10 forKey:@"old"];
  }

  if (a3->var3.var2.var3)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithInt:");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setValue:v11 forKey:@"new"];
  }

  if (a3->var3.var2.var5 != 2)
  {
    uint64_t v12 = +[QUICLog streamSideString:](&OBJC_CLASS___QUICLog, "streamSideString:");

    [v8 setValue:v12 forKey:@"stream_side"];
    uint64_t v9 = (void *)v12;
  }

  [v6 addObject:v8];

  return v6;
}

- (id)processMetricsUpdated:(quiclog_event *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
  -[QUICLog addEventValues:event:](self, "addEventValues:event:", v5, a3);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  id v7 = objc_alloc_init(MEMORY[0x189603FC8]);
  -[QUICLog addOptionalUint64ToObject:key:value:]( self,  "addOptionalUint64ToObject:key:value:",  v7,  @"min_rtt",  a3->var3.var0.var0);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalUint64ToObject:key:value:]( self,  "addOptionalUint64ToObject:key:value:",  v8,  @"smoothed_rtt",  a3->var3.var0.var1);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalUint64ToObject:key:value:]( self,  "addOptionalUint64ToObject:key:value:",  v9,  @"latest_rtt",  a3->var3.var0.var2);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalUint64ToObject:key:value:]( self,  "addOptionalUint64ToObject:key:value:",  v10,  @"rtt_variance",  a3->var3.var0.var3);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalUint64ToObject:key:value:]( self,  "addOptionalUint64ToObject:key:value:",  v11,  @"pto_count",  a3->var3.var0.var4);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalUint64ToObject:key:value:]( self,  "addOptionalUint64ToObject:key:value:",  v12,  @"congestion_window",  a3->var3.var3.var5);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalUint64ToObject:key:value:]( self,  "addOptionalUint64ToObject:key:value:",  v13,  @"bytes_in_flight",  a3->var3.var3.var6);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3->var3.var3.var7 != 0xFFFFFFFF)
  {
    uint64_t v15 = -[QUICLog addOptionalUint64ToObject:key:value:]( self,  "addOptionalUint64ToObject:key:value:",  v14,  @"ssthresh");

    uint64_t v14 = (void *)v15;
  }

  -[QUICLog addOptionalUint64ToObject:key:value:]( self,  "addOptionalUint64ToObject:key:value:",  v14,  @"packets_in_flight",  a3->var3.var3.var8);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[QUICLog addOptionalSuperBoolToObject:key:value:]( self,  "addOptionalSuperBoolToObject:key:value:",  v16,  @"in_recovery",  a3->var3.var3.var9);
  int v17 = (void *)objc_claimAutoreleasedReturnValue();

  [v6 addObject:v17];
  return v6;
}

- (id)processCongestionStateUpdated:(quiclog_event *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
  -[QUICLog addEventValues:event:](self, "addEventValues:event:", v5, a3);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  id v7 = objc_alloc_init(MEMORY[0x189603FC8]);
  if (a3->var3.var4.var0 != 5)
  {
    +[QUICLog congestionStateString:](&OBJC_CLASS___QUICLog, "congestionStateString:");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setValue:v8 forKey:@"old"];
  }

  if (a3->var3.var4.var1 != 5)
  {
    +[QUICLog congestionStateString:](&OBJC_CLASS___QUICLog, "congestionStateString:", a3->var3.var4.var0);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setValue:v9 forKey:@"new"];
  }

  if (a3->var3.var4.var2 != 2)
  {
    +[QUICLog congestionTriggerString:](&OBJC_CLASS___QUICLog, "congestionTriggerString:");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setValue:v10 forKey:@"trigger"];
  }

  [v6 addObject:v7];

  return v6;
}

- (id)processPacketLost:(quiclog_event *)a3
{
  v18[1] = *MEMORY[0x1895F89C0];
  id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
  -[QUICLog addEventValues:event:](self, "addEventValues:event:", v5, a3);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  id v7 = objc_alloc_init(MEMORY[0x189603FC8]);
  +[QUICLog packetTypeString:](&OBJC_CLASS___QUICLog, "packetTypeString:", a3->var3.var1.var0);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setValue:v8 forKey:@"packet_type"];

  if (a3->var3.var0.var1)
  {
    uint64_t v9 = -[QUICLog addPacketHeader:header:](self, "addPacketHeader:header:", v7);

    id v7 = (id)v9;
  }

  else if (qlog_debug_enabled {
         || (qlog_nwlog_enabled & 1) != 0
  }
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
  {
    uint64_t v15 = _os_log_pack_size();
    uint64_t v16 = (char *)v18 - ((MEMORY[0x1895F8858](v15, v15) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136446210;
    *(void *)(v17 + 4) = "-[QUICLog processPacketLost:]";
    qlog_internal(17, (uint64_t)v16, 838LL);
  }

  p_var2 = &a3->var3.var0.var2;
  if (a3->var3.var0.var2)
  {
    uint64_t v11 = -[QUICLog addFrameList:frame_list:](self, "addFrameList:frame_list:", v7, p_var2);

    id v7 = (id)v11;
  }

  uint64_t var1 = a3->var3.var1.var6.var1;
  if ((_DWORD)var1 != 3)
  {
    +[QUICLog packetLostTriggerString:](&OBJC_CLASS___QUICLog, "packetLostTriggerString:", var1, p_var2);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setValue:v13 forKey:@"trigger"];
  }

  [v6 addObject:v7];

  return v6;
}

- (id)processStreamTypeSet:(quiclog_event *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
  -[QUICLog addEventValues:event:](self, "addEventValues:event:", v5, a3);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  id v7 = objc_alloc_init(MEMORY[0x189603FC8]);
  -[QUICLog addMandatoryUint64ToObject:key:value:function_name:]( self,  "addMandatoryUint64ToObject:key:value:function_name:",  v7,  @"stream_id",  a3->var3.var0.var0,  "-[QUICLog processStreamTypeSet:]");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3->var3.var2.var1 != 2)
  {
    +[QUICLog ownerString:](&OBJC_CLASS___QUICLog, "ownerString:");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setValue:v9 forKey:@"owner"];
  }

  +[QUICLog streamTypeString:](&OBJC_CLASS___QUICLog, "streamTypeString:", a3->var3.var2.var2);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setValue:v10 forKey:@"old"];
  +[QUICLog streamTypeString:](&OBJC_CLASS___QUICLog, "streamTypeString:", a3->var3.var2.var3);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  [v8 setValue:v11 forKey:@"new"];
  [v6 addObject:v8];

  return v6;
}

- (id)addEventValues:(id)a3 event:(quiclog_event *)a4
{
  id v5 = a3;
  [MEMORY[0x189607968] numberWithUnsignedLongLong:a4->var2];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 addObject:v6];
  +[QUICLog categoryString:](&OBJC_CLASS___QUICLog, "categoryString:", a4->var0);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 addObject:v7];

  +[QUICLog eventTypeString:](&OBJC_CLASS___QUICLog, "eventTypeString:", a4->var0);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 addObject:v8];

  return v5;
}

- (id)addPacketHeader:(id)a3 header:(packet_header *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x189603FC8]);
  objc_msgSend(NSString, "stringWithFormat:", @"%llu", a4->var0);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setValue:v7 forKey:@"packet_number"];
  if (a4->var1 != -1LL)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setValue:v8 forKey:@"packet_size"];
  }

  if (a4->var2 != -1LL)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setValue:v9 forKey:@"length"];
  }

  if (a4->var3)
  {
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%s", a4->var3);

    [v6 setValue:v10 forKey:@"version"];
    id v7 = (void *)v10;
  }

  if (a4->var4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%d", a4->var4);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

    [v6 setValue:v11 forKey:@"scil"];
    objc_msgSend(NSString, "stringWithFormat:", @"%s", a4->var6);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    [v6 setValue:v7 forKey:@"scid"];
  }

  if (a4->var5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%d", a4->var5);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

    [v6 setValue:v12 forKey:@"dcil"];
    objc_msgSend(NSString, "stringWithFormat:", @"%s", a4->var7);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    [v6 setValue:v7 forKey:@"dcid"];
  }

  [v5 setValue:v6 forKey:@"header"];

  return v5;
}

- (id)addFrameList:(id)a3 frame_list:(quic_frame_list *)a4
{
  id v87 = a3;
  unint64_t v5 = 0x189603000uLL;
  id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
  if (a4->var0)
  {
    id v7 = 0LL;
    unint64_t v8 = 0x189607000LL;
    do
    {
      id v9 = objc_alloc_init(MEMORY[0x189603FC8]);
      uint64_t v10 = v9;
      var0 = a4->var0;
      uint64_t v12 = *(void *)a4->var0;
      if (v12 > 12237311)
      {
        if ((unint64_t)(v12 - 12237312) < 2)
        {
          if (*((void *)var0 + 3) != -1LL)
          {
            objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 3));
            int v31 = (void *)objc_claimAutoreleasedReturnValue();
            [v10 setValue:v31 forKey:@"ack_mp_space_id"];
          }

          if (*((void *)var0 + 5) != -1LL)
          {
            objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 5));
            int v32 = (void *)objc_claimAutoreleasedReturnValue();
            [v10 setValue:v32 forKey:@"ack_delay"];
          }

          if (*(void *)var0 == 12237313LL)
          {
            if (*((void *)var0 + 6) == -1LL
              || (objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 6)),
                  int v33 = (void *)objc_claimAutoreleasedReturnValue(),
                  [v10 setValue:v33 forKey:@"ect0"],
                  v33,
                  *(void *)var0 == 12237313LL))
            {
              if (*((void *)var0 + 7) == -1LL
                || (objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 7)),
                    int v34 = (void *)objc_claimAutoreleasedReturnValue(),
                    [v10 setValue:v34 forKey:@"ect1"],
                    v34,
                    *(void *)var0 == 12237313LL))
              {
                if (*((void *)var0 + 8) != -1LL)
                {
                  objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 8));
                  int v35 = (void *)objc_claimAutoreleasedReturnValue();
                  [v10 setValue:v35 forKey:@"ce"];
                }
              }
            }
          }

          id v36 = objc_alloc_init(*(Class *)(v5 + 4008));
          if (!*((void *)var0 + 9))
          {
            id v37 = objc_alloc_init(*(Class *)(v5 + 4008));
            [MEMORY[0x189607968] numberWithUnsignedLongLong:*((void *)var0 + 4)];
            int v38 = (void *)objc_claimAutoreleasedReturnValue();
            [v37 addObject:v38];

            [MEMORY[0x189607968] numberWithUnsignedLongLong:*((void *)var0 + 4)];
            int v39 = (void *)objc_claimAutoreleasedReturnValue();
            [v37 addObject:v39];

            unint64_t v8 = 0x189607000LL;
            [v36 addObject:v37];
          }

          v88[0] = MEMORY[0x1895F87A8];
          v88[1] = 3221225472LL;
          v88[2] = __35__QUICLog_addFrameList_frame_list___block_invoke_2;
          v88[3] = &unk_18A1168A8;
          id v89 = v36;
          id v40 = v36;
          quic_ack_process_blocks((uint64_t *)var0, (uint64_t)v88);
          [v10 setValue:v40 forKey:@"acked_ranges"];

          id v7 = @"ack_mp";
        }

        else if (v12 == 12237317)
        {
          objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 2));
          int v77 = (void *)objc_claimAutoreleasedReturnValue();
          [v10 setValue:v77 forKey:@"id_type"];
          if (*((void *)var0 + 2) != 2LL)
          {
            uint64_t v78 = objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 3));

            [v10 setValue:v78 forKey:@"id"];
            int v77 = (void *)v78;
          }

          objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 4));
          int v79 = (void *)objc_claimAutoreleasedReturnValue();

          [v10 setValue:v79 forKey:@"raw_error_code"];
          objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%s", *((void *)var0 + 6));
          int v80 = (void *)objc_claimAutoreleasedReturnValue();

          [v10 setValue:v80 forKey:@"reason"];
          id v7 = @"path_abandon";
        }

        else if (v12 == 12237318)
        {
          objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 2));
          int v22 = (void *)objc_claimAutoreleasedReturnValue();
          [v10 setValue:v22 forKey:@"id_type"];
          if (*((void *)var0 + 2) != 2LL)
          {
            uint64_t v23 = objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 3));

            [v10 setValue:v23 forKey:@"id"];
            int v22 = (void *)v23;
          }

          objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 4));
          int v24 = (void *)objc_claimAutoreleasedReturnValue();

          [v10 setValue:v24 forKey:@"sequence_number"];
          objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 5));
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();

          [v10 setValue:v25 forKey:@"status"];
          id v7 = @"path_status";
        }
      }

      else
      {
        switch(v12)
        {
          case 0LL:
            objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%hd", *((__int16 *)var0 + 9));
            int v41 = (void *)objc_claimAutoreleasedReturnValue();
            [v10 setValue:v41 forKey:@"payload_length"];

            id v7 = @"padding";
            break;
          case 1LL:
            id v7 = @"ping";
            break;
          case 2LL:
          case 3LL:
            if (*((void *)var0 + 5) != -1LL)
            {
              objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 5));
              uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
              [v10 setValue:v13 forKey:@"ack_delay"];

              uint64_t v12 = *(void *)var0;
            }

            if (v12 == 3)
            {
              if (*((void *)var0 + 6) == -1LL
                || (objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 6)),
                    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(),
                    [v10 setValue:v14 forKey:@"ect0"],
                    v14,
                    *(void *)var0 == 3LL))
              {
                if (*((void *)var0 + 7) == -1LL
                  || (objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 7)),
                      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(),
                      [v10 setValue:v15 forKey:@"ect1"],
                      v15,
                      *(void *)var0 == 3LL))
                {
                  if (*((void *)var0 + 8) != -1LL)
                  {
                    objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 8));
                    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
                    [v10 setValue:v16 forKey:@"ce"];
                  }
                }
              }
            }

            id v17 = objc_alloc_init(*(Class *)(v5 + 4008));
            if (!*((void *)var0 + 9))
            {
              id v18 = objc_alloc_init(*(Class *)(v5 + 4008));
              [MEMORY[0x189607968] numberWithUnsignedLongLong:*((void *)var0 + 4)];
              uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
              [v18 addObject:v19];

              [MEMORY[0x189607968] numberWithUnsignedLongLong:*((void *)var0 + 4)];
              id v20 = (void *)objc_claimAutoreleasedReturnValue();
              [v18 addObject:v20];

              unint64_t v8 = 0x189607000LL;
              [v17 addObject:v18];
            }

            v90[0] = MEMORY[0x1895F87A8];
            v90[1] = 3221225472LL;
            v90[2] = __35__QUICLog_addFrameList_frame_list___block_invoke;
            v90[3] = &unk_18A1168A8;
            id v91 = v17;
            id v21 = v17;
            quic_ack_process_blocks((uint64_t *)var0, (uint64_t)v90);
            [v10 setValue:v21 forKey:@"acked_ranges"];

            id v7 = @"ack";
            break;
          case 4LL:
            objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 2));
            int v42 = (void *)objc_claimAutoreleasedReturnValue();
            [v10 setValue:v42 forKey:@"stream_id"];
            objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 4));
            int v43 = (void *)objc_claimAutoreleasedReturnValue();

            [v10 setValue:v43 forKey:@"final_size"];
            [MEMORY[0x189607968] numberWithUnsignedLongLong:*((void *)var0 + 3)];
            int v44 = (void *)objc_claimAutoreleasedReturnValue();
            [v10 setValue:v44 forKey:@"error_code"];

            id v7 = @"reset_stream";
            break;
          case 5LL:
            objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 2));
            int v45 = (void *)objc_claimAutoreleasedReturnValue();
            [v10 setValue:v45 forKey:@"stream_id"];
            [MEMORY[0x189607968] numberWithUnsignedLongLong:*((void *)var0 + 3)];
            int v46 = (void *)objc_claimAutoreleasedReturnValue();
            [v10 setValue:v46 forKey:@"error_code"];

            id v7 = @"stop_sending";
            break;
          case 6LL:
            objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 3));
            int v47 = (void *)objc_claimAutoreleasedReturnValue();
            [v10 setValue:v47 forKey:@"offset"];
            [MEMORY[0x189607968] numberWithUnsignedLongLong:*((void *)var0 + 4)];
            int v48 = (void *)objc_claimAutoreleasedReturnValue();
            [v10 setValue:v48 forKey:@"length"];

            id v7 = @"crypto";
            break;
          case 7LL:
            [MEMORY[0x189607968] numberWithUnsignedLongLong:*((void *)var0 + 3)];
            int v49 = (void *)objc_claimAutoreleasedReturnValue();
            [v10 setValue:v49 forKey:@"length"];

            id v7 = @"new_token";
            break;
          case 16LL:
            objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 2));
            int v50 = (void *)objc_claimAutoreleasedReturnValue();
            [v10 setValue:v50 forKey:@"maximum"];

            id v7 = @"max_data";
            break;
          case 17LL:
            objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 2));
            int v51 = (void *)objc_claimAutoreleasedReturnValue();
            [v10 setValue:v51 forKey:@"stream_id"];
            objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 3));
            int v52 = (void *)objc_claimAutoreleasedReturnValue();

            [v10 setValue:v52 forKey:@"maximum"];
            id v7 = @"max_stream_data";
            break;
          case 18LL:
            int v53 = @"bidirectional";
            goto LABEL_57;
          case 19LL:
            int v53 = @"unidirectional";
LABEL_57:
            [v9 setValue:v53 forKey:@"stream_type"];
            objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 2));
            int v54 = (void *)objc_claimAutoreleasedReturnValue();
            [v10 setValue:v54 forKey:@"maximum"];

            id v7 = @"max_streams";
            break;
          case 20LL:
            objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 2));
            int v55 = (void *)objc_claimAutoreleasedReturnValue();
            [v10 setValue:v55 forKey:@"limit"];

            id v7 = @"data_blocked";
            break;
          case 21LL:
            objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 2));
            int v56 = (void *)objc_claimAutoreleasedReturnValue();
            [v10 setValue:v56 forKey:@"stream_id"];
            objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 3));
            int v57 = (void *)objc_claimAutoreleasedReturnValue();

            [v10 setValue:v57 forKey:@"limit"];
            id v7 = @"stream_data_blocked";
            break;
          case 22LL:
            int v58 = @"bidirectional";
            goto LABEL_62;
          case 23LL:
            int v58 = @"unidirectional";
LABEL_62:
            [v9 setValue:v58 forKey:@"stream_type"];
            objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 2));
            unsigned int v59 = (void *)objc_claimAutoreleasedReturnValue();
            [v10 setValue:v59 forKey:@"limit"];

            id v7 = @"streams_blocked";
            break;
          case 24LL:
            objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 2));
            uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue();
            [v10 setValue:v60 forKey:@"sequence_number"];
            objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 3));
            unsigned int v61 = (void *)objc_claimAutoreleasedReturnValue();

            [v10 setValue:v61 forKey:@"retire_prior_to"];
            [MEMORY[0x189607968] numberWithUnsignedShort:*((unsigned __int16 *)var0 + 4)];
            uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue();
            [v10 setValue:v62 forKey:@"length"];
            int v63 = *(void **)(v8 + 2600);
            int v64 = &quic_cid_describe_cid_buf3;
            if (quic_cid_describe_state % 3 == 2) {
              int v64 = &quic_cid_describe_cid_buf2;
            }
            if (quic_cid_describe_state % 3) {
              int v65 = v64;
            }
            else {
              int v65 = &quic_cid_describe_cid_buf1;
            }
            ++quic_cid_describe_state;
            unsigned int v66 = *((unsigned __int8 *)var0 + 32);
            *(_OWORD *)((char *)v65 + 25) = 0u;
            if (v66 >= 0x14) {
              uint64_t v67 = 20LL;
            }
            else {
              uint64_t v67 = v66;
            }
            *int v65 = 0uLL;
            v65[1] = 0uLL;
            if ((_DWORD)v67)
            {
              int v68 = (unsigned __int8 *)var0 + 33;
              do
              {
                int v69 = *v68++;
                snprintf((char *)v65, 0x29uLL, "%s%02x", (const char *)v65, v69);
                --v67;
              }

              while (v67);
            }

            objc_msgSend(v63, "stringWithFormat:", @"%s", v65);
            int v70 = (void *)objc_claimAutoreleasedReturnValue();

            [v10 setValue:v70 forKey:@"connection_id"];
            id v7 = @"new_connection_id";
            unint64_t v5 = 0x189603000LL;
            unint64_t v8 = 0x189607000LL;
            break;
          case 25LL:
            objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 2));
            int v71 = (void *)objc_claimAutoreleasedReturnValue();
            [v10 setValue:v71 forKey:@"sequence_number"];

            id v7 = @"retire_connection_id";
            break;
          case 26LL:
            if (*((void *)var0 + 2) != -1LL)
            {
              objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"0x%llx", *((void *)var0 + 2));
              int v72 = (void *)objc_claimAutoreleasedReturnValue();
              [v10 setValue:v72 forKey:@"data"];
            }

            id v7 = @"path_challenge";
            break;
          case 27LL:
            if (*((void *)var0 + 2) != -1LL)
            {
              objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"0x%llx", *((void *)var0 + 2));
              int v73 = (void *)objc_claimAutoreleasedReturnValue();
              [v10 setValue:v73 forKey:@"data"];
            }

            id v7 = @"path_response";
            break;
          case 28LL:
          case 29LL:
            [v9 setValue:@"transport" forKey:@"error_space"];
            objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 2));
            int v26 = (void *)objc_claimAutoreleasedReturnValue();
            [v10 setValue:v26 forKey:@"raw_error_code"];
            objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%s", *((void *)var0 + 5));
            int v27 = (void *)objc_claimAutoreleasedReturnValue();

            [v10 setValue:v27 forKey:@"reason"];
            if (*((void *)var0 + 3) != -1LL)
            {
              uint64_t v28 = objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 3));

              [v10 setValue:v28 forKey:@"reason"];
              int v27 = (void *)v28;
            }

            id v7 = @"connection_close";
            break;
          case 30LL:
            id v7 = @"handshake_done";
            break;
          case 48LL:
          case 49LL:
            if (*((void *)var0 + 5) != -1LL)
            {
              objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 5));
              int v29 = (void *)objc_claimAutoreleasedReturnValue();
              [v10 setValue:v29 forKey:@"length"];
            }

            if (*((void *)var0 + 3) != -1LL)
            {
              objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 3));
              int v30 = (void *)objc_claimAutoreleasedReturnValue();
              [v10 setValue:v30 forKey:@"flow_id"];
            }

            id v7 = @"datagram";
            break;
          case 172LL:
            id v7 = @"immediate_ack";
            break;
          case 175LL:
            if (*((void *)var0 + 2) != -1LL)
            {
              objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 2));
              int v74 = (void *)objc_claimAutoreleasedReturnValue();
              [v10 setValue:v74 forKey:@"sequence"];
            }

            if (*((void *)var0 + 3) != -1LL)
            {
              objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 3));
              int v75 = (void *)objc_claimAutoreleasedReturnValue();
              [v10 setValue:v75 forKey:@"threshold"];
            }

            if (*((void *)var0 + 4) != -1LL)
            {
              objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 4));
              int v76 = (void *)objc_claimAutoreleasedReturnValue();
              [v10 setValue:v76 forKey:@"request_max_ack_delay"];
            }

            if ((*((_BYTE *)var0 + 40) & 1) != 0) {
              [v10 setValue:@"true" forKey:@"ignore_order"];
            }
            id v7 = @"ack_frequency";
            break;
          default:
            break;
        }
      }

      if ((unint64_t)(*(void *)var0 - 8LL) <= 6)
      {
        objc_msgSend(*(id *)(v8 + 2600), "stringWithFormat:", @"%llu", *((void *)var0 + 4));
        int v81 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 setValue:v81 forKey:@"offset"];
        [MEMORY[0x189607968] numberWithUnsignedLongLong:*((void *)var0 + 5)];
        int v82 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 setValue:v82 forKey:@"length"];
        [MEMORY[0x189607968] numberWithUnsignedLongLong:*((void *)var0 + 3)];
        int v83 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 setValue:v83 forKey:@"stream_id"];
        if ((*((_BYTE *)var0 + 16) & 1) != 0) {
          [v10 setValue:@"true" forKey:@"fin"];
        }

        id v7 = @"stream";
        unint64_t v8 = 0x189607000uLL;
      }

      [v10 setValue:v7 forKey:@"frame_type"];
      [v6 addObject:v10];
      uint64_t v84 = *((void *)var0 + 12);
      int v85 = (quic_frame **)*((void *)var0 + 13);
      if (v84)
      {
        *(void *)(v84 + 104) = v85;
        int v85 = (quic_frame **)*((void *)var0 + 13);
      }

      else
      {
        a4->uint64_t var1 = v85;
      }

      *int v85 = (quic_frame *)v84;
    }

    while (a4->var0);
  }

  [v87 setValue:v6 forKey:@"frames"];

  return v87;
}

- (id)addOptionalCharPointerToObject:(id)a3 key:(id)a4 value:(const char *)a5
{
  id v7 = a3;
  if (a5)
  {
    unint64_t v8 = (void *)NSString;
    id v9 = a4;
    [v8 stringWithCString:a5 encoding:1];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setValue:v10 forKey:v9];
  }

  return v7;
}

- (id)addMandatoryCharPointerToObject:(id)a3 key:(id)a4 value:(const char *)a5 function_name:(const char *)a6
{
  id v8 = a3;
  if (a5)
  {
    id v9 = (void *)NSString;
    id v10 = a4;
    [v9 stringWithCString:a5 encoding:1];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setValue:v11 forKey:v10];
  }

  return v8;
}

- (id)addOptionalSuperBoolToObject:(id)a3 key:(id)a4 value:(char)a5
{
  int v5 = a5;
  id v7 = a3;
  id v8 = a4;
  if (v5 != -1)
  {
    if (v5 == 1) {
      id v9 = @"true";
    }
    else {
      id v9 = @"false";
    }
    [v7 setValue:v9 forKey:v8];
  }

  return v7;
}

- (id)addMandatorySuperBoolToObject:(id)a3 key:(id)a4 value:(char)a5 function_name:(const char *)a6
{
  int v6 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v6 != -1)
  {
    if (v6 == 1) {
      id v10 = @"true";
    }
    else {
      id v10 = @"false";
    }
    [v8 setValue:v10 forKey:v9];
  }

  return v8;
}

- (id)addOptionalUint64ToObject:(id)a3 key:(id)a4 value:(unint64_t)a5
{
  id v7 = a3;
  if (a5 != -1LL)
  {
    id v8 = (void *)MEMORY[0x189607968];
    id v9 = a4;
    [v8 numberWithUnsignedLongLong:a5];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setValue:v10 forKey:v9];
  }

  return v7;
}

- (id)addMandatoryUint64ToObject:(id)a3 key:(id)a4 value:(unint64_t)a5 function_name:(const char *)a6
{
  id v8 = a3;
  if (a5 != -1LL)
  {
    id v9 = (void *)MEMORY[0x189607968];
    id v10 = a4;
    [v9 numberWithUnsignedLongLong:a5];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setValue:v11 forKey:v10];
  }

  return v8;
}

- (id)dictToJsonString:(id)a3
{
  id v8 = 0LL;
  [MEMORY[0x1896078D8] dataWithJSONObject:a3 options:2 error:&v8];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v8;
  int v5 = v4;
  if (v3)
  {
    int v6 = (void *)[objc_alloc(NSString) initWithData:v3 encoding:1];
  }

  else
  {
    NSLog(@"error parsing JSON: %@", v4);
    int v6 = 0LL;
  }

  return v6;
}

- (id)jsonStringToDict:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = 0LL;
  [MEMORY[0x1896078D8] JSONObjectWithData:v3 options:0 error:&v9];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = v9;
  int v6 = v5;
  if (v4) {
    id v7 = v4;
  }
  else {
    NSLog(@"error parsing JSON: %@", v5);
  }

  return v4;
}

- (void)setEntryInTopLevelObject:(id)a3 value:(id)a4
{
}

- (void).cxx_destruct
{
}

uint64_t __35__QUICLog_addFrameList_frame_list___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
  [MEMORY[0x189607968] numberWithUnsignedLongLong:a2];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 addObject:v7];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 addObject:v8];

  [*(id *)(a1 + 32) addObject:v6];
  return 1LL;
}

uint64_t __35__QUICLog_addFrameList_frame_list___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
  [MEMORY[0x189607968] numberWithUnsignedLongLong:a2];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 addObject:v7];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 addObject:v8];

  [*(id *)(a1 + 32) addObject:v6];
  return 1LL;
}

+ (int)packetType:(quic_packet *)a3
{
  if ((*((_BYTE *)a3 + 233) & 1) != 0) {
    return 6;
  }
  return dword_187C04774[(a3->var7 - 1)];
}

+ (id)categoryString:(int)a3
{
  else {
    return off_18A1168C8[a3 - 4];
  }
}

+ (id)eventTypeString:(int)a3
{
  else {
    return off_18A1168E8[a3 - 1];
  }
}

+ (id)ownerString:(unsigned __int8)a3
{
  v3 = @"local";
  if (a3 == 1) {
    v3 = @"remote";
  }
  if (a3 == 2) {
    return @"unknown";
  }
  else {
    return (id)v3;
  }
}

+ (id)packetTypeString:(int)a3
{
  else {
    return off_18A116920[a3];
  }
}

+ (id)streamTypeString:(unsigned __int8)a3
{
  v3 = @"unidirectional";
  if (!a3) {
    v3 = @"bidirectional";
  }
  if (a3 == 2) {
    return @"datagram";
  }
  else {
    return (id)v3;
  }
}

+ (id)streamSideString:(unsigned __int8)a3
{
  v3 = @"sending";
  if (a3 == 1) {
    v3 = @"recieving";
  }
  if (a3 == 2) {
    return @"unknown";
  }
  else {
    return (id)v3;
  }
}

+ (id)congestionTriggerString:(unsigned __int8)a3
{
  v3 = @"persistent_congestion";
  if (a3 == 1) {
    v3 = @"ecn";
  }
  if (a3 == 2) {
    return @"unknown";
  }
  else {
    return (id)v3;
  }
}

+ (id)congestionStateString:(unsigned __int8)a3
{
  else {
    return off_18A116958[(a3 - 1)];
  }
}

+ (id)packetLostTriggerString:(unsigned __int8)a3
{
  else {
    return off_18A116980[(a3 - 1)];
  }
}

+ (id)packetSentRecievedTriggerString:(int)a3
{
  else {
    return off_18A116998[a3 - 1];
  }
}

+ (id)flowTypeString:(unsigned __int8)a3
{
  if (a3) {
    return @"server";
  }
  else {
    return @"client";
  }
}

@end