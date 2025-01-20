@interface NWURLSessionTaskTransactionMetrics
- (BOOL)_isUnlistedTracker;
- (BOOL)_usedTFO;
- (BOOL)isCellular;
- (BOOL)isConstrained;
- (BOOL)isExpensive;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)isMultipath;
- (BOOL)isProxyConnection;
- (BOOL)isReusedConnection;
- (NSDate)connectEndDate;
- (NSDate)connectStartDate;
- (NSDate)domainLookupEndDate;
- (NSDate)domainLookupStartDate;
- (NSDate)fetchStartDate;
- (NSDate)requestEndDate;
- (NSDate)requestStartDate;
- (NSDate)responseEndDate;
- (NSDate)responseStartDate;
- (NSDate)secureConnectionEndDate;
- (NSDate)secureConnectionStartDate;
- (NSNumber)localPort;
- (NSNumber)negotiatedTLSCipherSuite;
- (NSNumber)negotiatedTLSProtocolVersion;
- (NSNumber)remotePort;
- (NSString)localAddress;
- (NSString)networkProtocolName;
- (NSString)remoteAddress;
- (NSURLRequest)request;
- (NSURLResponse)response;
- (NSUUID)_connectionIdentifier;
- (id)initWithTransactionMetadata:(void *)a3 clientMetadata:;
- (int)_privacyStance;
- (int64_t)countOfRequestBodyBytesBeforeEncoding;
- (int64_t)countOfRequestBodyBytesSent;
- (int64_t)countOfRequestHeaderBytesSent;
- (int64_t)countOfResponseBodyBytesAfterDecoding;
- (int64_t)countOfResponseBodyBytesReceived;
- (int64_t)countOfResponseHeaderBytesReceived;
- (int64_t)domainResolutionProtocol;
- (int64_t)resourceFetchType;
- (nw_endpoint_t)localEndpoint;
- (nw_endpoint_t)remoteEndpoint;
- (void)computeConnectionTiming;
@end

@implementation NWURLSessionTaskTransactionMetrics

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NWURLSessionTaskTransactionMetrics;
  if (-[NWURLSessionTaskTransactionMetrics isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
  }
}

- (NSURLRequest)request
{
  v2 = self;
  uint64_t v38 = *MEMORY[0x1895F89C0];
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  id outbound_message = nw_http_transaction_metadata_get_outbound_message(self);
  v4 = outbound_message;
  if (outbound_message)
  {
    if (nw_http_metadata_copy_request(outbound_message))
    {
      objc_super v5 = (char *)&loc_18202A0A8 + dword_18202A734[nw_http_metadata_get_version(v4)];
      __asm { BR              X11 }
    }

    goto LABEL_54;
  }

  if (!v2 || (v6 = v2->_clientMetadata) == 0LL)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v14 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    *(void *)&buf[4] = "nw_http_client_metadata_get_initial_request";
    v15 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v32 = 0;
    if (__nwlog_fault(v15, &type, &v32))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v16 = (os_log_s *)(id)gLogObj;
        os_log_type_t v17 = type;
        if (os_log_type_enabled(v16, type))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_client_metadata_get_initial_request";
          _os_log_impl(&dword_181A5C000, v16, v17, "%{public}s called with null metadata", buf, 0xCu);
        }
      }

      else if (v32)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v16 = (os_log_s *)(id)gLogObj;
        os_log_type_t v23 = type;
        BOOL v24 = os_log_type_enabled(v16, type);
        if (backtrace_string)
        {
          if (v24)
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&buf[4] = "nw_http_client_metadata_get_initial_request";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v16,  v23,  "%{public}s called with null metadata, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_45;
        }

        if (v24)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_client_metadata_get_initial_request";
          _os_log_impl(&dword_181A5C000, v16, v23, "%{public}s called with null metadata, no backtrace", buf, 0xCu);
        }
      }

      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v16 = (os_log_s *)(id)gLogObj;
        os_log_type_t v28 = type;
        if (os_log_type_enabled(v16, type))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_client_metadata_get_initial_request";
          _os_log_impl( &dword_181A5C000,  v16,  v28,  "%{public}s called with null metadata, backtrace limit exceeded",  buf,  0xCu);
        }
      }
    }

