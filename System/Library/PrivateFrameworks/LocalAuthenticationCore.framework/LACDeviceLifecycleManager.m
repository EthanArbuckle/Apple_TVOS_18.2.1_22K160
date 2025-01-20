@interface LACDeviceLifecycleManager
+ (void)rebootDeviceWithReason:(id)a3 completion:(id)a4;
@end

@implementation LACDeviceLifecycleManager

+ (void)rebootDeviceWithReason:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v6 = (void (**)(id, void *))a4;
  LACLogDefault();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v5;
    _os_log_impl(&dword_189219000, v7, OS_LOG_TYPE_DEFAULT, "Rebooting device with reason: %@", (uint8_t *)&v11, 0xCu);
  }

  int v8 = reboot3();
  LACLogDefault();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 67109120;
    LODWORD(v12) = v8;
    _os_log_impl(&dword_189219000, v9, OS_LOG_TYPE_DEFAULT, "Requested reboot with result: %d", (uint8_t *)&v11, 8u);
  }

  if (v8)
  {
    v10 = +[LACError errorWithCode:debugDescription:]( &OBJC_CLASS___LACError,  "errorWithCode:debugDescription:",  -1000LL,  @"Failed to reboot the device");
    v6[2](v6, v10);
  }

  else
  {
    v6[2](v6, 0LL);
  }
}

@end