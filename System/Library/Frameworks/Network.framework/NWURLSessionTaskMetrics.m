@interface NWURLSessionTaskMetrics
- (BOOL)isKindOfClass:(Class)a3;
- (NSArray)transactionMetrics;
- (NSDateInterval)taskInterval;
- (unint64_t)redirectCount;
@end

@implementation NWURLSessionTaskMetrics

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NWURLSessionTaskMetrics;
  if (-[NWURLSessionTaskMetrics isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
  }
}

- (NSArray)transactionMetrics
{
  id v3 = objc_alloc_init(MEMORY[0x189603FA8]);
  if (self) {
    clientMetadata = self->_clientMetadata;
  }
  else {
    clientMetadata = 0LL;
  }
  uint64_t v8 = MEMORY[0x1895F87A8];
  uint64_t v9 = 3221225472LL;
  v10 = __45__NWURLSessionTaskMetrics_transactionMetrics__block_invoke;
  v11 = &unk_189BBAD18;
  v12 = self;
  id v13 = v3;
  id v5 = v3;
  nw_http_client_metadata_enumerate_transactions(clientMetadata, &v8);
  v6 = (void *)objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);

  return (NSArray *)v6;
}

- (NSDateInterval)taskInterval
{
  if (self)
  {
    uint64_t start_time = nw_http_client_metadata_get_start_time(self->_clientMetadata);
    uint64_t end_time = nw_http_client_metadata_get_end_time(self->_clientMetadata);
    clientMetadata = self->_clientMetadata;
  }

  else
  {
    uint64_t start_time = nw_http_client_metadata_get_start_time(0LL);
    uint64_t end_time = nw_http_client_metadata_get_end_time(0LL);
    clientMetadata = 0LL;
  }

  v6 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603F50]),  "initWithTimeIntervalSinceReferenceDate:",  nw_http_client_metadata_convert_time_to_absolute(clientMetadata, start_time));
  if (!end_time)
  {
    uint64_t v7 = mach_continuous_time();
    if (v7 <= 1) {
      uint64_t end_time = 1LL;
    }
    else {
      uint64_t end_time = v7;
    }
  }

  uint64_t v8 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189607850]),  "initWithStartDate:duration:",  v6,  (double)(unint64_t)nw_delta_nanos(start_time, end_time) * 0.000000001);

  return (NSDateInterval *)v8;
}

- (unint64_t)redirectCount
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v10 = 0LL;
  if (self) {
    clientMetadata = self->_clientMetadata;
  }
  else {
    clientMetadata = 0LL;
  }
  id v3 = clientMetadata;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __40__NWURLSessionTaskMetrics_redirectCount__block_invoke;
  v6[3] = &unk_189BBAD40;
  v6[4] = &v7;
  nw_http_client_metadata_enumerate_transactions(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void).cxx_destruct
{
}

uint64_t __40__NWURLSessionTaskMetrics_redirectCount__block_invoke(uint64_t a1, void *a2)
{
  return 1LL;
}

uint64_t __45__NWURLSessionTaskMetrics_transactionMetrics__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = objc_alloc(&OBJC_CLASS___NWURLSessionTaskTransactionMetrics);
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    v6 = *(void **)(v5 + 16);
  }
  else {
    v6 = 0LL;
  }
  uint64_t v7 = -[NWURLSessionTaskTransactionMetrics initWithTransactionMetadata:clientMetadata:]( (id *)&v4->super.super.isa,  v3,  v6);

  [*(id *)(a1 + 40) addObject:v7];
  return 1LL;
}

uint64_t __53__NWURLSessionTaskMetrics_reportToSymptoms_activity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int start_reason = nw_http_transaction_metadata_get_start_reason(v3);
  if (start_reason == 3)
  {
    uint64_t v6 = a1 + 56;
  }

  else
  {
    if (start_reason != 1) {
      goto LABEL_8;
    }
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    if (v5) {
      *(_BYTE *)(*(void *)(a1 + 64) + 120 * v5 + 77) = 1;
    }
    uint64_t v6 = a1 + 48;
  }

  ++*(void *)(*(void *)(*(void *)v6 + 8LL) + 24LL);