- (NSURLResponse)response
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  if (self)
  {
    v3 = self->_transactionMetadata;
    if (v3)
    {
      v4 = v3;
      objc_super v5 = nw_protocol_metadata_copy_definition(v3);
      if (nw_protocol_copy_http_transaction_definition_onceToken != -1) {
        dispatch_once(&nw_protocol_copy_http_transaction_definition_onceToken, &__block_literal_global_59_74543);
      }
      BOOL is_equal = nw_protocol_definition_is_equal( v5,  (nw_protocol_definition_t)nw_protocol_copy_http_transaction_definition_definition);

      if (is_equal)
      {
        *(void *)buf = 0LL;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000LL;
        uint64_t v40 = 0LL;
        v36[0] = MEMORY[0x1895F87A8];
        v36[1] = 3221225472LL;
        v36[2] = __nw_http_transaction_metadata_get_converted_url_response_block_invoke;
        v36[3] = &unk_189BC60A8;
        v36[4] = buf;
        uint64_t v7 = *((void *)v4 + 4);
        if (v7)
        {
          __nw_http_transaction_metadata_get_converted_url_response_block_invoke((uint64_t)v36, v7);
          v8 = *(void **)(*(void *)&buf[8] + 24LL);
        }

        else
        {
          v8 = 0LL;
        }

        _Block_object_dispose(buf, 8);

        if (v8) {
          return (NSURLResponse *)v8;
        }
        goto LABEL_10;
      }

      __nwlog_obj();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446210;
      *(void *)&buf[4] = "nw_http_transaction_metadata_get_converted_url_response";
      os_log_type_t v21 = (char *)_os_log_send_and_compose_impl();

      os_log_type_t type = OS_LOG_TYPE_ERROR;
      char v37 = 0;
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v23 = type;
        if (os_log_type_enabled(v22, type))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_transaction_metadata_get_converted_url_response";
          _os_log_impl(&dword_181A5C000, v22, v23, "%{public}s metadata must be http_transaction", buf, 0xCu);
        }
      }

      else if (v37)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v25 = type;
        BOOL v26 = os_log_type_enabled(v22, type);
        if (backtrace_string)
        {
          if (v26)
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&buf[4] = "nw_http_transaction_metadata_get_converted_url_response";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v22,  v25,  "%{public}s metadata must be http_transaction, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_42;
        }

        if (v26)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_transaction_metadata_get_converted_url_response";
          _os_log_impl( &dword_181A5C000,  v22,  v25,  "%{public}s metadata must be http_transaction, no backtrace",  buf,  0xCu);
        }
      }

      else
      {
        __nwlog_obj();
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v27 = type;
        if (os_log_type_enabled(v22, type))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_transaction_metadata_get_converted_url_response";
          _os_log_impl( &dword_181A5C000,  v22,  v27,  "%{public}s metadata must be http_transaction, backtrace limit exceeded",  buf,  0xCu);
        }
      }

LABEL_42:
      if (v21) {
        free(v21);
      }

LABEL_10:
      id outbound_message = nw_http_transaction_metadata_get_outbound_message(self->_transactionMetadata);
      transactionMetadata = self->_transactionMetadata;
      goto LABEL_11;
    }
  }

  __nwlog_obj();
  os_log_type_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  *(void *)&buf[4] = "nw_http_transaction_metadata_get_converted_url_response";
  os_log_type_t v29 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v37 = 0;
  if (__nwlog_fault(v29, &type, &v37))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v31 = type;
      if (os_log_type_enabled(v30, type))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "nw_http_transaction_metadata_get_converted_url_response";
        _os_log_impl(&dword_181A5C000, v30, v31, "%{public}s called with null metadata", buf, 0xCu);
      }

- (NSDate)fetchStartDate
{
  v2 = self;
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  start_time = (void *)nw_http_transaction_metadata_get_start_time(self);
  if (start_time)
  {
    uint64_t v4 = (uint64_t)start_time;
    if (v2) {
      clientMetadata = v2->_clientMetadata;
    }
    else {
      clientMetadata = 0LL;
    }
    start_time = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603F50]),  "initWithTimeIntervalSinceReferenceDate:",  nw_http_client_metadata_convert_time_to_absolute(clientMetadata, v4));
  }

  return (NSDate *)start_time;
}

- (NSDate)domainLookupStartDate
{
  v2 = self;
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  if (nw_http_transaction_metadata_is_first_on_connection(self)
    && (-[NWURLSessionTaskTransactionMetrics computeConnectionTiming]((uint64_t)v2), v2->connectionTiming.valid))
  {
    start_time = (void *)nw_http_transaction_metadata_get_start_time(v2->_transactionMetadata);
    if (start_time) {
      start_time = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603F50]),  "initWithTimeIntervalSinceReferenceDate:",  nw_http_client_metadata_convert_time_to_absolute(v2->_clientMetadata, (uint64_t)start_time)
    }
                           + (double)v2->connectionTiming.domainLookupStartMS * 0.001);
  }

  else
  {
    start_time = 0LL;
  }

  return (NSDate *)start_time;
}

- (NSDate)domainLookupEndDate
{
  v2 = self;
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  if (nw_http_transaction_metadata_is_first_on_connection(self)
    && (-[NWURLSessionTaskTransactionMetrics computeConnectionTiming]((uint64_t)v2), v2->connectionTiming.valid))
  {
    start_time = (void *)nw_http_transaction_metadata_get_start_time(v2->_transactionMetadata);
    if (start_time) {
      start_time = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603F50]),  "initWithTimeIntervalSinceReferenceDate:",  nw_http_client_metadata_convert_time_to_absolute(v2->_clientMetadata, (uint64_t)start_time)
    }
                           + (double)(v2->connectionTiming.domainLookupDurationMS
                                    + v2->connectionTiming.domainLookupStartMS)
                           * 0.001);
  }

  else
  {
    start_time = 0LL;
  }

  return (NSDate *)start_time;
}

