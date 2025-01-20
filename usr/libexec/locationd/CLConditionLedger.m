@interface CLConditionLedger
- (BOOL)addRecordForMonitoring:(id)a3 identifier:(id)a4 persist:(BOOL)a5;
- (BOOL)directoryExists:(id)a3;
- (BOOL)persistentFileReadSucceeded;
- (BOOL)readConditionsFromFile;
- (BOOL)removeRecordFromMonitoringWithIdentifier:(id)a3;
- (BOOL)shouldMigrate;
- (BOOL)writeToFile;
- (CLConditionLedger)initWithStoreType:(int64_t)a3 domain:(int64_t)a4 monitorConfiguration:(id)a5;
- (NSArray)allMonitoringIdentifiers;
- (NSDictionary)allMonitoringRecordsByIdentifier;
- (NSFileManager)defaultFileManager;
- (NSNumber)ledgerVersionNumber;
- (NSString)ledgerName;
- (NSURL)ledgerFile;
- (id)monitoringRecordForIdentifier:(id)a3;
- (void)dealloc;
- (void)deleteLedgerFile;
- (void)performMigration;
- (void)setLedgerForType:(int64_t)a3 domain:(int64_t)a4 monitor:(id)a5 client:(id)a6 path:(id)a7;
- (void)setLedgerVersionNumber:(int)a3;
- (void)updateEvent:(id)a3 forIdentifier:(id)a4;
- (void)updateRecord:(id)a3 identifier:(id)a4;
@end

@implementation CLConditionLedger

- (CLConditionLedger)initWithStoreType:(int64_t)a3 domain:(int64_t)a4 monitorConfiguration:(id)a5
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CLConditionLedger;
  v9 = -[CLConditionLedger init](&v15, "init");
  if (v9)
  {
    id v10 = [a5 objectForKeyedSubscript:@"kCLMonitorLedgerPathKey"];
    id v11 = [a5 objectForKeyedSubscript:@"kCLMonitorLedgerNameKey"];
    id v12 = [a5 objectForKeyedSubscript:@"kCLMonitorLedgerAccessKey"];
    id v13 = [a5 objectForKeyedSubscript:@"kCLMonitorLedgerProcessNameKey"];
    if (v11)
    {
      if (v12)
      {
LABEL_4:
        -[CLConditionLedger setLedgerForType:domain:monitor:client:path:]( v9,  "setLedgerForType:domain:monitor:client:path:",  a3,  a4,  v11,  v13,  v10);
        v9->_recordTable = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        v9->_encryptionKey = (NSData *)[v12 copy];
        v9->_ledgerName = (NSString *)[v11 copy];
        v9->_readSucceeded = -[CLConditionLedger readConditionsFromFile](v9, "readConditionsFromFile");
        -[CLConditionLedger performMigration](v9, "performMigration");
        return v9;
      }
    }

    else
    {
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  v9,  @"CLConditionLedger.mm",  94LL,  @"Monitor name is nil");
      if (v12) {
        goto LABEL_4;
      }
    }

    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  v9,  @"CLConditionLedger.mm",  95LL,  @"Key is nil to read/store %@ monitor's contents",  v11);
    goto LABEL_4;
  }

  return v9;
}

- (void)dealloc
{
  if (!-[NSDictionary count]( -[CLConditionLedger allMonitoringRecordsByIdentifier](self, "allMonitoringRecordsByIdentifier"),  "count")) {
    -[CLConditionLedger deleteLedgerFile](self, "deleteLedgerFile");
  }

  self->_ledgerFile = 0LL;
  self->_encryptionKey = 0LL;

  self->_recordTable = 0LL;
  self->_ledgerName = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLConditionLedger;
  -[CLConditionLedger dealloc](&v3, "dealloc");
}

- (BOOL)persistentFileReadSucceeded
{
  return self->_readSucceeded;
}

- (BOOL)shouldMigrate
{
  return -[NSNumber intValue](-[CLConditionLedger ledgerVersionNumber](self, "ledgerVersionNumber"), "intValue") < 1;
}

- (void)performMigration
{
  if (-[CLConditionLedger shouldMigrate](self, "shouldMigrate")) {
    -[CLConditionLedger setLedgerVersionNumber:](self, "setLedgerVersionNumber:", 1LL);
  }
}

