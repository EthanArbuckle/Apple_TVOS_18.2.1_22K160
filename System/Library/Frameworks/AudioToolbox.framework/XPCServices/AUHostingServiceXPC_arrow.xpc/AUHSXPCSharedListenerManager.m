@interface AUHSXPCSharedListenerManager
- (void)builtForPlatform:(unsigned int)a3 againstMinimumSDK:(unsigned int)a4 reply:(id)a5;
- (void)getProgramSDKVersion:(id)a3;
- (void)warmUpClassNamed:(id)a3 withReply:(id)a4;
@end

@implementation AUHSXPCSharedListenerManager

- (void)builtForPlatform:(unsigned int)a3 againstMinimumSDK:(unsigned int)a4 reply:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  v10 = (void (**)(id, void, uint64_t))a5;
  if (a3 <= 7 && ((1 << a3) & 0xC6) != 0)
  {
    uint64_t v7 = dyld_program_sdk_at_least(a3 | (unint64_t)(v5 << 32));
    v10[2](v10, 0LL, v7);
  }

  else
  {
    id v8 = sub_100001BFC(1LL, @"unsupported platform");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    ((void (**)(id, void *, uint64_t))v10)[2](v10, v9, 0LL);
  }
}

- (void)getProgramSDKVersion:(id)a3
{
  id v5 = a3;
  uint64_t program_sdk_version = dyld_get_program_sdk_version();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, program_sdk_version);
}

- (void)warmUpClassNamed:(id)a3 withReply:(id)a4
{
  aClassName = (NSString *)a3;
  id v5 = (void (**)(id, id))a4;
  id v6 = -[objc_class remoteWarmUp](NSClassFromString(aClassName), "remoteWarmUp");
  v5[2](v5, v6);
}

@end