- (NSDate)connectStartDate
{
  v2 = self;
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  if (nw_http_transaction_metadata_is_first_on_connection(self)
    && (-[NWURLSessionTaskTransactionMetrics computeConnectionTiming]((uint64_t)v2), v2->connectionTiming.valid))
  {
    start_time = (void *)nw_http_transaction_metadata_get_start_time(v2->_transactionMetadata);
    if (start_time) {
      start_time = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603F50]),  "initWithTimeIntervalSinceReferenceDate:",  nw_http_client_metadata_convert_time_to_absolute(v2->_clientMetadata, (uint64_t)start_time)
    }
                           + (double)v2->connectionTiming.connectStartTimeMS * 0.001);
  }

  else
  {
    start_time = 0LL;
  }

  return (NSDate *)start_time;
}

- (NSDate)secureConnectionStartDate
{
  v2 = self;
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  if (nw_http_transaction_metadata_is_first_on_connection(self)
    && (-[NWURLSessionTaskTransactionMetrics computeConnectionTiming]((uint64_t)v2), v2->connectionTiming.valid)
    && v2->connectionTiming.secure)
  {
    start_time = (void *)nw_http_transaction_metadata_get_start_time(v2->_transactionMetadata);
    if (start_time) {
      start_time = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603F50]),  "initWithTimeIntervalSinceReferenceDate:",  nw_http_client_metadata_convert_time_to_absolute(v2->_clientMetadata, (uint64_t)start_time)
    }
                           + (double)(v2->connectionTiming.connectDurationMS
                                    + v2->connectionTiming.connectStartTimeMS
                                    - v2->connectionTiming.secureConnectionDurationMS)
                           * 0.001);
  }

  else
  {
    start_time = 0LL;
  }

  return (NSDate *)start_time;
}

- (NSDate)secureConnectionEndDate
{
  v2 = self;
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  if (nw_http_transaction_metadata_is_first_on_connection(self)
    && (-[NWURLSessionTaskTransactionMetrics computeConnectionTiming]((uint64_t)v2), v2->connectionTiming.valid)
    && v2->connectionTiming.secure)
  {
    start_time = (void *)nw_http_transaction_metadata_get_start_time(v2->_transactionMetadata);
    if (start_time) {
      start_time = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603F50]),  "initWithTimeIntervalSinceReferenceDate:",  nw_http_client_metadata_convert_time_to_absolute(v2->_clientMetadata, (uint64_t)start_time)
    }
  }

  else
  {
    start_time = 0LL;
  }

  return (NSDate *)start_time;
}

- (NSDate)connectEndDate
{
  v2 = self;
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  if (nw_http_transaction_metadata_is_first_on_connection(self)
    && (-[NWURLSessionTaskTransactionMetrics computeConnectionTiming]((uint64_t)v2), v2->connectionTiming.valid))
  {
    start_time = (void *)nw_http_transaction_metadata_get_start_time(v2->_transactionMetadata);
    if (start_time) {
      start_time = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603F50]),  "initWithTimeIntervalSinceReferenceDate:",  nw_http_client_metadata_convert_time_to_absolute(v2->_clientMetadata, (uint64_t)start_time)
    }
  }

  else
  {
    start_time = 0LL;
  }

  return (NSDate *)start_time;
}

- (NSDate)requestStartDate
{
  v2 = self;
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  outbound_message_start_time = (void *)nw_http_transaction_metadata_get_outbound_message_start_time(self);
  if (outbound_message_start_time)
  {
    uint64_t v4 = (uint64_t)outbound_message_start_time;
    if (v2) {
      clientMetadata = v2->_clientMetadata;
    }
    else {
      clientMetadata = 0LL;
    }
    outbound_message_start_time = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603F50]),  "initWithTimeIntervalSinceReferenceDate:",  nw_http_client_metadata_convert_time_to_absolute(clientMetadata, v4));
  }

  return (NSDate *)outbound_message_start_time;
}

- (NSDate)requestEndDate
{
  v2 = self;
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  outbound_message_end_time = (void *)nw_http_transaction_metadata_get_outbound_message_end_time(self);
  if (outbound_message_end_time)
  {
    uint64_t v4 = (uint64_t)outbound_message_end_time;
    if (v2) {
      clientMetadata = v2->_clientMetadata;
    }
    else {
      clientMetadata = 0LL;
    }
    outbound_message_end_time = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603F50]),  "initWithTimeIntervalSinceReferenceDate:",  nw_http_client_metadata_convert_time_to_absolute(clientMetadata, v4));
  }

  return (NSDate *)outbound_message_end_time;
}