- (void)setLedgerVersionNumber:(int)a3
{
  self->_ledgerVersionNumber = -[NSNumber initWithInt:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithInt:",  *(void *)&a3);
}

- (void)setLedgerForType:(int64_t)a3 domain:(int64_t)a4 monitor:(id)a5 client:(id)a6 path:(id)a7
{
  if (-[CLConditionLedger ledgerFile](self, "ledgerFile")) {
    return;
  }
  int v14 = _sandbox_in_a_container();
  v28 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.monitor", a5);
  if (a3 == 1 && a4 == 1)
  {
    if (!a7) {
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"CLConditionLedger.mm",  169LL,  @"#monitor Invalid path for custom store for %@ monitor",  a5);
    }
    objc_super v15 = +[NSURL fileURLWithPath:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:relativeToURL:",  a7,  1LL,  0LL);
    v16 = +[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", &stru_1018A4B00);
  }

  else
  {
    v16 = +[NSMutableString stringWithString:]( &OBJC_CLASS___NSMutableString,  "stringWithString:",  @"CoreLocation/");
    if (a3)
    {
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018599D8);
      }
      v17 = (os_log_s *)qword_101934978;
      if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289026;
        int v30 = 0;
        __int16 v31 = 2082;
        v32 = "";
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Custom store type cannot use on NSSearchPathDirectory}",  buf,  0x12u);
        if (qword_101934970 != -1) {
          dispatch_once(&qword_101934970, &stru_1018599D8);
        }
      }

      v18 = (os_log_s *)qword_101934978;
      if (os_signpost_enabled((os_log_t)qword_101934978))
      {
        *(_DWORD *)buf = 68289026;
        int v30 = 0;
        __int16 v31 = 2082;
        v32 = "";
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v18,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Custom store type cannot use on NSSearchPathDirectory",  "{msg%{public}.0s:Custom store type cannot use on NSSearchPathDirectory}",  buf,  0x12u);
      }

      uint64_t v19 = 5LL;
    }

    else if (v14)
    {
      uint64_t v19 = 9LL;
    }

    else
    {
      uint64_t v19 = 5LL;
    }

    if (a4) {
      uint64_t v20 = 8LL;
    }
    else {
      uint64_t v20 = 1LL;
    }
    objc_super v15 = -[NSArray firstObject]( -[NSFileManager URLsForDirectory:inDomains:]( -[CLConditionLedger defaultFileManager](self, "defaultFileManager"),  "URLsForDirectory:inDomains:",  v19,  v20),  "firstObject");
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018599D8);
    }
    v21 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289282;
      int v30 = 0;
      __int16 v31 = 2082;
      v32 = "";
      __int16 v33 = 2114;
      id v34 = a6;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#monitor App is not sanboxed, client:%{public, location:escape_only}@}",  buf,  0x1Cu);
    }

    if (!-[CLConditionLedger directoryExists:]( self,  "directoryExists:",  -[NSURL URLByAppendingPathComponent:](v15, "URLByAppendingPathComponent:", v16))) {
      sub_10124BBBC();
    }
    if ((v14 & 1) == 0)
    {
      v22 = &CMOnBodyStatusManagerManufacturer_ptr;
      -[NSMutableString appendString:]( v16,  "appendString:",  +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@/", a6));
      v23 = -[NSURL URLByAppendingPathComponent:](v15, "URLByAppendingPathComponent:", v16);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018599D8);
      }
      v24 = (os_log_s *)qword_101934978;
      if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289282;
        int v30 = 0;
        __int16 v31 = 2082;
        v32 = "";
        __int16 v33 = 2114;
        id v34 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#monitor process is not containerized, path:%{public, location:escape_only}@}",  buf,  0x1Cu);
      }

      if (!-[CLConditionLedger directoryExists:](self, "directoryExists:", v23)) {
        sub_10124BA4C();
      }
      goto LABEL_34;
    }
  }

  v22 = &CMOnBodyStatusManagerManufacturer_ptr;
