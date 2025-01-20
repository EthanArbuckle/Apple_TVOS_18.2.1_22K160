@interface NEIKEv2RTT
- (BOOL)getCurrentTime:(uint64_t)a1;
- (NEIKEv2RTT)init;
- (uint64_t)resetRTTMeasurement;
- (unint64_t)nextRetransmissionInterval;
- (void)updateRTT:(int)a3 responseMessageID:;
@end

@implementation NEIKEv2RTT

- (NEIKEv2RTT)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NEIKEv2RTT;
  v2 = -[NEIKEv2RTT init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_rxt_cur = 1000LL;
    v2->_lastRequestMessageID = -1;
    v2->_rtt_cur = 0LL;
    v2->_srtt = 0LL;
    *(_OWORD *)&v2->_rtt_var = xmmword_187873220;
    *(_OWORD *)&v2->_rtt_min = xmmword_187873230;
    v2->_rxt_shift = 0;
    v4 = v2;
  }

  else
  {
    ne_log_obj();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v7[0] = 0;
      _os_log_fault_impl(&dword_1876B1000, v6, OS_LOG_TYPE_FAULT, "[super init] failed", (uint8_t *)v7, 2u);
    }
  }

  return v3;
}

- (BOOL)getCurrentTime:(uint64_t)a1
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (getCurrentTime__onceToken != -1) {
      dispatch_once(&getCurrentTime__onceToken, &__block_literal_global_24006);
    }
    uint64_t v2 = mach_continuous_time() * getCurrentTime__tb_info / *(unsigned int *)algn_18C6E3F6C;
    *(void *)a1 = v2 / 0x3B9ACA00;
    *(_DWORD *)(a1 + 8) = v2 % 0x3B9ACA00 / 0x3E8;
  }

  else
  {
    ne_log_obj();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      int v5 = 136315138;
      v6 = "-[NEIKEv2RTT getCurrentTime:]";
      _os_log_fault_impl(&dword_1876B1000, v4, OS_LOG_TYPE_FAULT, "%s called with null now", (uint8_t *)&v5, 0xCu);
    }
  }

  return a1 != 0;
}

uint64_t __29__NEIKEv2RTT_getCurrentTime___block_invoke()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  uint64_t result = mach_timebase_info((mach_timebase_info_t)&getCurrentTime__tb_info);
  if ((_DWORD)result)
  {
    int v2 = result;
    ne_log_obj();
    v1 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v4 = v2;
      _os_log_fault_impl(&dword_1876B1000, v1, OS_LOG_TYPE_FAULT, "mach_timebase_info returned %u", buf, 8u);
    }

    abort();
  }

  return result;
}

- (uint64_t)resetRTTMeasurement
{
  unint64_t v1 = *(void *)(result + 24);
  unint64_t v2 = *(void *)(result + 48);
  unint64_t v3 = *(void *)(result + 32) + (v1 >> 3);
  if (v2 <= v3 >> 2) {
    unint64_t v4 = v3 >> 2;
  }
  else {
    unint64_t v4 = *(void *)(result + 48);
  }
  *(void *)(result + 64) = v4;
  if (v4 >= 0xFA01)
  {
    unint64_t v2 = 64000LL;
LABEL_10:
    *(void *)(result + 64) = v2;
  }

  *(void *)(result + 40) = 0LL;
  *(_WORD *)(result + 8) = 0;
  *(_DWORD *)(result + 12) = -1;
  return result;
}

- (void)updateRTT:(int)a3 responseMessageID:
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  if (a1)
  {
    if (*(_DWORD *)(a1 + 12) == a3)
    {
      if (-[NEIKEv2RTT getCurrentTime:]((uint64_t)&v21))
      {
        uint64_t v8 = (v22 / 1000);
        uint64_t v9 = 1000 * v21 - *(void *)(a1 + 40);
        uint64_t v10 = v9 + v8;
        if ((int)v9 + (int)v8 >= 1)
        {
          ++*(void *)(a1 + 56);
          *(void *)(a1 + 16) = (v9 + v8);
          ne_log_obj();
          v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v24 = v5;
            __int16 v25 = 1024;
            int v26 = v10;
            _os_log_impl(&dword_1876B1000, v11, OS_LOG_TYPE_INFO, "%@, current rtt %u", buf, 0x12u);
          }

          unint64_t v12 = *(void *)(a1 + 24);
          if (v12)
          {
            uint64_t v13 = 4 * v10 - (v12 >> 3);
            unint64_t v14 = v12 + (int)v13;
            if (v14 <= 1) {
              unint64_t v14 = 1LL;
            }
            unint64_t v15 = *(void *)(a1 + 32) + (int)(v13 - (*(void *)(a1 + 32) >> 2));
            if (v15 <= 1) {
              uint64_t v16 = 1LL;
            }
            else {
              uint64_t v16 = v15;
            }
          }

          else
          {
            unint64_t v14 = 32 * (int)v10;
            uint64_t v16 = 8 * (int)v10;
          }

          *(void *)(a1 + 24) = v14;
          *(void *)(a1 + 32) = v16;
          unint64_t v18 = *(void *)(a1 + 48);
          unint64_t v19 = v16 + (v14 >> 3);
          if (v18 <= v19 >> 2) {
            unint64_t v20 = v19 >> 2;
          }
          else {
            unint64_t v20 = *(void *)(a1 + 48);
          }
          *(void *)(a1 + 64) = v20;
          if (v20 >= v18)
          {
            unint64_t v18 = 64000LL;
          }

          *(void *)(a1 + 64) = v18;
        }

- (unint64_t)nextRetransmissionInterval
{
  if (!a1) {
    return 0LL;
  }
  unint64_t v1 = *(void *)(a1 + 48);
  unint64_t v2 = *(void *)(a1 + 32) + (*(void *)(a1 + 24) >> 3);
  if (v1 <= v2 >> 2) {
    unint64_t v3 = v2 >> 2;
  }
  else {
    unint64_t v3 = *(void *)(a1 + 48);
  }
  unsigned int v4 = *(unsigned __int16 *)(a1 + 8);
  unint64_t v5 = v3 * IKEV2_SESSION_RXMT_BACKOFF[*(unsigned __int16 *)(a1 + 8)];
  *(void *)(a1 + 64) = v5;
  if (v5 >= v1)
  {
    unint64_t v1 = 64000LL;
  }

  *(void *)(a1 + 64) = v1;
  unint64_t v5 = v1;
LABEL_9:
  if (v4 <= 0xB) {
    *(_WORD *)(a1 + 8) = v4 + 1;
  }
  return v5;
}

@end