- (NSDate)responseStartDate
{
  v2 = self;
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  inbound_message_start_time = (void *)nw_http_transaction_metadata_get_inbound_message_start_time(self);
  if (inbound_message_start_time)
  {
    uint64_t v4 = (uint64_t)inbound_message_start_time;
    if (v2) {
      clientMetadata = v2->_clientMetadata;
    }
    else {
      clientMetadata = 0LL;
    }
    inbound_message_start_time = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603F50]),  "initWithTimeIntervalSinceReferenceDate:",  nw_http_client_metadata_convert_time_to_absolute(clientMetadata, v4));
  }

  return (NSDate *)inbound_message_start_time;
}

- (NSDate)responseEndDate
{
  v2 = self;
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  inbound_message_end_time = (void *)nw_http_transaction_metadata_get_inbound_message_end_time(self);
  if (inbound_message_end_time)
  {
    uint64_t v4 = (uint64_t)inbound_message_end_time;
    if (v2) {
      clientMetadata = v2->_clientMetadata;
    }
    else {
      clientMetadata = 0LL;
    }
    inbound_message_end_time = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603F50]),  "initWithTimeIntervalSinceReferenceDate:",  nw_http_client_metadata_convert_time_to_absolute(clientMetadata, v4));
  }

  return (NSDate *)inbound_message_end_time;
}

- (NSString)networkProtocolName
{
  v2 = self;
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  id connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  uint64_t v4 = connection_metadata;
  if (connection_metadata
    && (sec_metadata = (sec_protocol_metadata *)nw_http_connection_metadata_get_sec_metadata(connection_metadata)) != 0LL
    || (!v2 ? (clientMetadata = 0LL) : (clientMetadata = v2->_clientMetadata),
        (sec_metadata = (sec_protocol_metadata *)nw_http_client_metadata_get_sec_metadata(clientMetadata)) != 0LL))
  {
    negotiated_protocol = sec_protocol_metadata_get_negotiated_protocol(sec_metadata);
    if (negotiated_protocol)
    {
      [NSString stringWithUTF8String:negotiated_protocol];
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {

      v8 = @"http/1.1";
    }
  }

  else
  {
    v9 = @"http/1.1";
    if (!v4) {
      v9 = 0LL;
    }
    v8 = v9;
  }

  return (NSString *)v8;
}

- (BOOL)isProxyConnection
{
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  id connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  v3 = connection_metadata;
  if (connection_metadata
    && (id establishment_report = nw_http_connection_metadata_get_establishment_report(connection_metadata)) != 0LL)
  {
    objc_super v5 = (unsigned __int8 *)establishment_report;
    BOOL v6 = (v5[84] >> 1) & 1;
  }

  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)isReusedConnection
{
  v2 = self;
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  id connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  if (connection_metadata)
  {
    if (v2) {
      transactionMetadata = v2->_transactionMetadata;
    }
    else {
      transactionMetadata = 0LL;
    }
    BOOL v5 = !nw_http_transaction_metadata_is_first_on_connection(transactionMetadata);
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (int64_t)resourceFetchType
{
  return 1LL;
}

- (int64_t)countOfRequestHeaderBytesSent
{
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  return nw_http_transaction_metadata_get_outbound_header_size(self);
}

- (int64_t)countOfRequestBodyBytesSent
{
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  return nw_http_transaction_metadata_get_outbound_body_transfer_size(self);
}

- (int64_t)countOfRequestBodyBytesBeforeEncoding
{
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  return nw_http_transaction_metadata_get_outbound_body_size(self);
}

- (int64_t)countOfResponseHeaderBytesReceived
{
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  return nw_http_transaction_metadata_get_inbound_header_size(self);
}

- (int64_t)countOfResponseBodyBytesReceived
{
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  return nw_http_transaction_metadata_get_inbound_body_transfer_size(self);
}

- (int64_t)countOfResponseBodyBytesAfterDecoding
{
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  return nw_http_transaction_metadata_get_inbound_body_size(self);
}

- (NSString)localAddress
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (v4 = v2, int v5 = [v4 type], v4, v5 == 1))
  {
    BOOL v6 = (void *)NSString;
    id v7 = v4;
    uint64_t v8 = [v7 hostname];

    [v6 stringWithUTF8String:v8];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v9 = 0LL;
  }

  return (NSString *)v9;
}

- (NSNumber)localPort
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (v4 = v2, int v5 = [v4 type], v4, v5 == 1))
  {
    BOOL v6 = (void *)MEMORY[0x189607968];
    id v7 = v4;
    uint64_t v8 = __rev16([v7 port]);

    [v6 numberWithUnsignedShort:v8];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v9 = 0LL;
  }

  return (NSNumber *)v9;
}

- (NSString)remoteAddress
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (v4 = v2, int v5 = [v4 type], v4, v5 == 1))
  {
    BOOL v6 = (void *)NSString;
    id v7 = v4;
    uint64_t v8 = [v7 hostname];

    [v6 stringWithUTF8String:v8];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v9 = 0LL;
  }

  return (NSString *)v9;
}

