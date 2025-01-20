void start()
{
  void *v0;
  void *v1;
  uint64_t v2;
  v0 = objc_autoreleasePoolPush();
  v1 = (void *)os_transaction_create("donotdisturbd main");
  v2 = _set_user_dir_suffix("com.apple.donotdisturbd");
  DNDSRunServer(v2);

  objc_autoreleasePoolPop(v0);
  dispatch_main();
}