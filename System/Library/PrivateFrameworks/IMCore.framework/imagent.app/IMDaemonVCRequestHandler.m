@interface IMDaemonVCRequestHandler
- (void)clearPendingVCRequestsWithPerson:(id)a3 forAccount:(id)a4;
@end

@implementation IMDaemonVCRequestHandler

- (void)clearPendingVCRequestsWithPerson:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory("IMDaemonVCRequestHandler");
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      v10 = "-[IMDaemonVCRequestHandler clearPendingVCRequestsWithPerson:forAccount:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s no longer supported", (uint8_t *)&v9, 0xCu);
    }
  }
}

@end