- (NSNumber)remotePort
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (v4 = v2, int v5 = [v4 type], v4, v5 == 1))
  {
    BOOL v6 = (void *)MEMORY[0x189607968];
    id v7 = v4;
    uint64_t v8 = __rev16([v7 port]);

    [v6 numberWithUnsignedShort:v8];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v9 = 0LL;
  }

  return (NSNumber *)v9;
}

- (NSNumber)negotiatedTLSProtocolVersion
{
  v2 = self;
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  id connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  id v4 = connection_metadata;
  if (connection_metadata
    && (sec_metadata = (sec_protocol_metadata *)nw_http_connection_metadata_get_sec_metadata(connection_metadata)) != 0LL
    || (!v2 ? (clientMetadata = 0LL) : (clientMetadata = v2->_clientMetadata),
        (sec_metadata = (sec_protocol_metadata *)nw_http_client_metadata_get_sec_metadata(clientMetadata)) != 0LL))
  {
    [MEMORY[0x189607968] numberWithUnsignedShort:sec_protocol_metadata_get_negotiated_tls_protocol_version(sec_metadata)];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v7 = 0LL;
  }

  return (NSNumber *)v7;
}

- (NSNumber)negotiatedTLSCipherSuite
{
  v2 = self;
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  id connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  id v4 = connection_metadata;
  if (connection_metadata
    && (sec_metadata = (sec_protocol_metadata *)nw_http_connection_metadata_get_sec_metadata(connection_metadata)) != 0LL
    || (!v2 ? (clientMetadata = 0LL) : (clientMetadata = v2->_clientMetadata),
        (sec_metadata = (sec_protocol_metadata *)nw_http_client_metadata_get_sec_metadata(clientMetadata)) != 0LL))
  {
    [MEMORY[0x189607968] numberWithUnsignedShort:sec_protocol_metadata_get_negotiated_tls_ciphersuite(sec_metadata)];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v7 = 0LL;
  }

  return (NSNumber *)v7;
}

- (BOOL)isCellular
{
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  id connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  v3 = connection_metadata;
  if (connection_metadata && (path = (nw_path *)nw_http_connection_metadata_get_path(connection_metadata)) != 0LL)
  {
    int v5 = path;
    BOOL v6 = nw_path_uses_interface_type(path, nw_interface_type_cellular);
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isExpensive
{
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  id connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  v3 = connection_metadata;
  if (connection_metadata && (path = (nw_path *)nw_http_connection_metadata_get_path(connection_metadata)) != 0LL)
  {
    int v5 = path;
    BOOL is_expensive = nw_path_is_expensive(path);
  }

  else
  {
    BOOL is_expensive = 0;
  }

  return is_expensive;
}

- (BOOL)isConstrained
{
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  id connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  v3 = connection_metadata;
  if (connection_metadata && (path = (nw_path *)nw_http_connection_metadata_get_path(connection_metadata)) != 0LL)
  {
    int v5 = path;
    BOOL is_constrained = nw_path_is_constrained(path);
  }

  else
  {
    BOOL is_constrained = 0;
  }

  return is_constrained;
}

- (BOOL)isMultipath
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  id connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  v3 = connection_metadata;
  if (connection_metadata)
  {
    id v4 = (nw_protocol_metadata *)connection_metadata;
    int v5 = nw_protocol_metadata_copy_definition(v4);
    if (nw_protocol_copy_http_connection_definition_onceToken != -1) {
      dispatch_once(&nw_protocol_copy_http_connection_definition_onceToken, &__block_literal_global_62);
    }
    BOOL is_equal = nw_protocol_definition_is_equal( v5,  (nw_protocol_definition_t)nw_protocol_copy_http_connection_definition_definition);

    if (is_equal)
    {
      *(void *)os_log_type_t type = 0LL;
      v19 = type;
      uint64_t v20 = 0x2020000000LL;
      char v21 = 0;
      *(void *)buf = MEMORY[0x1895F87A8];
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&buf[16] = __nw_http_connection_metadata_is_multipath_block_invoke;
      BOOL v24 = &unk_189BC60A8;
      os_log_type_t v25 = type;
      uint64_t v7 = *((void *)v4 + 4);
      if (v7)
      {
        __nw_http_connection_metadata_is_multipath_block_invoke((uint64_t)buf, v7);
        BOOL v8 = *((_BYTE *)v19 + 24) != 0;
      }

      else
      {
        BOOL v8 = 0;
      }

      _Block_object_dispose(type, 8);
LABEL_12:

      goto LABEL_13;
    }

    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v10 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    *(void *)&buf[4] = "nw_http_connection_metadata_is_multipath";
    v11 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    char v22 = 0;
    if (__nwlog_fault(v11, type, &v22))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v12 = (os_log_s *)(id)gLogObj;
        os_log_type_t v13 = type[0];
        if (os_log_type_enabled(v12, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_connection_metadata_is_multipath";
          _os_log_impl(&dword_181A5C000, v12, v13, "%{public}s metadata must be http_connection", buf, 0xCu);
        }
      }

      else if (v22)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v12 = (os_log_s *)(id)gLogObj;
        os_log_type_t v15 = type[0];
        BOOL v16 = os_log_type_enabled(v12, type[0]);
        if (backtrace_string)
        {
          if (v16)
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&buf[4] = "nw_http_connection_metadata_is_multipath";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v12,  v15,  "%{public}s metadata must be http_connection, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_30;
        }

        if (v16)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_connection_metadata_is_multipath";
          _os_log_impl( &dword_181A5C000,  v12,  v15,  "%{public}s metadata must be http_connection, no backtrace",  buf,  0xCu);
        }
      }

      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v12 = (os_log_s *)(id)gLogObj;
        os_log_type_t v17 = type[0];
        if (os_log_type_enabled(v12, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_connection_metadata_is_multipath";
          _os_log_impl( &dword_181A5C000,  v12,  v17,  "%{public}s metadata must be http_connection, backtrace limit exceeded",  buf,  0xCu);
        }
      }
    }

