@interface NSURLSessionTaskTransactionMetrics
- (BOOL)_apsRelayAttempted;
- (BOOL)_apsRelaySucceeded;
- (BOOL)isReusedConnection;
- (NSDate)connectEndDate;
- (NSDate)connectStartDate;
- (NSDate)domainLookupEndDate;
- (NSDate)domainLookupStartDate;
- (NSDate)fetchStartDate;
- (NSDate)requestStartDate;
- (NSDate)responseEndDate;
- (NSDate)responseStartDate;
- (NSDate)secureConnectionStartDate;
- (NSString)networkProtocolName;
- (NSURLResponse)response;
- (NSURLSessionTaskMetricsResourceFetchType)resourceFetchType;
- (OS_nw_data_transfer_report)_dataTransferReport;
- (_BYTE)initWithMetrics:(char)a3 forCache:;
- (int64_t)countOfResponseBodyBytesAfterDecoding;
- (void)translateConnectionTiming;
@end

@implementation NSURLSessionTaskTransactionMetrics

- (_BYTE)initWithMetrics:(char)a3 forCache:
{
  id v6 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_CLASS___NSURLSessionTaskTransactionMetrics;
    id v7 = objc_msgSendSuper2(&v9, sel_init);
    a1 = v7;
    if (v7)
    {
      objc_storeStrong((id *)v7 + 2, a2);
      a1[9] = a3;
    }
  }

  return a1;
}

- (void).cxx_destruct
{
}

- (NSDate)connectStartDate
{
  if (self->__forCache)
  {
    v2 = 0LL;
  }

  else
  {
    -[NSURLSessionTaskTransactionMetrics translateConnectionTiming]((uint64_t)self, a2);
    [MEMORY[0x189603F50] dateWithTimeIntervalSinceReferenceDate:self->connectBeginTime];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSDate *)v2;
}

