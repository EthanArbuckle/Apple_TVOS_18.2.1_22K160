@interface ODRLaunchServicesClient
- (void)bytesUsedForApplicationWithBundleID:(id)a3 replyBlock:(id)a4;
@end

@implementation ODRLaunchServicesClient

- (void)bytesUsedForApplicationWithBundleID:(id)a3 replyBlock:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id, void))a4;
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  v14 = sub_1002D6CF0;
  v15 = sub_1002D6D00;
  v16 = &off_10040CF58;
  objc_opt_self(&OBJC_CLASS___ODRPlatformPolicies);
  uint64_t v8 = ASDLogHandleForCategory(19LL);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v10 = [(id)v12[5] longLongValue];
    *(_DWORD *)buf = 134218498;
    v18 = self;
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2048;
    id v22 = v10;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "(ODRLaunchServicesClient) [%p] bytes used for '%@' = %{iec-bytes}lld",  buf,  0x20u);
  }

  v7[2](v7, [(id)v12[5] integerValue], 0);
  _Block_object_dispose(&v11, 8);
}

@end