- (int64_t)domainResolutionProtocol
{
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  id connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  v3 = connection_metadata;
  if (connection_metadata
    && (id establishment_report = (nw_establishment_report *)nw_http_connection_metadata_get_establishment_report(connection_metadata)) != 0LL)
  {
    int v5 = establishment_report;
    uint64_t v9 = 0LL;
    id v10 = &v9;
    int v12 = 0;
    uint64_t v11 = 0x2020000000LL;
    enumerate_block[0] = MEMORY[0x1895F87A8];
    enumerate_block[1] = 3221225472LL;
    enumerate_block[2] = __62__NWURLSessionTaskTransactionMetrics_domainResolutionProtocol__block_invoke;
    enumerate_block[3] = &unk_189BBACF0;
    enumerate_block[4] = &v9;
    nw_establishment_report_enumerate_resolution_reports(establishment_report, enumerate_block);
    int64_t v6 = *((unsigned int *)v10 + 6);
    _Block_object_dispose(&v9, 8);
  }

  else
  {
    int64_t v6 = 0LL;
  }

  return v6;
}

- (NSUUID)_connectionIdentifier
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  id connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  v3 = connection_metadata;
  if (connection_metadata)
  {
    nw_http_connection_metadata_get_uuid(connection_metadata, (uint64_t)v6);
    id v4 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:v6];
  }

  else
  {
    id v4 = 0LL;
  }

  return (NSUUID *)v4;
}

- (int)_privacyStance
{
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  id connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  v3 = connection_metadata;
  if (connection_metadata) {
    int privacy_stance = nw_http_connection_metadata_get_privacy_stance(connection_metadata);
  }
  else {
    int privacy_stance = 0;
  }

  return privacy_stance;
}

- (BOOL)_isUnlistedTracker
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  id connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  v3 = connection_metadata;
  if (connection_metadata)
  {
    id v4 = (nw_protocol_metadata *)connection_metadata;
    int v5 = nw_protocol_metadata_copy_definition(v4);
    if (nw_protocol_copy_http_connection_definition_onceToken != -1) {
      dispatch_once(&nw_protocol_copy_http_connection_definition_onceToken, &__block_literal_global_62);
    }
    BOOL is_equal = nw_protocol_definition_is_equal( v5,  (nw_protocol_definition_t)nw_protocol_copy_http_connection_definition_definition);

    if (is_equal)
    {
      *(void *)os_log_type_t type = 0LL;
      v19 = type;
      uint64_t v20 = 0x2020000000LL;
      char v21 = 0;
      *(void *)buf = MEMORY[0x1895F87A8];
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&buf[16] = __nw_http_connection_metadata_is_unlisted_tracker_block_invoke;
      BOOL v24 = &unk_189BC60A8;
      os_log_type_t v25 = type;
      uint64_t v7 = *((void *)v4 + 4);
      if (v7)
      {
        __nw_http_connection_metadata_is_unlisted_tracker_block_invoke((uint64_t)buf, v7);
        BOOL v8 = *((_BYTE *)v19 + 24) != 0;
      }

      else
      {
        BOOL v8 = 0;
      }

      _Block_object_dispose(type, 8);
LABEL_12:

      goto LABEL_13;
    }

    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v10 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    *(void *)&buf[4] = "nw_http_connection_metadata_is_unlisted_tracker";
    uint64_t v11 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    char v22 = 0;
    if (__nwlog_fault(v11, type, &v22))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        int v12 = (os_log_s *)(id)gLogObj;
        os_log_type_t v13 = type[0];
        if (os_log_type_enabled(v12, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_connection_metadata_is_unlisted_tracker";
          _os_log_impl(&dword_181A5C000, v12, v13, "%{public}s metadata must be http_connection", buf, 0xCu);
        }
      }

      else if (v22)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        int v12 = (os_log_s *)(id)gLogObj;
        os_log_type_t v15 = type[0];
        BOOL v16 = os_log_type_enabled(v12, type[0]);
        if (backtrace_string)
        {
          if (v16)
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&buf[4] = "nw_http_connection_metadata_is_unlisted_tracker";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v12,  v15,  "%{public}s metadata must be http_connection, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_30;
        }

        if (v16)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_connection_metadata_is_unlisted_tracker";
          _os_log_impl( &dword_181A5C000,  v12,  v15,  "%{public}s metadata must be http_connection, no backtrace",  buf,  0xCu);
        }
      }

      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        int v12 = (os_log_s *)(id)gLogObj;
        os_log_type_t v17 = type[0];
        if (os_log_type_enabled(v12, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_connection_metadata_is_unlisted_tracker";
          _os_log_impl( &dword_181A5C000,  v12,  v17,  "%{public}s metadata must be http_connection, backtrace limit exceeded",  buf,  0xCu);
        }
      }
    }