LABEL_8:
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  outbound_message_uint64_t start_time = nw_http_transaction_metadata_get_outbound_message_start_time(v3);
  if (outbound_message_start_time)
  {
    uint64_t v10 = outbound_message_start_time;
    unsigned int v11 = dword_18C45F3A4;
    if (!dword_18C45F3A4)
    {
      mach_timebase_info((mach_timebase_info_t)&time_base);
      unsigned int v11 = dword_18C45F3A4;
    }

    unint64_t v12 = v10 * (unint64_t)time_base / v11 / 0xF4240 - *(void *)(a1 + 72);
  }

  else
  {
    unint64_t v12 = 0LL;
  }

  *(void *)(v7 + 120 * v8 + 104) = v12;
  outbound_message_uint64_t end_time = nw_http_transaction_metadata_get_outbound_message_end_time(v3);
  if (outbound_message_end_time)
  {
    uint64_t v14 = outbound_message_end_time;
    unsigned int v15 = dword_18C45F3A4;
    if (!dword_18C45F3A4)
    {
      mach_timebase_info((mach_timebase_info_t)&time_base);
      unsigned int v15 = dword_18C45F3A4;
    }

    unint64_t v16 = v14 * (unint64_t)time_base / v15 / 0xF4240 - *(void *)(a1 + 72);
  }

  else
  {
    unint64_t v16 = 0LL;
  }

  *(void *)(v7 + 120 * v8 + 112) = v16;
  inbound_message_uint64_t start_time = nw_http_transaction_metadata_get_inbound_message_start_time(v3);
  if (inbound_message_start_time)
  {
    uint64_t v18 = inbound_message_start_time;
    unsigned int v19 = dword_18C45F3A4;
    if (!dword_18C45F3A4)
    {
      mach_timebase_info((mach_timebase_info_t)&time_base);
      unsigned int v19 = dword_18C45F3A4;
    }

    unint64_t v20 = v18 * (unint64_t)time_base / v19 / 0xF4240 - *(void *)(a1 + 72);
  }

  else
  {
    unint64_t v20 = 0LL;
  }

  *(void *)(v7 + 120 * v8 + 120) = v20;
  inbound_message_uint64_t end_time = nw_http_transaction_metadata_get_inbound_message_end_time(v3);
  if (inbound_message_end_time)
  {
    uint64_t v22 = inbound_message_end_time;
    unsigned int v23 = dword_18C45F3A4;
    if (!dword_18C45F3A4)
    {
      mach_timebase_info((mach_timebase_info_t)&time_base);
      unsigned int v23 = dword_18C45F3A4;
    }

    unint64_t v24 = v22 * (unint64_t)time_base / v23 / 0xF4240 - *(void *)(a1 + 72);
  }

  else
  {
    unint64_t v24 = 0LL;
  }

  v25 = (void *)(v7 + 120 * v8);
  v25[16] = v24;
  uint64_t outbound_header_size = nw_http_transaction_metadata_get_outbound_header_size(v3);
  v25[17] = nw_http_transaction_metadata_get_outbound_body_transfer_size(v3) + outbound_header_size;
  uint64_t inbound_header_size = nw_http_transaction_metadata_get_inbound_header_size(v3);
  v25[18] = nw_http_transaction_metadata_get_inbound_body_transfer_size(v3) + inbound_header_size;
  id connection_metadata = nw_http_transaction_metadata_get_connection_metadata(v3);
  v29 = connection_metadata;
  if (connection_metadata)
  {
    uint64_t v30 = v7 + 120 * v8;
    nw_http_connection_metadata_get_uuid(connection_metadata, v30 + 152);
    *(_BYTE *)(v30 + 196) = !nw_http_transaction_metadata_is_first_on_connection(v3);
    unsigned int version = nw_http_connection_metadata_get_version(v29);
    if (version <= 5 && ((0x39u >> version) & 1) != 0) {
      *(_DWORD *)(v7 + 120 * v8 + 192) = dword_18266732C[version];
    }
    id establishment_report = nw_http_connection_metadata_get_establishment_report(v29);
    v33 = establishment_report;
    if (establishment_report)
    {
      v34 = establishment_report;
      char v35 = v34[84];

      *(_BYTE *)(v7 + 120 * v8 + 198) = (v35 & 2) != 0;
    }
  }

  else
  {
    *(_DWORD *)(v7 + 120 * v8 + 192) = 1;
  }

  uint64_t v36 = v7 + 120 * v8;
  *(int64x2_t *)(v36 + 168) = vdupq_n_s64(1uLL);
  *(void *)(v36 + 184) = 2LL;
  id inbound_message = nw_http_transaction_metadata_get_inbound_message(v3);
  v38 = inbound_message;
  if (inbound_message)
  {
    id v39 = nw_http_metadata_copy_response(inbound_message);
    v40 = v39;
    if (!v39)
    {
      uint64_t v43 = 1LL;
      goto LABEL_80;
    }

    id v41 = v39;
    v42 = (void *)_nw_http_fields_copy_value_by_name();

    if (v42)
    {
      uint64_t v43 = 6LL;
LABEL_79:
      free(v42);
      goto LABEL_80;
    }

    id v44 = v41;
    v42 = (void *)_nw_http_fields_copy_value_by_name();

    if (v42)
    {
      uint64_t v43 = 3LL;
      goto LABEL_79;
    }

    id v45 = v44;
    v46 = (char *)_nw_http_fields_copy_value_by_name();

    if (v46 && strcasestr(v46, "CloudFront"))
    {
      v42 = 0LL;
      uint64_t v43 = 5LL;
      goto LABEL_78;
    }

    id v47 = v45;
    v42 = (void *)_nw_http_fields_copy_value_by_name();

    if (v42)
    {
      if (strcasestr((const char *)v42, "gws")
        || strcasestr((const char *)v42, "GSE")
        || strcasestr((const char *)v42, "ESF"))
      {
        uint64_t v43 = 2LL;
        if (!v46) {
          goto LABEL_79;
        }
LABEL_78:
        free(v46);
        if (v42) {
          goto LABEL_79;
        }
LABEL_80:

        *(void *)(v7 + 120 * v8 + 200) = v43;
        [*(id *)(a1 + 32) response];
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0) {
          int v49 = [v48 statusCode];
        }
        else {
          int v49 = 0;
        }
        *(_DWORD *)(v7 + 120 * v8 + 220) = v49;

        goto LABEL_84;
      }

      if (strcasestr((const char *)v42, "cloudflare"))
      {
        uint64_t v43 = 4LL;
        if (!v46) {
          goto LABEL_79;
        }
        goto LABEL_78;
      }

      if (strcasestr((const char *)v42, "ApacheTrafficServer") || strcasestr((const char *)v42, "ATS"))
      {
        uint64_t v43 = 7LL;
        if (!v46) {
          goto LABEL_79;
        }
        goto LABEL_78;
      }

      if (strcasestr((const char *)v42, "apache"))
      {
        uint64_t v43 = 8LL;
        if (!v46) {
          goto LABEL_79;
        }
        goto LABEL_78;
      }

      if (strcasestr((const char *)v42, "nginx"))
      {
        uint64_t v43 = 9LL;
        if (!v46) {
          goto LABEL_79;
        }
        goto LABEL_78;
      }

      if (strcasestr((const char *)v42, "LiteSpeed"))
      {
        uint64_t v43 = 10LL;
        if (!v46) {
          goto LABEL_79;
        }
        goto LABEL_78;
      }

      if (strcasestr((const char *)v42, "lighttpd"))
      {
        uint64_t v43 = 11LL;
        if (!v46) {
          goto LABEL_79;
        }
        goto LABEL_78;
      }

      if (strcasestr((const char *)v42, "nghttpx"))
      {
        uint64_t v43 = 12LL;
        if (!v46) {
          goto LABEL_79;
        }
        goto LABEL_78;
      }
    }

    if (!v46)
    {
      uint64_t v43 = 1LL;
      if (!v42) {
        goto LABEL_80;
      }
      goto LABEL_79;
    }

    if (strcasestr(v46, "varnish")) {
      uint64_t v43 = 13LL;
    }
    else {
      uint64_t v43 = 1LL;
    }
    goto LABEL_78;
  }

uint64_t __53__NWURLSessionTaskMetrics_reportToSymptoms_activity___block_invoke_2()
{
  uint64_t result = symptom_framework_init();
  reportToSymptoms_activity__symptomReporter = result;
  return result;
}

@end