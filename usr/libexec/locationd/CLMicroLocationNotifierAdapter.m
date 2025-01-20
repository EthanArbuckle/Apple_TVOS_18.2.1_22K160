@interface CLMicroLocationNotifierAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetMicroLocationInternalVersion:(id *)a3;
- (CLMicroLocationNotifierAdapter)init;
- (void)_exportMiloData:(BOOL)a3 withUserIdentifier:(id)a4 WithReply:(id)a5;
- (void)adaptee;
- (void)beginService;
- (void)connectToServiceForClient:(id)a3 withServiceIdentifier:(id)a4 withConnectionToken:(id)a5 forUser:(id)a6;
- (void)createServiceForClient:(id)a3 withServiceType:(unint64_t)a4 locationTypes:(id)a5 connectionToken:(id)a6 forUser:(id)a7;
- (void)deleteServiceForClient:(id)a3 withServiceIdentifier:(id)a4 withConnectionToken:(id)a5 forUser:(id)a6;
- (void)disconnectToServiceForClient:(id)a3 withServiceIdentifier:(id)a4 withConnectionToken:(id)a5 forUser:(id)a6;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)donateTruthTagLabelForClient:(id)a3 truthLabelUUID:(id)a4 betweenDate:(id)a5 andDate:(id)a6 withReply:(id)a7;
- (void)donateTruthTagLabelForClient:(id)a3 truthLabelUUID:(id)a4 recordingTriggerUUID:(id)a5 withReply:(id)a6;
- (void)enableMiLoAtCurrentLocationWithServiceIdentifier:(id)a3 withRequestIdentifier:(id)a4 connectionToken:(id)a5;
- (void)endService;
- (void)exportMicroLocationDataForMigrationWithReply:(id)a3;
- (void)exportMicroLocationDataForMigrationWithUserIdentifier:(id)a3 withReply:(id)a4;
- (void)exportMicroLocationDatabaseTablesWithReply:(id)a3;
- (void)purgeAllMicroLocationData;
- (void)purgeMicroLocationSemiSupervisedDataForClient:(id)a3;
- (void)queryMiloConnectionStatus:(id)a3;
- (void)queryServicesForClient:(id)a3 withConnectionToken:(id)a4 forUser:(id)a5;
- (void)registerForMiloPredictionEventUpdates:(id)a3;
- (void)registerForMiloServiceEventUpdatesForClient:(id)a3 withToken:(id)a4;
- (void)requestAnchorValueStatisticsWithReply:(id)a3;
- (void)requestCurrentMicroLocationForClient:(id)a3 withAdditionalInformation:(id)a4;
- (void)requestCurrentMicroLocationForClient:(id)a3 withAdditionalInformation:(id)a4 withReply:(id)a5;
- (void)requestExportMiLoDatabaseTablesFromClient:(id)a3 withRequestIdentifier:(id)a4 connectionToken:(id)a5;
- (void)requestLabelObservationsForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5 withPlaceIdentifier:(id)a6 betweenStartDate:(id)a7 endDate:(id)a8 withConnectionToken:(id)a9;
- (void)requestLabelSingleObservationForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5 withPlaceIdentifier:(id)a6 withObservationRequestIdentifier:(id)a7 withConnectionToken:(id)a8;
- (void)requestMicroLocationLearningForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5;
- (void)requestMicroLocationLearningForClient_Legacy:(id)a3 withReply:(id)a4;
- (void)requestMicroLocationRecordingScanForClient:(id)a3 withAdditionalInformation:(id)a4 withReply:(id)a5;
- (void)requestObservationForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5 withPlaceIdentifier:(id)a6 withConnectionToken:(id)a7;
- (void)requestPurgeAllMiLoDataFromClient:(id)a3 withRequestIdentifier:(id)a4;
- (void)requestRemoveCustomLoiWithServiceIdentifier:(id)a3 withRequestIdentifier:(id)a4 withLoiIdentifier:(id)a5 withConnectionToken:(id)a6;
- (void)requestRemoveLabelsForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5 withLabels:(id)a6 withConnectionToken:(id)a7;
- (void)requestSingleShotMiLoPredictionForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5 withConnectionToken:(id)a6;
- (void)requestStartUpdatingMicroLocationForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5 withConfiguration:(id)a6 withConnectionToken:(id)a7;
- (void)requestStopUpdatingMicroLocationForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5 withConnectionToken:(id)a6;
- (void)unregisterForMiloPredictionEventUpdates:(id)a3;
- (void)unregisterForMiloServiceEventUpdatesForClient:(id)a3 withToken:(id)a4;
@end

@implementation CLMicroLocationNotifierAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199ACA8 != -1) {
    dispatch_once(&qword_10199ACA8, &stru_101874570);
  }
  return (id)qword_10199ACA0;
}

- (CLMicroLocationNotifierAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLMicroLocationNotifierAdapter;
  return -[CLMicroLocationNotifierAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLMicroLocationNotifierProtocol,  &OBJC_PROTOCOL___CLMicroLocationNotifierClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
  {
    uint64_t v3 = sub_101261FA0();
    sub_100B936B8(v3);
  }

- (void)endService
{
  v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v2->var0 + 2))(v2);
}

- (void)adaptee
{
  result = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (result) {
  return result;
  }
}

- (void)doAsync:(id)a3
{
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (void)registerForMiloServiceEventUpdatesForClient:(id)a3 withToken:(id)a4
{
}

- (void)unregisterForMiloServiceEventUpdatesForClient:(id)a3 withToken:(id)a4
{
  unint64_t v5 = -[CLMicroLocationNotifierAdapter adaptee](self, "adaptee", a3);
  sub_100B93BD8((uint64_t)v5, v6, a4);
}

- (void)registerForMiloPredictionEventUpdates:(id)a3
{
}

- (void)unregisterForMiloPredictionEventUpdates:(id)a3
{
}

- (void)createServiceForClient:(id)a3 withServiceType:(unint64_t)a4 locationTypes:(id)a5 connectionToken:(id)a6 forUser:(id)a7
{
  if (v13 < 0) {
    operator delete(__p[0]);
  }
}

- (void)deleteServiceForClient:(id)a3 withServiceIdentifier:(id)a4 withConnectionToken:(id)a5 forUser:(id)a6
{
  if (v11 < 0) {
    operator delete(__p[0]);
  }
}

- (void)queryServicesForClient:(id)a3 withConnectionToken:(id)a4 forUser:(id)a5
{
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  if (v11 < 0) {
    operator delete(v10[0]);
  }
}

- (void)connectToServiceForClient:(id)a3 withServiceIdentifier:(id)a4 withConnectionToken:(id)a5 forUser:(id)a6
{
  if (v11 < 0) {
    operator delete(__p[0]);
  }
}

- (void)disconnectToServiceForClient:(id)a3 withServiceIdentifier:(id)a4 withConnectionToken:(id)a5 forUser:(id)a6
{
  if (v11 < 0) {
    operator delete(__p[0]);
  }
}

- (void)requestSingleShotMiLoPredictionForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5 withConnectionToken:(id)a6
{
}

- (void)requestObservationForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5 withPlaceIdentifier:(id)a6 withConnectionToken:(id)a7
{
}

- (void)requestLabelSingleObservationForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5 withPlaceIdentifier:(id)a6 withObservationRequestIdentifier:(id)a7 withConnectionToken:(id)a8
{
  std::string v14 = -[CLMicroLocationNotifierAdapter adaptee](self, "adaptee");
  sub_100B96468((uint64_t)v14, v15, a4, a5, a6, a7, (uint64_t)a8);
  if (v17 < 0) {
    operator delete(__p);
  }
}

- (void)requestLabelObservationsForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5 withPlaceIdentifier:(id)a6 betweenStartDate:(id)a7 endDate:(id)a8 withConnectionToken:(id)a9
{
  uint64_t v15 = -[CLMicroLocationNotifierAdapter adaptee](self, "adaptee");
  sub_100B9662C((uint64_t)v15, v16, a4, a5, a6, (uint64_t)a7, (uint64_t)a8, (uint64_t)a9);
  if (v18 < 0) {
    operator delete(__p);
  }
}

- (void)requestRemoveLabelsForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5 withLabels:(id)a6 withConnectionToken:(id)a7
{
  if (v13 < 0) {
    operator delete(__p[0]);
  }
}

- (void)requestRemoveCustomLoiWithServiceIdentifier:(id)a3 withRequestIdentifier:(id)a4 withLoiIdentifier:(id)a5 withConnectionToken:(id)a6
{
}

- (void)requestStartUpdatingMicroLocationForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5 withConfiguration:(id)a6 withConnectionToken:(id)a7
{
}

- (void)requestStopUpdatingMicroLocationForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5 withConnectionToken:(id)a6
{
}

- (void)requestMicroLocationLearningForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5
{
  if (qword_1019348D0 != -1) {
    dispatch_once(&qword_1019348D0, &stru_101874AF8);
  }
  char v9 = (os_log_s *)qword_1019348D8;
  if (os_log_type_enabled((os_log_t)qword_1019348D8, OS_LOG_TYPE_DEFAULT))
  {
    std::string __p = (void *)68289026;
    __int16 v12 = 2082;
    char v13 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:MicroLocation adapter requestMicroLocationLearningForClient}",  (uint8_t *)&__p,  0x12u);
  }

  v10 = -[CLMicroLocationNotifierAdapter adaptee](self, "adaptee");
  sub_1010DDBC0(&__p, (char *)[a3 UTF8String]);
  sub_100B974E0((uint64_t)v10, (uint64_t)&__p, a4, a5);
  if (v14 < 0) {
    operator delete(__p);
  }
}