- (BOOL)_usedTFO
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  if (self) {
    self = (NWURLSessionTaskTransactionMetrics *)self->_transactionMetadata;
  }
  id connection_metadata = nw_http_transaction_metadata_get_connection_metadata(self);
  v3 = connection_metadata;
  if (connection_metadata)
  {
    id v4 = (nw_protocol_metadata *)connection_metadata;
    int v5 = nw_protocol_metadata_copy_definition(v4);
    if (nw_protocol_copy_http_connection_definition_onceToken != -1) {
      dispatch_once(&nw_protocol_copy_http_connection_definition_onceToken, &__block_literal_global_62);
    }
    BOOL is_equal = nw_protocol_definition_is_equal( v5,  (nw_protocol_definition_t)nw_protocol_copy_http_connection_definition_definition);

    if (is_equal)
    {
      *(void *)os_log_type_t type = 0LL;
      v19 = type;
      uint64_t v20 = 0x2020000000LL;
      char v21 = 0;
      *(void *)buf = MEMORY[0x1895F87A8];
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&buf[16] = __nw_http_connection_metadata_used_tfo_block_invoke;
      BOOL v24 = &unk_189BC60A8;
      os_log_type_t v25 = type;
      uint64_t v7 = *((void *)v4 + 4);
      if (v7)
      {
        __nw_http_connection_metadata_used_tfo_block_invoke((uint64_t)buf, v7);
        BOOL v8 = *((_BYTE *)v19 + 24) != 0;
      }

      else
      {
        BOOL v8 = 0;
      }

      _Block_object_dispose(type, 8);
LABEL_12:

      goto LABEL_13;
    }

    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v10 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    *(void *)&buf[4] = "nw_http_connection_metadata_used_tfo";
    uint64_t v11 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    char v22 = 0;
    if (__nwlog_fault(v11, type, &v22))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        int v12 = (os_log_s *)(id)gLogObj;
        os_log_type_t v13 = type[0];
        if (os_log_type_enabled(v12, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_connection_metadata_used_tfo";
          _os_log_impl(&dword_181A5C000, v12, v13, "%{public}s metadata must be http_connection", buf, 0xCu);
        }
      }

      else if (v22)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        int v12 = (os_log_s *)(id)gLogObj;
        os_log_type_t v15 = type[0];
        BOOL v16 = os_log_type_enabled(v12, type[0]);
        if (backtrace_string)
        {
          if (v16)
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&buf[4] = "nw_http_connection_metadata_used_tfo";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v12,  v15,  "%{public}s metadata must be http_connection, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_30;
        }

        if (v16)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_connection_metadata_used_tfo";
          _os_log_impl( &dword_181A5C000,  v12,  v15,  "%{public}s metadata must be http_connection, no backtrace",  buf,  0xCu);
        }
      }

      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        int v12 = (os_log_s *)(id)gLogObj;
        os_log_type_t v17 = type[0];
        if (os_log_type_enabled(v12, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_http_connection_metadata_used_tfo";
          _os_log_impl( &dword_181A5C000,  v12,  v17,  "%{public}s metadata must be http_connection, backtrace limit exceeded",  buf,  0xCu);
        }
      }
    }

- (void).cxx_destruct
{
}

uint64_t __62__NWURLSessionTaskTransactionMetrics_domainResolutionProtocol__block_invoke( uint64_t a1,  nw_resolution_report_t resolution_report)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = nw_resolution_report_get_protocol(resolution_report);
  return 0LL;
}