LABEL_34:
  if (!v15) {
    sub_10124B880();
  }
  -[NSMutableString appendString:](v16, "appendString:", [v22[448] stringWithFormat:@"%@", v28]);
  v25 = -[NSURL URLByAppendingPathComponent:](v15, "URLByAppendingPathComponent:", v16);
  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018599D8);
  }
  v26 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEBUG))
  {
    v27 = -[NSString UTF8String](-[NSURL path](v25, "path"), "UTF8String");
    *(_DWORD *)buf = 68289282;
    int v30 = 0;
    __int16 v31 = 2082;
    v32 = "";
    __int16 v33 = 2082;
    id v34 = (id)v27;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#monitor Conditions store, path:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  self->_ledgerFile =  +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  -[NSURL path](v25, "path"),  0LL);
}

- (BOOL)directoryExists:(id)a3
{
  id v8 = 0LL;
  v4 = -[CLConditionLedger defaultFileManager](self, "defaultFileManager");
  if (qword_101998D68 != -1) {
    dispatch_once(&qword_101998D68, &stru_1018599F8);
  }
  if (-[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:]( v4,  "createDirectoryAtURL:withIntermediateDirectories:attributes:error:",  a3,  0LL,  qword_101998D60,  &v8)
    || [v8 code] == (id)516)
  {
    return 1;
  }

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018599D8);
  }
  v6 = (os_log_s *)qword_101934978;
  BOOL v7 = os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v7)
  {
    *(_DWORD *)buf = 68289538;
    int v10 = 0;
    __int16 v11 = 2082;
    id v12 = "";
    __int16 v13 = 2114;
    id v14 = v8;
    __int16 v15 = 2114;
    id v16 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#monitor #warning unable to check for directory, error:%{public, location:escape_only }@, pathURL:%{public, location:escape_only}@}",  buf,  0x26u);
    return 0;
  }

  return result;
}

- (NSFileManager)defaultFileManager
{
  return +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
}

- (BOOL)readConditionsFromFile
{
  objc_super v3 = -[CLConditionLedger ledgerFile](self, "ledgerFile");
  if (!v3)
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018599D8);
    }
    __int16 v15 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v61 = 0;
      __int16 v62 = 2082;
      v63 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#monitor path is nil for ledger file}",  buf,  0x12u);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018599D8);
      }
    }

    uint64_t v16 = qword_101934978;
    BOOL v13 = os_signpost_enabled((os_log_t)qword_101934978);
    if (!v13) {
      return v13;
    }
    *(_DWORD *)buf = 68289026;
    int v61 = 0;
    __int16 v62 = 2082;
    v63 = "";
    v17 = "#monitor path is nil for ledger file";
    v18 = "{msg%{public}.0s:#monitor path is nil for ledger file}";
    uint64_t v19 = (os_log_s *)v16;
    uint32_t v20 = 18;
LABEL_45:
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v19,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  v17,  v18,  buf,  v20);
    goto LABEL_46;
  }

  v4 = v3;
  id v59 = 0LL;
  v5 = +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v3,  1LL,  &v59);
  if (v59 && [v59 code] != (id)260)
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018599D8);
    }
    v21 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_FAULT))
    {
      v22 = -[NSString UTF8String](-[NSURL path](v4, "path"), "UTF8String");
      *(_DWORD *)buf = 68289538;
      int v61 = 0;
      __int16 v62 = 2082;
      v63 = "";
      __int16 v64 = 2082;
      *(void *)v65 = v22;
      *(_WORD *)&v65[8] = 2114;
      *(void *)&v65[10] = v59;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#monitor #Warning Unable to read the contents of file, file:%{public, location:esca pe_only}s, error:%{public, location:escape_only}@}",  buf,  0x26u);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018599D8);
      }
    }

    uint64_t v23 = qword_101934978;
    BOOL v13 = os_signpost_enabled((os_log_t)qword_101934978);
    if (!v13) {
      return v13;
    }
    v24 = -[NSString UTF8String](-[NSURL path](v4, "path"), "UTF8String");
    *(_DWORD *)buf = 68289538;
    int v61 = 0;
    __int16 v62 = 2082;
    v63 = "";
    __int16 v64 = 2082;
    *(void *)v65 = v24;
    *(_WORD *)&v65[8] = 2114;
    *(void *)&v65[10] = v59;
    v17 = "#monitor #Warning Unable to read the contents of file";
    v18 = "{msg%{public}.0s:#monitor #Warning Unable to read the contents of file, file:%{public, location:es"
          "cape_only}s, error:%{public, location:escape_only}@}";