- (void)requestPurgeAllMiLoDataFromClient:(id)a3 withRequestIdentifier:(id)a4
{
  if (qword_1019348D0 != -1) {
    dispatch_once(&qword_1019348D0, &stru_101874AF8);
  }
  v7 = (os_log_s *)qword_1019348D8;
  if (os_log_type_enabled((os_log_t)qword_1019348D8, OS_LOG_TYPE_DEFAULT))
  {
    std::string __p = (void *)68289026;
    __int16 v11 = 2082;
    __int16 v12 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:MicroLocation adapter requestPurgeAllMiLoData}",  (uint8_t *)&__p,  0x12u);
  }

  v8 = -[CLMicroLocationNotifierAdapter adaptee](self, "adaptee");
  sub_1010DDBC0(&__p, (char *)[a3 UTF8String]);
  sub_100B976D8((uint64_t)v8, v9, a4);
  if (v13 < 0) {
    operator delete(__p);
  }
}

- (void)requestExportMiLoDatabaseTablesFromClient:(id)a3 withRequestIdentifier:(id)a4 connectionToken:(id)a5
{
  if (qword_1019348D0 != -1) {
    dispatch_once(&qword_1019348D0, &stru_101874AF8);
  }
  uint64_t v9 = (os_log_s *)qword_1019348D8;
  if (os_log_type_enabled((os_log_t)qword_1019348D8, OS_LOG_TYPE_DEFAULT))
  {
    std::string __p = (void *)68289026;
    __int16 v13 = 2082;
    char v14 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:MicroLocation adapter requestExportMiLoDatabaseTablesFromClient}",  (uint8_t *)&__p,  0x12u);
  }

  v10 = -[CLMicroLocationNotifierAdapter adaptee](self, "adaptee");
  sub_1010DDBC0(&__p, (char *)[a3 UTF8String]);
  sub_100B978A8((uint64_t)v10, v11, a4, (uint64_t)a5);
  if (v15 < 0) {
    operator delete(__p);
  }
}

- (void)queryMiloConnectionStatus:(id)a3
{
  v4 = -[CLMicroLocationNotifierAdapter adaptee](self, "adaptee");
  BOOL v5 = sub_100031790((uint64_t)v4 + 248);
  sub_100BA1C08((uint64_t)v4, v5, a3);
}

- (void)enableMiLoAtCurrentLocationWithServiceIdentifier:(id)a3 withRequestIdentifier:(id)a4 connectionToken:(id)a5
{
}

- (void)requestCurrentMicroLocationForClient:(id)a3 withAdditionalInformation:(id)a4
{
}

- (void)requestCurrentMicroLocationForClient:(id)a3 withAdditionalInformation:(id)a4 withReply:(id)a5
{
}

- (void)requestMicroLocationRecordingScanForClient:(id)a3 withAdditionalInformation:(id)a4 withReply:(id)a5
{
  if (v9 < 0) {
    operator delete(__p[0]);
  }
}

