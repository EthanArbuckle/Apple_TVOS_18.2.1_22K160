@interface PFCloudKitMetricsClient
- (void)logMetric:(uint64_t)a1;
@end

@implementation PFCloudKitMetricsClient

- (void)logMetric:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    v3 = (void *)MEMORY[0x186E3E5D8]();
    v4 = (void *)[a2 name];
    v5 = (void *)[a2 payload];
    if (![v4 length] || !objc_msgSend(v5, "count"))
    {
      uint64_t v6 = [NSString stringWithUTF8String:"Invalid metric sent to PFCloudKitMetricsClient: %@"];
      _NSCoreDataLog(17LL, v6, v7, v8, v9, v10, v11, v12, (uint64_t)a2);
      v13 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v15 = a2;
        _os_log_fault_impl( &dword_186681000,  v13,  OS_LOG_TYPE_FAULT,  "CoreData: Invalid metric sent to PFCloudKitMetricsClient: %@",  buf,  0xCu);
      }
    }

    softLinkAnalyticsSendEvent();
    objc_autoreleasePoolPop(v3);
  }

@end