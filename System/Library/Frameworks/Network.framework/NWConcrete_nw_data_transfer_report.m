@interface NWConcrete_nw_data_transfer_report
- (NSString)description;
- (NWConcrete_nw_data_transfer_report)init;
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation NWConcrete_nw_data_transfer_report

- (NWConcrete_nw_data_transfer_report)init
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_data_transfer_report;
  v2 = -[NWConcrete_nw_data_transfer_report init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    *((_DWORD *)v2 + 13) = 1;
    v4 = v2;
    goto LABEL_3;
  }

  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_data_transfer_report init]";
  v7 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v14 = 0;
  if (__nwlog_fault(v7, &type, &v14))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_data_transfer_report init]";
        _os_log_impl(&dword_181A5C000, v8, v9, "%{public}s [super init] failed", buf, 0xCu);
      }
    }

    else if (v14)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v11 = type;
      BOOL v12 = os_log_type_enabled(v8, type);
      if (backtrace_string)
      {
        if (v12)
        {
          *(_DWORD *)buf = 136446466;
          v18 = "-[NWConcrete_nw_data_transfer_report init]";
          __int16 v19 = 2082;
          v20 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v8,  v11,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_20;
      }

      if (v12)
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_data_transfer_report init]";
        _os_log_impl(&dword_181A5C000, v8, v11, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }

    else
    {
      __nwlog_obj();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v13 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_data_transfer_report init]";
        _os_log_impl(&dword_181A5C000, v8, v13, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }

- (void)dealloc
{
  v3 = (void *)*((void *)self + 51);
  *((void *)self + 51) = 0LL;

  if (*((_DWORD *)self + 11) >= 2u)
  {
    unint64_t v4 = 0LL;
    uint64_t v5 = 352LL;
    do
    {
      uint64_t v6 = *((void *)self + 52);
      v7 = *(void **)(v6 + v5);
      *(void *)(v6 + v5) = 0LL;

      ++v4;
      v5 += 360LL;
    }

    while (v4 < (*((_DWORD *)self + 11) - 1));
  }

  v8 = (void *)*((void *)self + 52);
  if (v8)
  {
    free(v8);
    *((void *)self + 52) = 0LL;
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_data_transfer_report;
  -[NWConcrete_nw_data_transfer_report dealloc](&v9, sel_dealloc);
}

- (void).cxx_destruct
{
}

- (NSString)description
{
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
  uint64_t duration_milliseconds = nw_data_transfer_report_get_duration_milliseconds((nw_data_transfer_report_t)self);
  uint64_t path_count = nw_data_transfer_report_get_path_count((nw_data_transfer_report_t)self);
  theString = Mutable;
  CFStringAppendFormat( Mutable,  0LL,  @"Data Transfer Report:\n\tDuration: %llums\n\tPaths Used: %u",  duration_milliseconds,  path_count);
  if (*((_DWORD *)self + 11) >= 2u)
  {
    uint32_t v8 = 0;
    do
    {
      nw_interface_t v44 = nw_data_transfer_report_copy_path_interface((nw_data_transfer_report_t)self, v8);
      nw_interface_t v41 = nw_data_transfer_report_copy_path_interface((nw_data_transfer_report_t)self, v8);
      if (v41)
      {
        nw_interface_t v31 = nw_data_transfer_report_copy_path_interface((nw_data_transfer_report_t)self, v8);
        radio_os_log_type_t type = nw_interface_get_radio_type(v31);
        v40 = nw_interface_radio_type_to_string(radio_type);
      }

      else
      {
        v40 = "null";
      }

      uint64_t sent_application_byte_count = nw_data_transfer_report_get_sent_application_byte_count( (nw_data_transfer_report_t)self,  v8);
      uint64_t received_application_byte_count = nw_data_transfer_report_get_received_application_byte_count( (nw_data_transfer_report_t)self,  v8);
      uint64_t sent_transport_byte_count = nw_data_transfer_report_get_sent_transport_byte_count( (nw_data_transfer_report_t)self,  v8);
      uint64_t sent_transport_retransmitted_byte_count = nw_data_transfer_report_get_sent_transport_retransmitted_byte_count( (nw_data_transfer_report_t)self,  v8);
      uint64_t received_transport_byte_count = nw_data_transfer_report_get_received_transport_byte_count( (nw_data_transfer_report_t)self,  v8);
      uint64_t received_transport_duplicate_byte_count = nw_data_transfer_report_get_received_transport_duplicate_byte_count( (nw_data_transfer_report_t)self,  v8);
      uint64_t received_transport_out_of_order_byte_count = nw_data_transfer_report_get_received_transport_out_of_order_byte_count( (nw_data_transfer_report_t)self,  v8);
      uint64_t transport_smoothed_rtt_milliseconds = nw_data_transfer_report_get_transport_smoothed_rtt_milliseconds( (nw_data_transfer_report_t)self,  v8);
      uint64_t transport_minimum_rtt_milliseconds = nw_data_transfer_report_get_transport_minimum_rtt_milliseconds( (nw_data_transfer_report_t)self,  v8);
      uint64_t transport_rtt_variance = nw_data_transfer_report_get_transport_rtt_variance((nw_data_transfer_report_t)self, v8);
      uint64_t sent_ip_packet_count = nw_data_transfer_report_get_sent_ip_packet_count((nw_data_transfer_report_t)self, v8);
      uint64_t received_ip_packet_count = nw_data_transfer_report_get_received_ip_packet_count( (nw_data_transfer_report_t)self,  v8);
      CFStringAppendFormat( theString,  0LL,  @"\n\t=================\n\tInterface: %@[%s]\n\tApplication Bytes Sent: %llu\n\tApplication Bytes Received: %llu\n\tTransport Bytes Sent: %llu (Retransmitted %llu)\n\tTransport Bytes Received: %llu (Duplicate %llu, Out-of-Order %llu)\n\tTransport RTT: %llums (Minimum %llums, Variance %llums)\n\tIP Packets Sent: %llu\n\tIP Packets Received: %llu",  v44,  v40,  sent_application_byte_count,  received_application_byte_count,  sent_transport_byte_count,  sent_transport_retransmitted_byte_count,  received_transport_byte_count,  received_transport_duplicate_byte_count,  received_transport_out_of_order_byte_count,  transport_smoothed_rtt_milliseconds,  transport_minimum_rtt_milliseconds,  transport_rtt_variance,  sent_ip_packet_count,  received_ip_packet_count);
      if (v41) {

      }
      ++v8;
    }

    while (v8 < *((_DWORD *)self + 11));
  }

  else
  {
    nw_interface_t v43 = nw_data_transfer_report_copy_path_interface((nw_data_transfer_report_t)self, 0xFFFFFFFF);
    nw_interface_t v6 = nw_data_transfer_report_copy_path_interface((nw_data_transfer_report_t)self, 0xFFFFFFFF);
    if (v6)
    {
      nw_interface_t v29 = nw_data_transfer_report_copy_path_interface((nw_data_transfer_report_t)self, 0xFFFFFFFF);
      int v7 = nw_interface_get_radio_type(v29);
      v39 = nw_interface_radio_type_to_string(v7);
    }

    else
    {
      v39 = "null";
    }

    uint64_t v42 = nw_data_transfer_report_get_sent_application_byte_count((nw_data_transfer_report_t)self, 0xFFFFFFFF);
    uint64_t v38 = nw_data_transfer_report_get_received_application_byte_count((nw_data_transfer_report_t)self, 0xFFFFFFFF);
    uint64_t v36 = nw_data_transfer_report_get_sent_transport_byte_count((nw_data_transfer_report_t)self, 0xFFFFFFFF);
    uint64_t v34 = nw_data_transfer_report_get_sent_transport_retransmitted_byte_count( (nw_data_transfer_report_t)self,  0xFFFFFFFF);
    uint64_t v32 = nw_data_transfer_report_get_received_transport_byte_count((nw_data_transfer_report_t)self, 0xFFFFFFFF);
    uint64_t v19 = nw_data_transfer_report_get_received_transport_duplicate_byte_count( (nw_data_transfer_report_t)self,  0xFFFFFFFF);
    uint64_t v20 = nw_data_transfer_report_get_received_transport_out_of_order_byte_count( (nw_data_transfer_report_t)self,  0xFFFFFFFF);
    uint64_t v21 = nw_data_transfer_report_get_transport_smoothed_rtt_milliseconds((nw_data_transfer_report_t)self, 0xFFFFFFFF);
    uint64_t v22 = nw_data_transfer_report_get_transport_minimum_rtt_milliseconds((nw_data_transfer_report_t)self, 0xFFFFFFFF);
    uint64_t v23 = nw_data_transfer_report_get_transport_rtt_variance((nw_data_transfer_report_t)self, 0xFFFFFFFF);
    uint64_t transport_congestion_window = nw_data_transfer_report_get_transport_congestion_window(self, 0xFFFFFFFF);
    uint64_t transport_slow_start_threshold = nw_data_transfer_report_get_transport_slow_start_threshold(self, 0xFFFFFFFF);
    uint64_t v26 = nw_data_transfer_report_get_sent_ip_packet_count((nw_data_transfer_report_t)self, 0xFFFFFFFF);
    uint64_t v27 = nw_data_transfer_report_get_received_ip_packet_count((nw_data_transfer_report_t)self, 0xFFFFFFFF);
    CFStringAppendFormat( theString,  0LL,  @"\n\tInterface: %@[%s]\n\tApplication Bytes Sent: %llu\n\tApplication Bytes Received: %llu\n\tTransport Bytes Sent: %llu (Retransmitted %llu)\n\tTransport Bytes Received: %llu (Duplicate %llu, Out-of-Order %llu)\n\tTransport RTT: %llums (Minimum %llums, Variance %llums)\n\tTransport Congestion Window: %llu\n\tTransport Slow Start Threshold: %llu\n\tIP Packets Sent: %llu\n\tIP Packets Received: %llu",  v43,  v39,  v42,  v38,  v36,  v34,  v32,  v19,  v20,  v21,  v22,  v23,  transport_congestion_window,  transport_slow_start_threshold,  v26,  v27);
    if (v6) {
  }
    }

  return (NSString *)theString;
}

- (id).cxx_construct
{
  *((_DWORD *)self + 10) = 0;
  *((void *)self + 51) = 0LL;
  return self;
}

@end