- (BOOL)syncgetMicroLocationInternalVersion:(id *)a3
{
  if (qword_1019348D0 != -1) {
    dispatch_once(&qword_1019348D0, &stru_101874AF8);
  }
  v4 = (os_log_s *)qword_1019348D8;
  if (os_log_type_enabled((os_log_t)qword_1019348D8, OS_LOG_TYPE_DEFAULT))
  {
    p_p = &__p;
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)buf = 68289282;
    int v10 = 0;
    __int16 v11 = 2082;
    __int16 v12 = "";
    __int16 v13 = 2082;
    char v14 = p_p;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:MicroLocation Internal Version request, version:%{public, location:escape_only}s}",  buf,  0x1Cu);
  }

  if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint64_t v6 = &__p;
  }
  else {
    uint64_t v6 = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  *a3 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v6);
  return 1;
}

- (void)_exportMiloData:(BOOL)a3 withUserIdentifier:(id)a4 WithReply:(id)a5
{
  BOOL v6 = a3;
  sub_1010DDBC0(__p, (char *)[a4 UTF8String]);
  sub_100B98A40((uint64_t)-[CLMicroLocationNotifierAdapter adaptee](self, "adaptee"), (uint64_t)__p, v6, v15);
  if (v21)
  {
    if (qword_1019348D0 != -1) {
      dispatch_once(&qword_1019348D0, &stru_101874AF8);
    }
    v8 = (os_log_s *)qword_1019348D8;
    if (os_log_type_enabled((os_log_t)qword_1019348D8, OS_LOG_TYPE_DEFAULT))
    {
      char v9 = v15;
      if (v16 < 0) {
        char v9 = *(char **)v15;
      }
      uint64_t buf = 68289282LL;
      __int16 v29 = 2082;
      v30 = "";
      __int16 v31 = 2082;
      v32 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:MicroLocation DB Tables exported, path:%{public, location:escape_only}s}",  (uint8_t *)&buf,  0x1Cu);
    }

    v26[0] = @"FileName";
    if (v18 >= 0) {
      int v10 = &v17;
    }
    else {
      int v10 = v17;
    }
    v27[0] = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v10);
    v26[1] = @"ExportDir";
    if (v16 >= 0) {
      __int16 v11 = v15;
    }
    else {
      __int16 v11 = *(char **)v15;
    }
    v27[1] = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v11);
    v26[2] = @"SandboxExt";
    if (v20 >= 0) {
      __int16 v12 = &v19;
    }
    else {
      __int16 v12 = v19;
    }
    v27[2] = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v12);
    (*((void (**)(id, void, NSDictionary *))a5 + 2))( a5,  0LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  3LL));
  }

  else
  {
    if (qword_1019348D0 != -1) {
      dispatch_once(&qword_1019348D0, &stru_101874AF8);
    }
    __int16 v13 = (os_log_s *)qword_1019348D8;
    if (os_log_type_enabled((os_log_t)qword_1019348D8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t buf = 68289026LL;
      __int16 v29 = 2082;
      v30 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:MicroLocation DB Tables not exported}",  (uint8_t *)&buf,  0x12u);
    }

    NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
    v25 = @"exportMicroLocationDatabaseTables failed internally.";
    char v14 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL);
    (*((void (**)(id, NSError *, void))a5 + 2))( a5,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kCLErrorDomainPrivate,  5LL,  v14),  0LL);
  }

  sub_100BA6898((uint64_t)v15);
  if (v23 < 0) {
    operator delete(__p[0]);
  }
}

- (void)exportMicroLocationDatabaseTablesWithReply:(id)a3
{
}

- (void)exportMicroLocationDataForMigrationWithReply:(id)a3
{
}

- (void)exportMicroLocationDataForMigrationWithUserIdentifier:(id)a3 withReply:(id)a4
{
}

