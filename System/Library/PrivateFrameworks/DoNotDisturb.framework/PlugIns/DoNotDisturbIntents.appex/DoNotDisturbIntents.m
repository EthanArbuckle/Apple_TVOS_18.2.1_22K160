void DNDIntentRegisterLogging()
{
  if (qword_1000080E8 != -1) {
    dispatch_once(&qword_1000080E8, &stru_100004040);
  }
}

void sub_100003E88(id a1)
{
  os_log_t v1 = os_log_create("com.apple.donotdisturb", "Intents");
  v2 = (void *)DNDIntentLog;
  DNDIntentLog = (uint64_t)v1;
}