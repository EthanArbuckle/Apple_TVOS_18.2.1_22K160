@interface SMCSensorExchangeHelper
+ (id)sharedInstance;
- (SMCSensorExchangeHelper)init;
- (void)updateCLTMChargingPolicy:(unint64_t)a3;
- (void)updateSMCDebugKey:(id)a3 withState:(BOOL)a4;
@end

@implementation SMCSensorExchangeHelper

+ (id)sharedInstance
{
  if (qword_10001B748 != -1) {
    dispatch_once(&qword_10001B748, &stru_100014728);
  }
  return (id)qword_10001B750;
}

- (SMCSensorExchangeHelper)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SMCSensorExchangeHelper;
  v2 = -[SMCSensorExchangeHelper init](&v6, "init");
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.powerexperienced", "smcsensorexchange");
    v4 = (void *)qword_10001B758;
    qword_10001B758 = (uint64_t)v3;

    LODWORD(xmmword_10001B7C0) = 258;
  }

  return v2;
}

- (void)updateCLTMChargingPolicy:(unint64_t)a3
{
  v4 = (void *)qword_10001B758;
  if (os_log_type_enabled((os_log_t)qword_10001B758, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    int v16 = 138412290;
    v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Updating CLTM with charging policy: slow: %@",  (uint8_t *)&v16,  0xCu);
  }

  *((float *)&xmmword_10001B7C0 + 1) = (float)a3;
  uint64_t v7 = sub_100009BE8();
  if ((_DWORD)v7)
  {
    uint64_t v8 = v7;
    v9 = (os_log_s *)qword_10001B758;
    if (os_log_type_enabled((os_log_t)qword_10001B758, OS_LOG_TYPE_ERROR)) {
      sub_10000D6D8(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }

  ++BYTE2(xmmword_10001B7C0);
}

- (void)updateSMCDebugKey:(id)a3 withState:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  objc_super v6 = (os_log_s *)qword_10001B758;
  if (os_log_type_enabled((os_log_t)qword_10001B758, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412546;
    id v22 = v5;
    __int16 v23 = 1024;
    BOOL v24 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Updating SMC with debug mode %@:%d",  (uint8_t *)&v21,  0x12u);
  }

  LODWORD(v7) = 0;
  if (v4)
  {
    unsigned __int8 v8 = objc_msgSend(v5, "isEqualToString:", @"RestrictedPerfMode", v7);
    LODWORD(v7) = 1.0;
    if ((v8 & 1) == 0)
    {
      unsigned __int8 v9 = objc_msgSend(v5, "isEqualToString:", @"InUseChargingMode", v7);
      LODWORD(v7) = 2.0;
      if ((v9 & 1) == 0)
      {
        unsigned __int8 v10 = objc_msgSend(v5, "isEqualToString:", @"AcceleratedChargingMode", v7);
        LODWORD(v7) = 3.0;
        if ((v10 & 1) == 0)
        {
          unsigned int v11 = objc_msgSend(v5, "isEqualToString:", @"LongChargingMode", v7);
          LODWORD(v7) = 0;
          if (v11) {
            *(float *)&double v7 = 4.0;
          }
        }
      }
    }
  }

  DWORD2(xmmword_10001B7C0) = LODWORD(v7);
  uint64_t v12 = sub_100009BE8();
  if ((_DWORD)v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = (os_log_s *)qword_10001B758;
    if (os_log_type_enabled((os_log_t)qword_10001B758, OS_LOG_TYPE_ERROR)) {
      sub_10000D6D8(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }

  ++BYTE2(xmmword_10001B7C0);
}

@end