- (void)requestAnchorValueStatisticsWithReply:(id)a3
{
  if (v26)
  {
    if (qword_1019348D0 != -1) {
      dispatch_once(&qword_1019348D0, &stru_101874AF8);
    }
    v4 = (os_log_s *)qword_1019348D8;
    if (os_log_type_enabled((os_log_t)qword_1019348D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v31 = 2082;
      v32 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:anchor statistics map retrieved}",  buf,  0x12u);
    }

    BOOL v5 = +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  10 * v25);
    char v21 = (void (**)(id, void, NSMutableDictionary *))a3;
    BOOL v6 = v24;
    if (v24)
    {
      do
      {
        v22 = v6;
        v7 = (uint64_t *)v6[6];
        if (v7)
        {
          v8 = v6 + 2;
          do
          {
            char v9 = sub_10004ACA4(v23, v8);
            double v12 = *((double *)v11 + 6);
            __int16 v13 = sub_10004ACA4(v23, v8);
            double v15 = *((double *)v14 + 5);
            sub_1001035A8((uint64_t)v8, (uint64_t)buf);
            if (v33 >= 0) {
              char v16 = buf;
            }
            else {
              char v16 = *(uint8_t **)buf;
            }
            char v17 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v16, v21);
            char v18 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v10);
            if (!-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v18)) {
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  10LL),  v18);
            }
            v29[0] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v15);
            v29[1] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v12);
            objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v18),  "setObject:forKeyedSubscript:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 2),  v17);
            if (v33 < 0) {
              operator delete(*(void **)buf);
            }
            v7 = (uint64_t *)*v7;
          }

          while (v7);
        }

        BOOL v6 = (void *)*v22;
      }

      while (*v22);
    }

    v21[2](v21, 0LL, v5);
  }

  else
  {
    if (qword_1019348D0 != -1) {
      dispatch_once(&qword_1019348D0, &stru_101874AF8);
    }
    v19 = (os_log_s *)qword_1019348D8;
    if (os_log_type_enabled((os_log_t)qword_1019348D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v31 = 2082;
      v32 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:retrieving anchor statistics map failed}",  buf,  0x12u);
    }

    NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
    v28 = @"retriving anchor statistics map failed internally.";
    char v20 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL);
    (*((void (**)(id, NSError *, void))a3 + 2))( a3,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kCLErrorDomainPrivate,  5LL,  v20),  0LL);
  }

  if (v26) {
    sub_1000A8728((uint64_t)v23);
  }
}

- (void)requestMicroLocationLearningForClient_Legacy:(id)a3 withReply:(id)a4
{
  if (v7 < 0) {
    operator delete(__p[0]);
  }
}

- (void)donateTruthTagLabelForClient:(id)a3 truthLabelUUID:(id)a4 recordingTriggerUUID:(id)a5 withReply:(id)a6
{
  char v10 = sub_100B9A7F8((uint64_t)-[CLMicroLocationNotifierAdapter adaptee](self, "adaptee"), (uint64_t)__p, a4, a5);
  if (a6)
  {
    if ((v10 & 1) != 0)
    {
      __int16 v11 = 0LL;
    }

    else
    {
      double v12 = objc_alloc(&OBJC_CLASS___NSError);
      NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
      char v17 = @"donateTruthTagLabelForClient failed internally";
      __int16 v13 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL);
      __int16 v11 =  -[NSError initWithDomain:code:userInfo:]( v12,  "initWithDomain:code:userInfo:",  kCLErrorDomainPrivate,  5LL,  v13);
    }

    (*((void (**)(id, NSError *))a6 + 2))(a6, v11);
  }

  if (v15 < 0) {
    operator delete(__p[0]);
  }
}

- (void)donateTruthTagLabelForClient:(id)a3 truthLabelUUID:(id)a4 betweenDate:(id)a5 andDate:(id)a6 withReply:(id)a7
{
  char v12 = sub_100B9AAF4( (uint64_t)-[CLMicroLocationNotifierAdapter adaptee](self, "adaptee"),  (uint64_t *)__p,  a4,  (uint64_t)a5,  (uint64_t)a6);
  if (a7)
  {
    if ((v12 & 1) != 0)
    {
      __int16 v13 = 0LL;
    }

    else
    {
      char v14 = objc_alloc(&OBJC_CLASS___NSError);
      NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
      v19 = @"donateTruthTagLabelForClient failed internally";
      char v15 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL);
      __int16 v13 =  -[NSError initWithDomain:code:userInfo:]( v14,  "initWithDomain:code:userInfo:",  kCLErrorDomainPrivate,  5LL,  v15);
    }

    (*((void (**)(id, NSError *))a7 + 2))(a7, v13);
  }

  if (v17 < 0) {
    operator delete(__p[0]);
  }
}

- (void)purgeMicroLocationSemiSupervisedDataForClient:(id)a3
{
  if (v5 < 0) {
    operator delete(__p[0]);
  }
}

- (void)purgeAllMicroLocationData
{
  v2 = -[CLMicroLocationNotifierAdapter adaptee](self, "adaptee");
  sub_10012B308((uint64_t)v2 + 584);
  sub_100BA2A38((uint64_t)v2);
}

@end