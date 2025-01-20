@interface ICDPowerEventLogger
+ (void)logEvent:(id)a3 payload:(id)a4;
@end

@implementation ICDPowerEventLogger

+ (void)logEvent:(id)a3 payload:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    v7 = off_1001DB578;
    v18 = off_1001DB578;
    if (!off_1001DB578)
    {
      v8 = sub_100004198();
      v7 = dlsym(v8, "PLShouldLogRegisteredEvent");
      *(void *)(*(void *)&buf[8] + 24LL) = v7;
      off_1001DB578 = v7;
    }

    _Block_object_dispose(buf, 8);
    if (v7)
    {
      if (!((unsigned int (*)(uint64_t, id))v7)(15LL, v5))
      {
        v11 = os_log_create("com.apple.amp.itunescloudd", "XPC");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v5;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v6;
          v12 = "Log Power Event requested but not permitted -- %{public}@ -- %{public}@";
          goto LABEL_13;
        }

@end