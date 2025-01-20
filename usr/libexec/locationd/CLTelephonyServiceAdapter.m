@interface CLTelephonyServiceAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetActiveCall:(BOOL *)a3;
- (BOOL)syncgetCampOnlyState;
- (BOOL)syncgetCopyServingOperator:(id *)a3;
- (BOOL)syncgetCopyServingProvider:(id *)a3;
- (BOOL)syncgetCopyServingProviderFromCarrierBundle:(id *)a3;
- (BOOL)syncgetDetectedCells:(void *)a3;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetIsRegisteredOnCell;
- (BOOL)syncgetRefreshCellMonitor;
- (BOOL)syncgetRefreshCellMonitorForSim:(int)a3;
- (BOOL)syncgetServingCells:(void *)a3 addNeighborCells:(BOOL)a4;
- (BOOL)syncgetServingGsmCell:(Cell *)a3;
- (BOOL)syncgetSignalStrength:(int *)a3;
- (BOOL)syncgetUplinkFrequency:(float *)a3 andBandwidth:(float *)a4;
- (CLTelephonyServiceAdapter)init;
- (id)syncgetCopyServingOperatorForSim:(int)a3;
- (id)syncgetCopyServingProviderFromCarrierBundleForSim:(int)a3;
- (id)syncgetRegistrationInfoDictionary;
- (int)syncgetCellTransmitStatus;
- (int)syncgetRadioAccessTechnology;
- (int)syncgetRadioAccessTechnologyForSim:(int)a3;
- (int)syncgetRegistrationStatus;
- (int)syncgetRegistrationStatusForSim:(int)a3;
- (int)syncgetSignalStrengthForSim:(int)a3;
- (void)adaptee;
- (void)assertCommCenter:(int)a3 with:(int)a4;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)dumpLogWithReason:(id)a3;
- (void)endService;
- (void)fetchActiveOrHeldWithReply:(id)a3;
- (void)fetchIsCellAvailableWithReply:(id)a3;
- (void)requestCamping:(BOOL)a3;
- (void)resetModemWithReason:(id)a3;
@end

@implementation CLTelephonyServiceAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101994298 != -1) {
    dispatch_once(&qword_101994298, &stru_101832B30);
  }
  return (id)qword_101994290;
}

- (CLTelephonyServiceAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLTelephonyServiceAdapter;
  return -[CLTelephonyServiceAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLTelephonyServiceProtocol,  &OBJC_PROTOCOL___CLTelephonyServiceClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier")) {
    sub_101234FF0();
  }
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

- (void)fetchIsCellAvailableWithReply:(id)a3
{
  v4 = -[CLTelephonyServiceAdapter adaptee](self, "adaptee");
  uint64_t v5 = (*(uint64_t (**)(void *))(*(void *)v4 + 216LL))(v4);
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v5);
}

- (void)fetchActiveOrHeldWithReply:(id)a3
{
  BOOL v6 = 0;
  BOOL v4 = sub_10031D060((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee"), &v6);
  BOOL v5 = v6 && v4;
  (*((void (**)(id, BOOL))a3 + 2))(a3, v5);
}

- (void)requestCamping:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = *((void *)-[CLTelephonyServiceAdapter adaptee](self, "adaptee") + 18);
  if (v4) {
    BOOL v5 = _CTServerConnectionSetCampOnlyMode(v4, v3) == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_101832D38);
  }
  BOOL v6 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289538;
    v7[1] = 0;
    __int16 v8 = 2082;
    v9 = "";
    __int16 v10 = 1026;
    BOOL v11 = v3;
    __int16 v12 = 1026;
    BOOL v13 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#camp request, campRequest:%{public}hhd, success:%{public}hhd}",  (uint8_t *)v7,  0x1Eu);
  }