LABEL_44:
    uint64_t v19 = (os_log_s *)v23;
    uint32_t v20 = 38;
    goto LABEL_45;
  }

  if (!v5)
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018599D8);
    }
    v25 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      v26 = -[NSString UTF8String](-[NSURL path](v4, "path"), "UTF8String");
      *(_DWORD *)buf = 68289282;
      int v61 = 0;
      __int16 v62 = 2082;
      v63 = "";
      __int16 v64 = 2082;
      *(void *)v65 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#monitor no conditions were saved, file:%{public, location:escape_only}s}",  buf,  0x1Cu);
    }

    goto LABEL_53;
  }

  v6 =  -[NSMutableData initWithLength:]( objc_alloc(&OBJC_CLASS___NSMutableData),  "initWithLength:",  (char *)-[NSData length](v5, "length") - 32);
  id v7 = -[NSData bytes](v5, "bytes");
  id v8 = -[NSData bytes](self->_encryptionKey, "bytes");
  NSUInteger v9 = -[NSData length](self->_encryptionKey, "length");
  -[NSMutableData mutableBytes](v6, "mutableBytes");
  int v10 = CCCryptorGCMOneshotDecrypt(0LL, v8, v9, v7, 16LL, 0LL, 0LL);
  if (!v10)
  {
    unsigned __int8 v27 = atomic_load((unsigned __int8 *)&qword_101998D58);
    if ((v27 & 1) == 0 && __cxa_guard_acquire(&qword_101998D58))
    {
      objc_opt_class(&OBJC_CLASS___CLMonitoringRecord);
      uint64_t v58 = v38;
      objc_opt_class(&OBJC_CLASS___CLMonitoringEvent);
      uint64_t v57 = v39;
      objc_opt_class(&OBJC_CLASS___NSNumber);
      uint64_t v56 = v40;
      objc_opt_class(&OBJC_CLASS___NSDictionary);
      uint64_t v42 = v41;
      objc_opt_class(&OBJC_CLASS___NSString);
      uint64_t v44 = v43;
      objc_opt_class(&OBJC_CLASS___NSDate);
      uint64_t v46 = v45;
      objc_opt_class(&OBJC_CLASS___CLCircularGeographicCondition);
      uint64_t v48 = v47;
      objc_opt_class(&OBJC_CLASS___CLBeaconIdentityCondition);
      uint64_t v50 = v49;
      objc_opt_class(&OBJC_CLASS___CLMinimumAltitudeCondition);
      uint64_t v52 = v51;
      *(void *)&double v53 = objc_opt_class(&OBJC_CLASS___CLCondition).n128_u64[0];
      qword_101998D50 =  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v58,  v53,  v57,  v56,  v42,  v44,  v46,  v48,  v50,  v52,  v54,  0LL);
      __cxa_guard_release(&qword_101998D58);
    }

    id v28 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  qword_101998D50,  v6,  &v59);
    if (!v59)
    {
      v29 = v28;
      if (v28)
      {
        id v30 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
        [v30 addEntriesFromDictionary:v29];
        if ([v29 objectForKeyedSubscript:@"kCLLedgerVersionNumber"])
        {
          self->_ledgerVersionNumber = (NSNumber *)[v29 objectForKeyedSubscript:@"kCLLedgerVersionNumber"];
          if (qword_101934980 != -1) {
            dispatch_once(&qword_101934980, &stru_101859A18);
          }
          __int16 v31 = (os_log_s *)qword_101934988;
          if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
          {
            v32 = -[CLConditionLedger ledgerVersionNumber](self, "ledgerVersionNumber");
            *(_DWORD *)buf = 68289282;
            int v61 = 0;
            __int16 v62 = 2082;
            v63 = "";
            __int16 v64 = 2114;
            *(void *)v65 = v32;
            _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#monitor Found ledger version number, ledgerVersion:%{public, location:escape_only}@}",  buf,  0x1Cu);
          }

          [v30 removeObjectForKey:@"kCLLedgerVersionNumber"];
        }

        else
        {
          self->_ledgerVersionNumber = (NSNumber *)&off_1018D3A58;
        }

        if (qword_101934970 != -1) {
          dispatch_once(&qword_101934970, &stru_1018599D8);
        }
        v36 = (os_log_s *)qword_101934978;
        if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
        {
          id v37 = [v30 count];
          *(_DWORD *)buf = 68289282;
          int v61 = 0;
          __int16 v62 = 2082;
          v63 = "";
          __int16 v64 = 2050;
          *(void *)v65 = v37;
          _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#monitor file has conditions saved, count:%{public}ld}",  buf,  0x1Cu);
        }

        -[NSMutableDictionary addEntriesFromDictionary:](self->_recordTable, "addEntriesFromDictionary:", v30);
LABEL_53:
        LOBYTE(v13) = 1;
        return v13;
      }
    }

    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018599D8);
    }
    __int16 v33 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_FAULT))
    {
      id v34 = -[NSString UTF8String](-[NSURL path](v4, "path"), "UTF8String");
      *(_DWORD *)buf = 68289539;
      int v61 = 0;
      __int16 v62 = 2082;
      v63 = "";
      __int16 v64 = 2081;
      *(void *)v65 = v34;
      *(_WORD *)&v65[8] = 2114;
      *(void *)&v65[10] = v59;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#monitor #Warning unable to read conditions from file, file:%{private, location:esc ape_only}s, error:%{public, location:escape_only}@}",  buf,  0x26u);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018599D8);
      }
    }

    uint64_t v23 = qword_101934978;
    BOOL v13 = os_signpost_enabled((os_log_t)qword_101934978);
    if (!v13) {
      return v13;
    }
    v35 = -[NSString UTF8String](-[NSURL path](v4, "path"), "UTF8String");
    *(_DWORD *)buf = 68289539;
    int v61 = 0;
    __int16 v62 = 2082;
    v63 = "";
    __int16 v64 = 2081;
    *(void *)v65 = v35;
    *(_WORD *)&v65[8] = 2114;
    *(void *)&v65[10] = v59;
    v17 = "#monitor #Warning unable to read conditions from file";
    v18 = "{msg%{public}.0s:#monitor #Warning unable to read conditions from file, file:%{private, location:e"
          "scape_only}s, error:%{public, location:escape_only}@}";
    goto LABEL_44;
  }

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018599D8);
  }
  __int16 v11 = (os_log_s *)qword_101934978;
  BOOL v12 = os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT);
  LOBYTE(v13) = 0;
  if (v12)
  {
    id v14 = -[CLConditionLedger ledgerFile](self, "ledgerFile");
    *(_DWORD *)buf = 68289538;
    int v61 = 0;
    __int16 v62 = 2082;
    v63 = "";
    __int16 v64 = 1026;
    *(_DWORD *)v65 = v10;
    *(_WORD *)&v65[4] = 2114;
    *(void *)&v65[6] = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#monitor #Warning unable to decrypt the conditions, error:%{public}d, ledger:%{pu blic, location:escape_only}@}",  buf,  0x22u);
LABEL_46:
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (BOOL)writeToFile
{
  objc_super v3 = -[CLConditionLedger ledgerFile](self, "ledgerFile");
  if (!v3) {
    return (char)v3;
  }
  if (!-[NSDictionary count]( -[CLConditionLedger allMonitoringRecordsByIdentifier](self, "allMonitoringRecordsByIdentifier"),  "count"))
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101859A18);
    }
    v22 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289282;
      int v34 = 0;
      __int16 v35 = 2082;
      v36 = "";
      __int16 v37 = 2114;
      uint64_t v38 = -[NSURL path](-[CLConditionLedger ledgerFile](self, "ledgerFile"), "path");
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#monitor nothing to write; Removing existing file, file:%{public, location:escape_only}@}",
        buf,
        0x1Cu);
    }

    -[CLConditionLedger deleteLedgerFile](self, "deleteLedgerFile");
    goto LABEL_26;
  }

  id v4 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  objc_msgSend( v4,  "addEntriesFromDictionary:",  -[CLConditionLedger allMonitoringRecordsByIdentifier](self, "allMonitoringRecordsByIdentifier"));
  objc_msgSend( v4,  "setObject:forKey:",  -[CLConditionLedger ledgerVersionNumber](self, "ledgerVersionNumber"),  @"kCLLedgerVersionNumber");
  uint64_t v32 = 0LL;
  v5 = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  +[NSDictionary dictionaryWithDictionary:](&OBJC_CLASS___NSDictionary, "dictionaryWithDictionary:", v4),  1LL,  &v32);
  if (v32 || (v6 = v5) == 0LL)
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018599D8);
    }
    uint64_t v23 = (os_log_s *)qword_101934978;
    BOOL v24 = os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT);
    LOBYTE(v3) = 0;
    if (v24)
    {
      v25 = -[NSURL path](-[CLConditionLedger ledgerFile](self, "ledgerFile"), "path");
      *(_DWORD *)buf = 68289538;
      int v34 = 0;
      __int16 v35 = 2082;
      v36 = "";
      __int16 v37 = 2114;
      uint64_t v38 = v25;
      __int16 v39 = 2114;
      uint64_t v40 = v32;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#monitor Unable to store conditions, file:%{public, location:escape_only}@, error :%{public, location:escape_only}@}",  buf,  0x26u);
LABEL_41:
      LOBYTE(v3) = 0;
      return (char)v3;
    }

    return (char)v3;
  }

  id v7 =  -[NSMutableData initWithLength:]( objc_alloc(&OBJC_CLASS___NSMutableData),  "initWithLength:",  (char *)-[NSData length](v5, "length") + 32);
  id v8 = -[NSMutableData mutableBytes](v7, "mutableBytes");
  NSUInteger v9 = (char *)-[NSData length](v6, "length") + (void)(v8 + 16);
  int v10 = SecRandomCopyBytes(kSecRandomDefault, 0x10uLL, v8);
  if (v10)
  {
    int v11 = v10;
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018599D8);
    }
    BOOL v12 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289282;
      int v34 = 0;
      __int16 v35 = 2082;
      v36 = "";
      __int16 v37 = 1026;
      LODWORD(v38) = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#monitor unable to init random vector, error:%{public}d}",  buf,  0x18u);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018599D8);
      }
    }

    BOOL v13 = (os_log_s *)qword_101934978;
    if (os_signpost_enabled((os_log_t)qword_101934978))
    {
      *(_DWORD *)buf = 68289282;
      int v34 = 0;
      __int16 v35 = 2082;
      v36 = "";
      __int16 v37 = 1026;
      LODWORD(v38) = v11;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#monitor unable to init random vector",  "{msg%{public}.0s:#monitor unable to init random vector, error:%{public}d}",  buf,  0x18u);
    }
  }

  int v14 = CCCryptorGCMOneshotEncrypt( 0LL,  -[NSData bytes](self->_encryptionKey, "bytes"),  -[NSData length](self->_encryptionKey, "length"),  v8,  16LL,  0LL,  0LL,  -[NSData bytes](v6, "bytes"),  -[NSData length](v6, "length"),  v8 + 16,  v9,  16LL);
  if (v14)
  {
    int v15 = v14;
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018599D8);
    }
    uint64_t v16 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289282;
      int v34 = 0;
      __int16 v35 = 2082;
      v36 = "";
      __int16 v37 = 1026;
      LODWORD(v38) = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#monitor unable to encrypt the conditions, error:%{public}d}",  buf,  0x18u);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_1018599D8);
      }
    }

    uint64_t v17 = qword_101934978;
    LODWORD(v3) = os_signpost_enabled((os_log_t)qword_101934978);
    if ((_DWORD)v3)
    {
      *(_DWORD *)buf = 68289282;
      int v34 = 0;
      __int16 v35 = 2082;
      v36 = "";
      __int16 v37 = 1026;
      LODWORD(v38) = v15;
      v18 = "#monitor unable to encrypt the conditions";
      uint64_t v19 = "{msg%{public}.0s:#monitor unable to encrypt the conditions, error:%{public}d}";
      uint32_t v20 = (os_log_s *)v17;
      uint32_t v21 = 24;
LABEL_40:
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v20,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  v18,  v19,  buf,  v21);
      goto LABEL_41;
    }

    return (char)v3;
  }

  unsigned __int8 v26 = -[NSMutableData writeToURL:options:error:]( v7,  "writeToURL:options:error:",  -[CLConditionLedger ledgerFile](self, "ledgerFile"),  1073741825LL,  &v32);
  if (!v32 && (v26 & 1) != 0)
  {
LABEL_26:
    LOBYTE(v3) = 1;
    return (char)v3;
  }

  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018599D8);
  }
  unsigned __int8 v27 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_ERROR))
  {
    id v28 = -[NSURL path](-[CLConditionLedger ledgerFile](self, "ledgerFile"), "path");
    *(_DWORD *)buf = 68289538;
    int v34 = 0;
    __int16 v35 = 2082;
    v36 = "";
    __int16 v37 = 2114;
    uint64_t v38 = v28;
    __int16 v39 = 2114;
    uint64_t v40 = v32;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:#monitor #Warning unable to write to file, file:%{public, location:escape_only}@, e rror:%{public, location:escape_only}@}",  buf,  0x26u);
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_1018599D8);
    }
  }

  uint64_t v29 = qword_101934978;
  LODWORD(v3) = os_signpost_enabled((os_log_t)qword_101934978);
  if ((_DWORD)v3)
  {
    id v30 = -[NSURL path](-[CLConditionLedger ledgerFile](self, "ledgerFile"), "path");
    *(_DWORD *)buf = 68289538;
    int v34 = 0;
    __int16 v35 = 2082;
    v36 = "";
    __int16 v37 = 2114;
    uint64_t v38 = v30;
    __int16 v39 = 2114;
    uint64_t v40 = v32;
    v18 = "#monitor #Warning unable to write to file";
    uint64_t v19 = "{msg%{public}.0s:#monitor #Warning unable to write to file, file:%{public, location:escape_only}@,"
          " error:%{public, location:escape_only}@}";
    uint32_t v20 = (os_log_s *)v29;
    uint32_t v21 = 38;
    goto LABEL_40;
  }

  return (char)v3;
}

