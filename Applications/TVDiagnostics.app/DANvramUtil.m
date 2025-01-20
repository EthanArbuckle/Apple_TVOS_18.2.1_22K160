@interface DANvramUtil
+ (id)sharedInstance;
- (void)_clearNVRamVariable:(id)a3;
- (void)_writeNVRamVariable:(id)a3 value:(id)a4;
- (void)clearNextBootCheckerBoardPersistent;
- (void)setNextBootCheckerBoard;
- (void)setNextBootCheckerBoardPersistent;
- (void)setNextBootRecovery;
- (void)syncASTDefaultsToNVRam;
@end

@implementation DANvramUtil

+ (id)sharedInstance
{
  if (qword_10003A5E8 != -1) {
    dispatch_once(&qword_10003A5E8, &stru_10002C758);
  }
  return (id)qword_10003A5E0;
}

- (void)syncASTDefaultsToNVRam
{
  uint64_t v3 = DiagnosticLogHandleForCategory(0LL);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DANvramUtil: syncASTDefaultsToNVRam", buf, 2u);
  }

  uint64_t v5 = ASTDomain;
  uint64_t v6 = ASTServerKey;
  uint64_t v7 = ASTCustomServerKey;
  v8 = -[NSUserDefaults initWithSuiteName:](objc_alloc(&OBJC_CLASS___NSUserDefaults), "initWithSuiteName:", ASTDomain);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v8, "objectForKey:", v6));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v8, "objectForKey:", v7));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.%@", v5, v6));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.%@", v5, v7));
  if (v9 && ([v9 isEqualToNumber:&off_10002E638] & 1) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v9 description]);
    -[DANvramUtil _writeNVRamVariable:value:](self, "_writeNVRamVariable:value:", v11, v13);

    if (!v10) {
      goto LABEL_9;
    }
  }

  else
  {
    -[DANvramUtil _clearNVRamVariable:](self, "_clearNVRamVariable:", v11);
    if (!v10) {
      goto LABEL_9;
    }
  }

  if (([v10 isEqualToString:&stru_10002D180] & 1) == 0)
  {
    -[DANvramUtil _writeNVRamVariable:value:](self, "_writeNVRamVariable:value:", v12, v10);
    goto LABEL_11;
  }

- (void)setNextBootRecovery
{
}

- (void)setNextBootCheckerBoard
{
}

- (void)setNextBootCheckerBoardPersistent
{
}

- (void)clearNextBootCheckerBoardPersistent
{
}

- (void)_writeNVRamVariable:(id)a3 value:(id)a4
{
  kern_return_t v9;
  uint64_t v10;
  os_log_s *v11;
  const char *v12;
  int v13;
  __CFString *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  kern_return_t v18;
  uint64_t v5 = (__CFString *)a3;
  id v6 = a4;
  io_registry_entry_t v7 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (v7)
  {
    io_object_t v8 = v7;
    v9 = IORegistryEntrySetCFProperty(v7, v5, v6);
    v10 = DiagnosticLogHandleForCategory(0LL);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = "failed";
      v13 = 138412802;
      v14 = v5;
      if (!v9) {
        v12 = "succeeded.";
      }
      v15 = 2080;
      v16 = v12;
      v17 = 1024;
      v18 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "DANvramUtil: Writing %@ to nvram %s with result %x",  (uint8_t *)&v13,  0x1Cu);
    }

    IOObjectRelease(v8);
  }
}

- (void)_clearNVRamVariable:(id)a3
{
  kern_return_t v6;
  uint64_t v7;
  os_log_s *v8;
  const char *v9;
  int v10;
  id v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  kern_return_t v15;
  id v3 = a3;
  io_registry_entry_t v4 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (v4)
  {
    io_object_t v5 = v4;
    id v6 = IORegistryEntrySetCFProperty(v4, @"IONVRAM-DELETE-PROPERTY", v3);
    io_registry_entry_t v7 = DiagnosticLogHandleForCategory(0LL);
    io_object_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = "failed";
      v10 = 138412802;
      v11 = v3;
      if (!v6) {
        v9 = "succeeded.";
      }
      v12 = 2080;
      v13 = v9;
      v14 = 1024;
      v15 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "DANvramUtil: Deleting %@ from nvram %s with result %x",  (uint8_t *)&v10,  0x1Cu);
    }

    IOObjectRelease(v5);
  }
}

@end