- (void)translateConnectionTiming
{
  if (a1 && !*(_BYTE *)(a1 + 8))
  {
    v3 = *(_BYTE **)(a1 + 16);
    if (v3 && v3[9] && !v3[10])
    {
      id v4 = objc_getProperty(v3, a2, 88LL, 1);
      connectionTimingFromMetrics((__CFN_ConnectionMetrics *)v6, v4);
      __int128 v5 = v6[1];
      *(_OWORD *)(a1 + 24) = v6[0];
      *(_OWORD *)(a1 + 40) = v5;
    }

    else
    {
      *(int64x2_t *)(a1 + 24) = vdupq_n_s64(0x7FF8000000000000uLL);
      *(void *)(a1 + 40) = 0LL;
      *(void *)(a1 + 45) = 0LL;
    }

    *(_BYTE *)(a1 + 8) = 1;
  }

- (NSDate)connectEndDate
{
  if (self->__forCache)
  {
    v2 = 0LL;
  }

  else
  {
    -[NSURLSessionTaskTransactionMetrics translateConnectionTiming]((uint64_t)self, a2);
    LODWORD(v4) = self->connectDuration;
    [MEMORY[0x189603F50] dateWithTimeIntervalSinceReferenceDate:self->connectBeginTime + (double)v4 / 1000.0];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSDate *)v2;
}

- (NSDate)domainLookupStartDate
{
  if (self->__forCache)
  {
    v2 = 0LL;
  }

  else
  {
    -[NSURLSessionTaskTransactionMetrics translateConnectionTiming]((uint64_t)self, a2);
    [MEMORY[0x189603F50] dateWithTimeIntervalSinceReferenceDate:self->domainLookupBeginTime];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSDate *)v2;
}

- (NSDate)domainLookupEndDate
{
  if (self->__forCache)
  {
    v2 = 0LL;
  }

  else
  {
    -[NSURLSessionTaskTransactionMetrics translateConnectionTiming]((uint64_t)self, a2);
    LODWORD(v4) = self->domainLookupDuration;
    [MEMORY[0x189603F50] dateWithTimeIntervalSinceReferenceDate:self->domainLookupBeginTime + (double)v4 / 1000.0];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSDate *)v2;
}

- (NSDate)fetchStartDate
{
  metrics = self->__metrics;
  if (metrics) {
    double beginTime = metrics->_beginTime;
  }
  else {
    double beginTime = 0.0;
  }
  [MEMORY[0x189603F50] dateWithTimeIntervalSinceReferenceDate:beginTime];
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSDate)requestStartDate
{
  metrics = self->__metrics;
  if (!self->__forCache)
  {
    if (metrics)
    {
      double requestBeginTime = metrics->_requestBeginTime;
      goto LABEL_6;
    }

- (NSDate)responseStartDate
{
  metrics = self->__metrics;
  if (!self->__forCache)
  {
    if (metrics)
    {
      double responseBeginTime = metrics->_responseBeginTime;
      goto LABEL_6;
    }

- (NSDate)responseEndDate
{
  metrics = self->__metrics;
  if (!self->__forCache)
  {
    if (metrics)
    {
      double responseEndTime = metrics->_responseEndTime;
      goto LABEL_6;
    }

- (NSDate)secureConnectionStartDate
{
  if (self->__forCache
    || (-[NSURLSessionTaskTransactionMetrics translateConnectionTiming]((uint64_t)self, a2), !self->secure))
  {
    v2 = 0LL;
  }

  else
  {
    [MEMORY[0x189603F50] dateWithTimeIntervalSinceReferenceDate:self->connectBeginTime + (double)(self->connectDuration - self->secureConnectionDuration) / 1000.0];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSDate *)v2;
}

- (NSURLSessionTaskMetricsResourceFetchType)resourceFetchType
{
  if (self->__forCache) {
    return 3LL;
  }
  metrics = self->__metrics;
  if (!metrics || !metrics->_scheduledOriginLoad) {
    return 0LL;
  }
  if (metrics->_pushed) {
    return 2LL;
  }
  return 1LL;
}

- (BOOL)isReusedConnection
{
  if (self->__forCache) {
    return 0;
  }
  metrics = self->__metrics;
  if (!metrics) {
    return 1;
  }
  if (metrics->_pushed) {
    return 0;
  }
  return !metrics->_firstOnConnection;
}

- (NSURLResponse)response
{
  metrics = self->__metrics;
  if (!metrics) {
    return (NSURLResponse *)0LL;
  }
  uint64_t v3 = 9LL;
  if (!self->__forCache) {
    uint64_t v3 = 10LL;
  }
  return (NSURLResponse *)(&metrics->super.isa)[v3];
}

- (BOOL)_apsRelayAttempted
{
  return !self->__forCache && (metrics = self->__metrics) != 0LL && metrics->_APSRelayAttempted;
}

- (BOOL)_apsRelaySucceeded
{
  return !self->__forCache && (metrics = self->__metrics) != 0LL && metrics->_APSRelaySucceeded;
}

- (OS_nw_data_transfer_report)_dataTransferReport
{
  if (self->__forCache) {
    return (OS_nw_data_transfer_report *)0LL;
  }
  metrics = self->__metrics;
  if (metrics) {
    metrics = (__CFN_TransactionMetrics *)metrics->_dataTransferReport;
  }
  return (OS_nw_data_transfer_report *)metrics;
}

- (NSString)networkProtocolName
{
  if (self->__forCache) {
    goto LABEL_4;
  }
  metrics = self->__metrics;
  if (!metrics)
  {
    id v7 = 0LL;
    id Property = 0LL;
LABEL_8:
    id v3 = Property;

    return (NSString *)v3;
  }

  if (!metrics->_pushed)
  {
    id Property = objc_getProperty(metrics, a2, 88LL, 1);
    id v7 = Property;
    if (Property) {
      id Property = objc_getProperty(Property, v6, 160LL, 1);
    }
    goto LABEL_8;
  }

- (int64_t)countOfResponseBodyBytesAfterDecoding
{
  if (self->__forCache) {
    return 0LL;
  }
  metrics = self->__metrics;
  if (!metrics || metrics->_pushed) {
    return 0LL;
  }
  else {
    return metrics->_responseBodySize;
  }
}

@end