@interface ComponentFan
- (BOOL)isPresent;
- (id)currentFanSpeed;
- (void)performThermalConnectionOperationUsingBlock:(id)a3;
- (void)performThermalServiceOperationUsingBlock:(id)a3;
- (void)populateAttributes:(id)a3;
@end

@implementation ComponentFan

- (BOOL)isPresent
{
  uint64_t v5 = 0LL;
  v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001A8F8;
  v4[3] = &unk_1000605B8;
  v4[4] = &v5;
  -[ComponentFan performThermalServiceOperationUsingBlock:](self, "performThermalServiceOperationUsingBlock:", v4);
  char v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)populateAttributes:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[ComponentFan currentFanSpeed](self, "currentFanSpeed"));
  id v5 = numberOrNull(v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v4 setObject:v6 forKeyedSubscript:@"currentSpeed"];
}

- (void)performThermalServiceOperationUsingBlock:(id)a3
{
  kern_return_t v7;
  kern_return_t v8;
  uint64_t v9;
  os_log_s *v10;
  uint64_t v11;
  os_log_s *v12;
  _DWORD v13[2];
  v3 = (void (**)(id, void))a3;
  id v4 = IOServiceMatching("ApplePMPThermal");
  uint64_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v4);
  if ((_DWORD)MatchingService)
  {
    io_object_t v6 = MatchingService;
    v3[2](v3, MatchingService);
    id v7 = IOObjectRelease(v6);
    if (v7)
    {
      char v8 = v7;
      v9 = DiagnosticLogHandleForCategory(6LL);
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v13[0] = 67109120;
        v13[1] = v8;
        _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Failed to release service (err = %d).",  (uint8_t *)v13,  8u);
      }
    }
  }

  else
  {
    v11 = DiagnosticLogHandleForCategory(6LL);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13[0]) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "No matching service found.",  (uint8_t *)v13,  2u);
    }

    v3[2](v3, 0LL);
  }
}

- (void)performThermalConnectionOperationUsingBlock:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001AB50;
  v5[3] = &unk_1000605E0;
  id v6 = a3;
  id v4 = v6;
  -[ComponentFan performThermalServiceOperationUsingBlock:](self, "performThermalServiceOperationUsingBlock:", v5);
}

- (id)currentFanSpeed
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  char v8 = sub_10001AD70;
  v9 = sub_10001AD80;
  id v10 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001AD88;
  v4[3] = &unk_1000605B8;
  v4[4] = &v5;
  -[ComponentFan performThermalConnectionOperationUsingBlock:](self, "performThermalConnectionOperationUsingBlock:", v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

@end