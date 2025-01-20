int main(int argc, const char **argv, const char **envp)
{
  ServiceDelegate *v3;
  void *v4;
  v3 = objc_opt_new(&OBJC_CLASS___ServiceDelegate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

id MTLoggingPreferenceProvider()
{
  if (MTLoggingPreferenceProvider_onceToken != -1) {
    dispatch_once(&MTLoggingPreferenceProvider_onceToken, &__block_literal_global);
  }
  return (id)MTLoggingPreferenceProvider___logObj;
}

void OUTLINED_FUNCTION_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

id objc_msgSend_tvDefaults(void *a1, const char *a2, ...)
{
  return [a1 tvDefaults];
}
erenceProvider init](&v11, "init");
  if (v2)
  {
    v3 = MTLoggingPreferenceProvider();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    logHandle = v2->_logHandle;
    v2->_logHandle = (OS_os_log *)v4;

    v6 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.TVPeripheralServices");
    tvDefaults = v2->_tvDefaults;
    v2->_tvDefaults = v6;

    v8 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.ContinuousRecording");
    continuousRecordingDefaults = v2->_continuousRecordingDefaults;
    v2->_continuousRecordingDefaults = v8;
  }

  return v2;
}

- (BOOL)touchDisabled
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SessionFilterPreferenceProvider tvDefaults](self, "tvDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"RemoteClickpadMode"]);

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SessionFilterPreferenceProvider tvDefaults](self, "tvDefaults"));
    id v6 = [v5 integerForKey:@"RemoteClickpadMode"];

    if (v6)
    {
      if (v6 == (id)1) {
        return 1;
      }
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SessionFilterPreferenceProvider logHandle](self, "logHandle"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[SessionFilterPreferenceProvider touchDisabled].cold.1((uint64_t)v6, v8);
      }
    }
  }

  return 0;
}

- (void)siriRemoteTouchDisabledWithReply:(id)a3
{
  v4 = (void (**)(id, BOOL))a3;
  BOOL v5 = -[SessionFilterPreferenceProvider touchDisabled](self, "touchDisabled");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SessionFilterPreferenceProvider logHandle](self, "logHandle"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Touch disabled: %d", (uint8_t *)v7, 8u);
  }

  v4[2](v4, v5);
}

- (void)continuousRecordingEnabledWithReply:(id)a3
{
  v4 = (void (**)(id, uint64_t))a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[SessionFilterPreferenceProvider continuousRecordingDefaults](self, "continuousRecordingDefaults"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"ContinuousRecordingV3"]);

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    uint64_t v8 = (uint64_t)[v6 BOOLValue];
  }

  else if (v6)
  {
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SessionFilterPreferenceProvider logHandle](self, "logHandle"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SessionFilterPreferenceProvider continuousRecordingEnabledWithReply:].cold.1( (uint64_t)v6,  v9,  v10,  v11,  v12,  v13,  v14,  v15);
    }

    uint64_t v8 = 0LL;
  }

  else
  {
    uint64_t v8 = 1LL;
  }

  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SessionFilterPreferenceProvider logHandle](self, "logHandle"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17[0] = 67109120;
    v17[1] = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Continuous recording enabled: %d",  (uint8_t *)v17,  8u);
  }

  v4[2](v4, v8);
}

- (void)continuousRecordingDeleteForAllServicesWithReply:(id)a3
{
  v4 = (void (**)(id, uint64_t))a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[SessionFilterPreferenceProvider continuousRecordingDefaults](self, "continuousRecordingDefaults"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"deleteForAllServices"]);

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    uint64_t v8 = (uint64_t)[v6 BOOLValue];
  }

  else
  {
    if (v6)
    {
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SessionFilterPreferenceProvider logHandle](self, "logHandle"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[SessionFilterPreferenceProvider continuousRecordingDeleteForAllServicesWithReply:].cold.1( (uint64_t)v6,  v9,  v10,  v11,  v12,  v13,  v14,  v15);
      }
    }

    uint64_t v8 = 1LL;
  }

  v4[2](v4, v8);
}

- (void)continuousRecordingSetDeleteForAllServices:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SessionFilterPreferenceProvider continuousRecordingDefaults](self, "continuousRecordingDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
  [v5 setObject:v4 forKey:@"deleteForAllServices"];
}

- (NSUserDefaults)tvDefaults
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSUserDefaults)continuousRecordingDefaults
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 16LL, 1);
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 24LL, 1);
}

- (void).cxx_destruct
{
}

- (void)touchDisabled
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Unrecognized remote clickpad mode value %ld",  (uint8_t *)&v2,  0xCu);
}

- (void)continuousRecordingEnabledWithReply:(uint64_t)a3 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)continuousRecordingDeleteForAllServicesWithReply:(uint64_t)a3 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end