- (nw_endpoint_t)remoteEndpoint
{
  if (!a1) {
    return (nw_endpoint_t)0LL;
  }
  id connection_metadata = nw_http_transaction_metadata_get_connection_metadata(*(void **)(a1 + 104));
  v2 = connection_metadata;
  if (!connection_metadata) {
    goto LABEL_9;
  }
  if (nw_http_connection_metadata_get_privacy_stance(connection_metadata) != 2)
  {
    path = (nw_path *)nw_http_connection_metadata_get_path(v2);
    if (path)
    {
      id v4 = path;
      nw_endpoint_t v5 = nw_path_copy_effective_remote_endpoint(path);
      goto LABEL_8;
    }

uint64_t __52__NWURLSessionTaskTransactionMetrics_remoteEndpoint__block_invoke(uint64_t a1, void *a2)
{
  return 1LL;
}

- (nw_endpoint_t)localEndpoint
{
  if (a1)
  {
    id connection_metadata = nw_http_transaction_metadata_get_connection_metadata(*(void **)(a1 + 104));
    v2 = connection_metadata;
    if (connection_metadata && (path = (nw_path *)nw_http_connection_metadata_get_path(connection_metadata)) != 0LL)
    {
      id v4 = path;
      nw_endpoint_t v5 = nw_path_copy_effective_local_endpoint(path);
    }

    else
    {
      nw_endpoint_t v5 = 0LL;
    }
  }

  else
  {
    nw_endpoint_t v5 = 0LL;
  }

  return v5;
}

- (void)computeConnectionTiming
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  if (a1 && !*(_BYTE *)(a1 + 97))
  {
    id connection_metadata = nw_http_transaction_metadata_get_connection_metadata(*(void **)(a1 + 104));
    v3 = connection_metadata;
    if (!connection_metadata)
    {
LABEL_20:

      return;
    }

    id establishment_report = (nw_establishment_report *)nw_http_connection_metadata_get_establishment_report(connection_metadata);
    nw_endpoint_t v5 = establishment_report;
    if (!establishment_report)
    {
LABEL_19:

      goto LABEL_20;
    }

    uint64_t attempt_started_after_milliseconds = nw_establishment_report_get_attempt_started_after_milliseconds(establishment_report);
    uint64_t resolution_started_after_milliseconds = nw_establishment_report_get_resolution_started_after_milliseconds(v5);
    uint64_t flow_started_after_milliseconds = nw_establishment_report_get_flow_started_after_milliseconds(v5);
    *(void *)(a1 + 56) = resolution_started_after_milliseconds + attempt_started_after_milliseconds;
    uint64_t v9 = flow_started_after_milliseconds + attempt_started_after_milliseconds;
    uint64_t v10 = MEMORY[0x1895F87A8];
    *(void *)(a1 + 72) = v9;
    enumerate_block[0] = v10;
    enumerate_block[1] = 3221225472LL;
    enumerate_block[2] = __61__NWURLSessionTaskTransactionMetrics_computeConnectionTiming__block_invoke;
    enumerate_block[3] = &unk_189BBAC78;
    enumerate_block[4] = a1;
    nw_establishment_report_enumerate_resolution_reports(v5, enumerate_block);
    uint64_t v24 = 0LL;
    os_log_type_t v25 = &v24;
    uint64_t v26 = 0x3032000000LL;
    os_log_type_t v27 = __Block_byref_object_copy__28306;
    os_log_type_t v28 = __Block_byref_object_dispose__28307;
    id v29 = 0LL;
    uint64_t v21 = 0LL;
    char v22 = &v21;
    uint64_t v23 = 0x2020000000LL;
    v20[0] = v10;
    v20[1] = 3221225472LL;
    v20[2] = __61__NWURLSessionTaskTransactionMetrics_computeConnectionTiming__block_invoke_3;
    v20[3] = &unk_189BBACA0;
    v20[4] = &v24;
    v20[5] = &v21;
    nw_establishment_report_enumerate_protocols(v5, v20);
    uint64_t v11 = (nw_protocol_definition *)v25[5];
    if (v11)
    {
      int v12 = (void *)nw_protocol_boringssl_copy_definition();
      if (nw_protocol_definition_is_equal(v11, (nw_protocol_definition_t)v12))
      {
      }

      else
      {
        os_log_type_t v13 = (nw_protocol_definition *)v25[5];
        if (nw_protocol_copy_quic_connection_definition::onceToken != -1) {
          dispatch_once(&nw_protocol_copy_quic_connection_definition::onceToken, &__block_literal_global_55123);
        }
        id v14 = (nw_protocol_definition *)(id)nw_protocol_copy_quic_connection_definition::quic_definition;
        BOOL is_equal = nw_protocol_definition_is_equal(v13, v14);

        if (!is_equal) {
          goto LABEL_12;
        }
      }

      *(void *)(a1 + 88) = v22[3];
      *(_BYTE *)(a1 + 96) = 1;
    }

uint64_t __61__NWURLSessionTaskTransactionMetrics_computeConnectionTiming__block_invoke( uint64_t a1,  nw_resolution_report_t resolution_report)
{
  *(void *)(*(void *)(a1 + 32) + 64LL) += nw_resolution_report_get_milliseconds(resolution_report);
  return 1LL;
}

uint64_t __61__NWURLSessionTaskTransactionMetrics_computeConnectionTiming__block_invoke_3( uint64_t a1,  void *a2,  uint64_t a3)
{
  id v6 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a3;

  return 1LL;
}

- (id)initWithTransactionMetadata:(void *)a3 clientMetadata:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_CLASS___NWURLSessionTaskTransactionMetrics;
    BOOL v8 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 13, a2);
      objc_storeStrong(a1 + 14, a3);
    }
  }

  return a1;
}

@end