- (void)deleteLedgerFile
{
  uint64_t v5 = 0LL;
  -[NSFileManager removeItemAtURL:error:]( -[CLConditionLedger defaultFileManager](self, "defaultFileManager"),  "removeItemAtURL:error:",  -[CLConditionLedger ledgerFile](self, "ledgerFile"),  &v5);
  if (qword_101934970 != -1) {
    dispatch_once(&qword_101934970, &stru_1018599D8);
  }
  objc_super v3 = (os_log_s *)qword_101934978;
  if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = -[CLConditionLedger ledgerFile](self, "ledgerFile");
    *(_DWORD *)buf = 68289538;
    int v7 = 0;
    __int16 v8 = 2082;
    NSUInteger v9 = "";
    __int16 v10 = 2114;
    int v11 = v4;
    __int16 v12 = 2114;
    uint64_t v13 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#monitor deleting, file:%{public, location:escape_only}@, error:%{public, locatio n:escape_only}@}",  buf,  0x26u);
  }

- (BOOL)addRecordForMonitoring:(id)a3 identifier:(id)a4 persist:(BOOL)a5
{
  BOOL v5 = a5;
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_recordTable, "setObject:forKeyedSubscript:", a3, a4);
  if (v5) {
    return -[CLConditionLedger writeToFile](self, "writeToFile");
  }
  else {
    return 1;
  }
}

- (void)updateRecord:(id)a3 identifier:(id)a4
{
}

- (BOOL)removeRecordFromMonitoringWithIdentifier:(id)a3
{
  return -[CLConditionLedger writeToFile](self, "writeToFile");
}

- (void)updateEvent:(id)a3 forIdentifier:(id)a4
{
}

- (id)monitoringRecordForIdentifier:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_recordTable, "objectForKeyedSubscript:", a3);
}

- (NSDictionary)allMonitoringRecordsByIdentifier
{
  return &self->_recordTable->super;
}

- (NSArray)allMonitoringIdentifiers
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_recordTable, "allKeys");
}

- (NSString)ledgerName
{
  return self->_ledgerName;
}

- (NSNumber)ledgerVersionNumber
{
  return self->_ledgerVersionNumber;
}

- (NSURL)ledgerFile
{
  return self->_ledgerFile;
}

@end