- (BOOL)syncgetCampOnlyState
{
  return sub_10031D52C((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee"));
}

- (void)assertCommCenter:(int)a3 with:(int)a4
{
}

- (BOOL)syncgetUplinkFrequency:(float *)a3 andBandwidth:(float *)a4
{
  BOOL v6 = -[CLTelephonyServiceAdapter adaptee](self, "adaptee");
  *a3 = v6[41];
  *a4 = v6[42];
  return 1;
}

- (id)syncgetRegistrationInfoDictionary
{
  return (id)sub_10031DB54((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee"));
}

- (BOOL)syncgetDetectedCells:(void *)a3
{
  return sub_10031DD68((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee"), (uint64_t *)a3);
}

- (BOOL)syncgetIsRegisteredOnCell
{
  v2 = -[CLTelephonyServiceAdapter adaptee](self, "adaptee");
  return (*(uint64_t (**)(void *))(*(void *)v2 + 216LL))(v2);
}

- (int)syncgetRadioAccessTechnology
{
  return sub_10031ED80((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee"));
}

- (int)syncgetRadioAccessTechnologyForSim:(int)a3
{
  return 11;
}

- (int)syncgetRegistrationStatus
{
  return sub_10031EDE4((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee"));
}

- (int)syncgetRegistrationStatusForSim:(int)a3
{
  return 0;
}

- (int)syncgetCellTransmitStatus
{
  return *((_DWORD *)-[CLTelephonyServiceAdapter adaptee](self, "adaptee") + 34);
}

- (BOOL)syncgetActiveCall:(BOOL *)a3
{
  BOOL v5 = 0;
  BOOL result = sub_10031D060((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee"), &v5);
  *a3 = v5;
  return result;
}

- (BOOL)syncgetRefreshCellMonitor
{
  return 1;
}

- (BOOL)syncgetRefreshCellMonitorForSim:(int)a3
{
  return 1;
}

- (BOOL)syncgetCopyServingOperator:(id *)a3
{
  BOOL v4 = sub_10031EF84((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee"), &__p);
  BOOL v5 = objc_alloc(&OBJC_CLASS___NSString);
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  *a3 = -[NSString initWithUTF8String:](v5, "initWithUTF8String:", p_p);
  return v4;
}

- (id)syncgetCopyServingOperatorForSim:(int)a3
{
  return 0LL;
}

- (BOOL)syncgetCopyServingProvider:(id *)a3
{
  BOOL v4 = sub_10031EF84((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee"), &__p);
  BOOL v5 = objc_alloc(&OBJC_CLASS___NSString);
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  *a3 = -[NSString initWithUTF8String:](v5, "initWithUTF8String:", p_p);
  return v4;
}

- (BOOL)syncgetCopyServingProviderFromCarrierBundle:(id *)a3
{
  BOOL v4 = sub_10031F46C((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee"), &__p);
  BOOL v5 = objc_alloc(&OBJC_CLASS___NSString);
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  *a3 = -[NSString initWithUTF8String:](v5, "initWithUTF8String:", p_p);
  return v4;
}

- (id)syncgetCopyServingProviderFromCarrierBundleForSim:(int)a3
{
  return 0LL;
}

- (BOOL)syncgetSignalStrength:(int *)a3
{
  return sub_10031F850((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee"), (uint64_t)a3);
}

- (int)syncgetSignalStrengthForSim:(int)a3
{
  return 0;
}

- (void)resetModemWithReason:(id)a3
{
  BOOL v4 = sub_10031FDCC( (uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee"),  (char *)[a3 UTF8String]);
  if (qword_101934830 != -1) {
    dispatch_once(&qword_101934830, &stru_101832D58);
  }
  BOOL v5 = (os_log_s *)qword_101934838;
  if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_FAULT))
  {
    int v8 = 68289539;
    int v9 = 0;
    __int16 v10 = 2082;
    BOOL v11 = "";
    __int16 v12 = 1026;
    BOOL v13 = v4;
    __int16 v14 = 2081;
    id v15 = [a3 UTF8String];
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:attempt to reset modem, success:%{public}hhd, reason:%{private, location:escape_only}s}",  (uint8_t *)&v8,  0x22u);
    if (qword_101934830 != -1) {
      dispatch_once(&qword_101934830, &stru_101832D58);
    }
  }

  BOOL v6 = (os_log_s *)qword_101934838;
  if (os_signpost_enabled((os_log_t)qword_101934838))
  {
    id v7 = [a3 UTF8String];
    int v8 = 68289539;
    int v9 = 0;
    __int16 v10 = 2082;
    BOOL v11 = "";
    __int16 v12 = 1026;
    BOOL v13 = v4;
    __int16 v14 = 2081;
    id v15 = v7;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v6,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "attempt to reset modem",  "{msg%{public}.0s:attempt to reset modem, success:%{public}hhd, reason:%{private, location:escape_only}s}",  (uint8_t *)&v8,  0x22u);
  }

- (void)dumpLogWithReason:(id)a3
{
}

- (BOOL)syncgetServingCells:(void *)a3 addNeighborCells:(BOOL)a4
{
  return sub_100320580((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee"), (uint64_t *)a3, a4);
}

- (BOOL)syncgetServingGsmCell:(Cell *)a3
{
  return sub_100320748((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee"), (uint64_t)a3);
}

+ (BOOL)isSupported
{
  return 1;
}

@end