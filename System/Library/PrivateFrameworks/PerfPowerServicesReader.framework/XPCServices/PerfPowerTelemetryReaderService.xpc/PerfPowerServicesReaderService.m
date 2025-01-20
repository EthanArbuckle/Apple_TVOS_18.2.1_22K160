@interface PerfPowerServicesReaderService
- (void)dataForRequest:(id)a3 withReply:(id)a4;
@end

@implementation PerfPowerServicesReaderService

- (void)dataForRequest:(id)a3 withReply:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void *, id))a4;
  v7 = objc_autoreleasePoolPush();
  id v8 = PPSLogReaderService();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v10) {
      sub_100003344((uint64_t)v5, v9, v11);
    }

    id v12 = [[PPSRequestDispatcher alloc] initWithFilepath:0];
    v15[0] = 0LL;
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 dataForRequest:v5 withError:v15]);
    id v14 = v15[0];
  }

  else
  {
    if (v10) {
      sub_10000324C(v9);
    }

    id v14 = 0LL;
    v13 = 0LL;
  }

  v6[2](v6, v13, v14);

  objc_autoreleasePoolPop(v7);
}

@end