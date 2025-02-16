@interface MATelephonyInfo
+ (id)sharedInstance;
- (BOOL)bootstrapDataServiceAvailableWithError:(id *)a3;
- (BOOL)dualSIMCapable;
- (BOOL)setCellularBootstrapAssertion:(BOOL)a3 withError:(id *)a4;
- (BOOL)setOTAActivationAssertion:(BOOL)a3 withError:(id *)a4;
- (CoreTelephonyClient)telephonyClient;
- (MATelephonyInfo)init;
- (NSError)lastConnectionAvailabilityError;
- (NSError)lastConnectionAvailabilityTwoError;
- (NSError)lastPhoneNumberError;
- (NSError)lastPhoneNumberTwoError;
- (NSError)lastSimStatusError;
- (NSError)lastSimStatusTwoError;
- (NSNumber)connectionAvailability;
- (NSNumber)connectionAvailabilityTwo;
- (NSString)phoneNumber;
- (NSString)phoneNumberTwo;
- (NSString)simStatus;
- (NSString)simStatusTwo;
- (OS_dispatch_queue)queue;
- (id)_copyConnectionAvailabilityWithSlotID:(int64_t)a3 error:(id *)a4;
- (id)_copyPhoneNumberWithSlotID:(int64_t)a3 error:(id *)a4;
- (id)_copySIMStatusWithSlotID:(int64_t)a3 error:(id *)a4;
- (id)copyConnectionAvailabilityWithSlotID:(int64_t)a3 error:(id *)a4;
- (id)copyPhoneNumberWithSlotID:(int64_t)a3 error:(id *)a4;
- (id)copySIMStatusWithSlotID:(int64_t)a3 error:(id *)a4;
- (void)connectionAvailability:(id)a3 availableConnections:(id)a4;
- (void)dealloc;
- (void)otaActivationAssertion;
- (void)phoneNumberChanged:(id)a3;
- (void)setConnectionAvailability:(id)a3;
- (void)setConnectionAvailabilityTwo:(id)a3;
- (void)setDualSIMCapable:(BOOL)a3;
- (void)setLastConnectionAvailabilityError:(id)a3;
- (void)setLastConnectionAvailabilityTwoError:(id)a3;
- (void)setLastPhoneNumberError:(id)a3;
- (void)setLastPhoneNumberTwoError:(id)a3;
- (void)setLastSimStatusError:(id)a3;
- (void)setLastSimStatusTwoError:(id)a3;
- (void)setOtaActivationAssertion:(void *)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setPhoneNumberTwo:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSimStatus:(id)a3;
- (void)setSimStatusTwo:(id)a3;
- (void)setTelephonyClient:(id)a3;
- (void)simStatusDidChange:(id)a3 status:(id)a4;
@end

@implementation MATelephonyInfo

+ (id)sharedInstance
{
  id v2 = a1;
  objc_sync_enter(v2);
  if (!sharedInstance_telephony)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___MATelephonyInfo);
    v4 = (void *)sharedInstance_telephony;
    sharedInstance_telephony = (uint64_t)v3;
  }

  objc_sync_exit(v2);

  return (id)sharedInstance_telephony;
}

- (MATelephonyInfo)init
{
  v45.receiver = self;
  v45.super_class = (Class)&OBJC_CLASS___MATelephonyInfo;
  id v2 = -[MATelephonyInfo init](&v45, "init");
  if (v2)
  {
    v3 = objc_alloc(&OBJC_CLASS___CoreTelephonyClient);
    v4 = dispatch_get_global_queue(0LL, 0LL);
    v5 = -[CoreTelephonyClient initWithQueue:](v3, "initWithQueue:", v4);
    telephonyClient = v2->_telephonyClient;
    v2->_telephonyClient = v5;

    if (v2->_telephonyClient)
    {
      v7 =  dispatch_queue_attr_make_with_autorelease_frequency( &_dispatch_queue_attr_concurrent,  DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v8 = dispatch_queue_create("com.apple.mobileactivationd.dark", v7);
      queue = v2->_queue;
      v2->_queue = (OS_dispatch_queue *)v8;

      if (v2->_queue)
      {
        v10 = (void *)MGCopyAnswer(@"jkr5aFPOh/d6zTzNKYthBw", 0LL);
        id v11 = isNSNumber(v10);

        if (v11)
        {
          v2->_dualSIMCapable = [v10 BOOLValue];
          id v44 = 0LL;
          v12 = -[MATelephonyInfo _copyPhoneNumberWithSlotID:error:](v2, "_copyPhoneNumberWithSlotID:error:", 1LL, &v44);
          v13 = (NSError *)v44;
          phoneNumber = v2->_phoneNumber;
          v2->_phoneNumber = v12;

          lastPhoneNumberError = v2->_lastPhoneNumberError;
          v2->_lastPhoneNumberError = v13;

          if (v2->_dualSIMCapable)
          {
            id v43 = 0LL;
            v16 = -[MATelephonyInfo _copyPhoneNumberWithSlotID:error:]( v2,  "_copyPhoneNumberWithSlotID:error:",  2LL,  &v43);
            v17 = (NSError *)v43;
            phoneNumberTwo = v2->_phoneNumberTwo;
            v2->_phoneNumberTwo = v16;

            lastPhoneNumberTwoError = v2->_lastPhoneNumberTwoError;
            v2->_lastPhoneNumberTwoError = v17;
          }

          id v42 = 0LL;
          v20 = -[MATelephonyInfo _copySIMStatusWithSlotID:error:](v2, "_copySIMStatusWithSlotID:error:", 1LL, &v42);
          v21 = (NSError *)v42;
          simStatus = v2->_simStatus;
          v2->_simStatus = v20;

          lastSimStatusError = v2->_lastSimStatusError;
          v2->_lastSimStatusError = v21;

          if (v2->_dualSIMCapable)
          {
            id v41 = 0LL;
            v24 = -[MATelephonyInfo _copySIMStatusWithSlotID:error:](v2, "_copySIMStatusWithSlotID:error:", 2LL, &v41);
            v25 = (NSError *)v41;
            simStatusTwo = v2->_simStatusTwo;
            v2->_simStatusTwo = v24;

            v27 = v2->_lastSimStatusError;
            v2->_lastSimStatusError = v25;
          }

          id v40 = 0LL;
          v28 = -[MATelephonyInfo _copyConnectionAvailabilityWithSlotID:error:]( v2,  "_copyConnectionAvailabilityWithSlotID:error:",  1LL,  &v40);
          v29 = (NSError *)v40;
          connectionAvailability = v2->_connectionAvailability;
          v2->_connectionAvailability = v28;

          lastConnectionAvailabilityError = v2->_lastConnectionAvailabilityError;
          v2->_lastConnectionAvailabilityError = v29;

          if (v2->_dualSIMCapable)
          {
            id v39 = 0LL;
            v32 = -[MATelephonyInfo _copyConnectionAvailabilityWithSlotID:error:]( v2,  "_copyConnectionAvailabilityWithSlotID:error:",  2LL,  &v39);
            v33 = (NSError *)v39;
            connectionAvailabilityTwo = v2->_connectionAvailabilityTwo;
            v2->_connectionAvailabilityTwo = v32;

            lastConnectionAvailabilityTwoError = v2->_lastConnectionAvailabilityTwoError;
            v2->_lastConnectionAvailabilityTwoError = v33;
          }

          -[CoreTelephonyClient setDelegate:](v2->_telephonyClient, "setDelegate:", v2);

          goto LABEL_12;
        }

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v47 = @"jkr5aFPOh/d6zTzNKYthBw";
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to query '%@'.",  buf,  0xCu);
        }

LABEL_21:
        v36 = 0LL;
        goto LABEL_22;
      }

      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      *(_WORD *)buf = 0;
      v37 = "Failed to create queue.";
    }

    else
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      *(_WORD *)buf = 0;
      v37 = "Failed to create Telephony client.";
    }

    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v37, buf, 2u);
    goto LABEL_21;
  }

- (void)dealloc
{
  otaActivationAssertion = self->_otaActivationAssertion;
  if (otaActivationAssertion) {
    CFRelease(otaActivationAssertion);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MATelephonyInfo;
  -[MATelephonyInfo dealloc](&v4, "dealloc");
}

- (BOOL)setCellularBootstrapAssertion:(BOOL)a3 withError:(id *)a4
{
  BOOL v5 = a3;
  if (objc_opt_class(&OBJC_CLASS___CTCellularPlanManager))
  {
    id v6 = +[CTCellularPlanManager sharedManager](&OBJC_CLASS___CTCellularPlanManager, "sharedManager");
    if (v6)
    {
      v7 = v6;
      id v8 = +[CTCellularPlanManager sharedManager](&OBJC_CLASS___CTCellularPlanManager, "sharedManager");
      [v8 setUserInPurchaseFlow:v5];

      v9 = 0LL;
      BOOL v10 = 1;
      goto LABEL_9;
    }

    MobileActivationError = createMobileActivationError( (uint64_t)"-[MATelephonyInfo setCellularBootstrapAssertion:withError:]",  156LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to query cellular plan manager.");
  }

  else
  {
    MobileActivationError = createMobileActivationError( (uint64_t)"-[MATelephonyInfo setCellularBootstrapAssertion:withError:]",  150LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"CellularPlanManager library is not loaded.");
  }

  v9 = MobileActivationError;
  if (a4)
  {
    v9 = v9;
    BOOL v10 = 0;
    *a4 = v9;
  }

  else
  {
    BOOL v10 = 0;
  }

- (BOOL)setOTAActivationAssertion:(BOOL)a3 withError:(id *)a4
{
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = 0;
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  v16 = __Block_byref_object_copy__6;
  v17 = __Block_byref_object_dispose__6;
  id v18 = 0LL;
  v7 = -[MATelephonyInfo queue](self, "queue");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3254779904LL;
  v11[2] = __55__MATelephonyInfo_setOTAActivationAssertion_withError___block_invoke;
  v11[3] = &__block_descriptor_57_e8_32s40r48r_e5_v8__0l;
  BOOL v12 = a3;
  v11[4] = self;
  v11[5] = &v19;
  v11[6] = &v13;
  dispatch_sync((dispatch_queue_t)v7, v11);

  int v8 = *((unsigned __int8 *)v20 + 24);
  if (a4 && !*((_BYTE *)v20 + 24))
  {
    *a4 = (id) v14[5];
    int v8 = *((unsigned __int8 *)v20 + 24);
  }

  BOOL v9 = v8 != 0;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

void __55__MATelephonyInfo_setOTAActivationAssertion_withError___block_invoke(uint64_t a1)
{
  CFTypeRef cf = 0LL;
  if (!*(_BYTE *)(a1 + 56)) {
    goto LABEL_8;
  }
  if ([*(id *)(a1 + 32) otaActivationAssertion])
  {
LABEL_10:
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    return;
  }

  if (!*(_BYTE *)(a1 + 56))
  {
LABEL_8:
    v7 = *(void **)(a1 + 32);
    CFTypeRef v8 = 0LL;
LABEL_9:
    [v7 setOtaActivationAssertion:v8];
    goto LABEL_10;
  }

  uint64_t v2 = _CTServerConnectionCreate(kCFAllocatorDefault, 0LL, 0LL);
  if (!v2)
  {
    BOOL v9 =  createMobileActivationError( (uint64_t)"-[MATelephonyInfo setOTAActivationAssertion:withError:]_block_invoke",  196LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to connect to CommCenter.");
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    return;
  }

  unint64_t v3 = _CTServerConnectionOTAActivationAssertionCreate(v2, @"MobileActivation", &cf);
  if (!HIDWORD(v3))
  {
    CFTypeRef v8 = cf;
    v7 = *(void **)(a1 + 32);
    goto LABEL_9;
  }

  objc_super v4 =  createMobileActivationError( (uint64_t)"-[MATelephonyInfo setOTAActivationAssertion:withError:]_block_invoke",  202LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to create OTA activation assertion: %d.%d",  v3,  HIDWORD(v3));
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (cf) {
    CFRelease(cf);
  }
}

- (void)setOtaActivationAssertion:(void *)a3
{
  otaActivationAssertion = self->_otaActivationAssertion;
  if (otaActivationAssertion) {
    CFRelease(otaActivationAssertion);
  }
  self->_otaActivationAssertion = a3;
}

- (BOOL)bootstrapDataServiceAvailableWithError:(id *)a3
{
  objc_super v4 = -[MATelephonyInfo telephonyClient](self, "telephonyClient");
  id v10 = 0LL;
  id v5 = -[CoreTelephonyClient usingBootstrapDataService:](v4, "usingBootstrapDataService:", &v10);
  id v6 = (NSError *)v10;

  if (v5)
  {
    unsigned __int8 v7 = [v5 BOOLValue];
    if (!a3) {
      goto LABEL_7;
    }
  }

  else
  {
    CFTypeRef v8 =  createMobileActivationError( (uint64_t)"-[MATelephonyInfo bootstrapDataServiceAvailableWithError:]",  240LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  v6,  @"Failed to query bootstrap data service state.");

    unsigned __int8 v7 = 0;
    id v6 = v8;
    if (!a3) {
      goto LABEL_7;
    }
  }

  if ((v7 & 1) == 0) {
    *a3 = v6;
  }
LABEL_7:

  return v7;
}

- (id)copyPhoneNumberWithSlotID:(int64_t)a3 error:(id *)a4
{
  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = __Block_byref_object_copy__6;
  v26 = __Block_byref_object_dispose__6;
  id v27 = 0LL;
  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  uint64_t v19 = __Block_byref_object_copy__6;
  v20 = __Block_byref_object_dispose__6;
  id v21 = 0LL;
  unsigned __int8 v7 = -[MATelephonyInfo queue](self, "queue");
  dispatch_assert_queue_not_V2((dispatch_queue_t)v7);

  if ((unint64_t)(a3 - 3) > 0xFFFFFFFFFFFFFFFDLL)
  {
    id v11 = -[MATelephonyInfo queue](self, "queue");
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3254779904LL;
    v15[2] = __51__MATelephonyInfo_copyPhoneNumberWithSlotID_error___block_invoke;
    v15[3] = &__block_descriptor_64_e8_32s40r48r_e5_v8__0l;
    v15[4] = self;
    v15[5] = &v16;
    v15[6] = &v22;
    v15[7] = a3;
    dispatch_sync((dispatch_queue_t)v11, v15);
    id v10 = v11;
  }

  else
  {
    CFTypeRef v8 =  createMobileActivationError( (uint64_t)"-[MATelephonyInfo copyPhoneNumberWithSlotID:error:]",  264LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Invalid input.");
    BOOL v9 = (OS_dispatch_queue *)v17[5];
    v17[5] = (uint64_t)v8;
    id v10 = v9;
  }

  BOOL v12 = (void *)v23[5];
  if (a4 && !v12)
  {
    *a4 = (id) v17[5];
    BOOL v12 = (void *)v23[5];
  }

  id v13 = v12;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

void __51__MATelephonyInfo_copyPhoneNumberWithSlotID_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2 == 2)
  {
    id v4 = [*(id *)(a1 + 32) phoneNumberTwo];
    if (v4)
    {
    }

    else
    {
      id v10 = [*(id *)(a1 + 32) lastPhoneNumberTwoError];

      if (v10)
      {
        id v11 = *(void **)(a1 + 32);
        uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8LL);
        id v17 = *(id *)(v12 + 40);
        id v13 = [v11 _copyPhoneNumberWithSlotID:2 error:&v17];
        objc_storeStrong((id *)(v12 + 40), v17);
        [*(id *)(a1 + 32) setPhoneNumberTwo:v13];

        [*(id *)(a1 + 32) setLastPhoneNumberTwoError:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      }
    }

    id v9 = [*(id *)(a1 + 32) phoneNumberTwo];
  }

  else
  {
    if (v2 != 1) {
      return;
    }
    id v3 = [*(id *)(a1 + 32) phoneNumber];
    if (v3)
    {
    }

    else
    {
      id v5 = [*(id *)(a1 + 32) lastPhoneNumberError];

      if (v5)
      {
        id v6 = *(void **)(a1 + 32);
        uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
        id obj = *(id *)(v7 + 40);
        id v8 = [v6 _copyPhoneNumberWithSlotID:1 error:&obj];
        objc_storeStrong((id *)(v7 + 40), obj);
        [*(id *)(a1 + 32) setPhoneNumber:v8];

        [*(id *)(a1 + 32) setLastPhoneNumberError:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      }
    }

    id v9 = [*(id *)(a1 + 32) phoneNumber];
  }

  id v14 = v9;
  uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;
}

- (id)copySIMStatusWithSlotID:(int64_t)a3 error:(id *)a4
{
  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = __Block_byref_object_copy__6;
  v26 = __Block_byref_object_dispose__6;
  id v27 = 0LL;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  uint64_t v19 = __Block_byref_object_copy__6;
  v20 = __Block_byref_object_dispose__6;
  id v21 = 0LL;
  uint64_t v7 = -[MATelephonyInfo queue](self, "queue");
  dispatch_assert_queue_not_V2((dispatch_queue_t)v7);

  if ((unint64_t)(a3 - 3) > 0xFFFFFFFFFFFFFFFDLL)
  {
    id v11 = -[MATelephonyInfo queue](self, "queue");
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3254779904LL;
    v15[2] = __49__MATelephonyInfo_copySIMStatusWithSlotID_error___block_invoke;
    v15[3] = &__block_descriptor_64_e8_32s40r48r_e5_v8__0l;
    v15[4] = self;
    v15[5] = &v16;
    v15[6] = &v22;
    v15[7] = a3;
    dispatch_sync((dispatch_queue_t)v11, v15);
    id v10 = v11;
  }

  else
  {
    id v8 =  createMobileActivationError( (uint64_t)"-[MATelephonyInfo copySIMStatusWithSlotID:error:]",  305LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Invalid input.");
    id v9 = (OS_dispatch_queue *)v17[5];
    v17[5] = (uint64_t)v8;
    id v10 = v9;
  }

  uint64_t v12 = (void *)v23[5];
  if (a4 && !v12)
  {
    *a4 = (id) v17[5];
    uint64_t v12 = (void *)v23[5];
  }

  id v13 = v12;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

void __49__MATelephonyInfo_copySIMStatusWithSlotID_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2 == 2)
  {
    id v4 = [*(id *)(a1 + 32) simStatusTwo];
    if (v4)
    {
    }

    else
    {
      id v10 = [*(id *)(a1 + 32) lastSimStatusTwoError];

      if (v10)
      {
        id v11 = *(void **)(a1 + 32);
        uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8LL);
        id v17 = *(id *)(v12 + 40);
        id v13 = [v11 _copySIMStatusWithSlotID:2 error:&v17];
        objc_storeStrong((id *)(v12 + 40), v17);
        [*(id *)(a1 + 32) setSimStatusTwo:v13];

        [*(id *)(a1 + 32) setLastSimStatusTwoError:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      }
    }

    id v9 = [*(id *)(a1 + 32) simStatusTwo];
  }

  else
  {
    if (v2 != 1) {
      return;
    }
    id v3 = [*(id *)(a1 + 32) simStatus];
    if (v3)
    {
    }

    else
    {
      id v5 = [*(id *)(a1 + 32) lastSimStatusError];

      if (v5)
      {
        id v6 = *(void **)(a1 + 32);
        uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
        id obj = *(id *)(v7 + 40);
        id v8 = [v6 _copySIMStatusWithSlotID:1 error:&obj];
        objc_storeStrong((id *)(v7 + 40), obj);
        [*(id *)(a1 + 32) setSimStatus:v8];

        [*(id *)(a1 + 32) setLastSimStatusError:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      }
    }

    id v9 = [*(id *)(a1 + 32) simStatus];
  }

  id v14 = v9;
  uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;
}

- (id)copyConnectionAvailabilityWithSlotID:(int64_t)a3 error:(id *)a4
{
  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = __Block_byref_object_copy__6;
  v26 = __Block_byref_object_dispose__6;
  id v27 = 0LL;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  uint64_t v19 = __Block_byref_object_copy__6;
  v20 = __Block_byref_object_dispose__6;
  id v21 = 0LL;
  uint64_t v7 = -[MATelephonyInfo queue](self, "queue");
  dispatch_assert_queue_not_V2((dispatch_queue_t)v7);

  if ((unint64_t)(a3 - 3) > 0xFFFFFFFFFFFFFFFDLL)
  {
    id v11 = -[MATelephonyInfo queue](self, "queue");
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3254779904LL;
    v15[2] = __62__MATelephonyInfo_copyConnectionAvailabilityWithSlotID_error___block_invoke;
    v15[3] = &__block_descriptor_64_e8_32s40r48r_e5_v8__0l;
    v15[4] = self;
    v15[5] = &v16;
    v15[6] = &v22;
    v15[7] = a3;
    dispatch_sync((dispatch_queue_t)v11, v15);
    id v10 = v11;
  }

  else
  {
    id v8 =  createMobileActivationError( (uint64_t)"-[MATelephonyInfo copyConnectionAvailabilityWithSlotID:error:]",  346LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Invalid input.");
    id v9 = (OS_dispatch_queue *)v17[5];
    v17[5] = (uint64_t)v8;
    id v10 = v9;
  }

  uint64_t v12 = (void *)v23[5];
  if (a4 && !v12)
  {
    *a4 = (id) v17[5];
    uint64_t v12 = (void *)v23[5];
  }

  id v13 = v12;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

void __62__MATelephonyInfo_copyConnectionAvailabilityWithSlotID_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2 == 2)
  {
    id v4 = [*(id *)(a1 + 32) connectionAvailabilityTwo];
    if (v4)
    {
    }

    else
    {
      id v10 = [*(id *)(a1 + 32) lastConnectionAvailabilityTwoError];

      if (v10)
      {
        id v11 = *(void **)(a1 + 32);
        uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8LL);
        id v17 = *(id *)(v12 + 40);
        id v13 = [v11 _copyConnectionAvailabilityWithSlotID:2 error:&v17];
        objc_storeStrong((id *)(v12 + 40), v17);
        [*(id *)(a1 + 32) setConnectionAvailabilityTwo:v13];

        [*(id *)(a1 + 32) setLastConnectionAvailabilityTwoError:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      }
    }

    id v9 = [*(id *)(a1 + 32) connectionAvailabilityTwo];
  }

  else
  {
    if (v2 != 1) {
      return;
    }
    id v3 = [*(id *)(a1 + 32) connectionAvailability];
    if (v3)
    {
    }

    else
    {
      id v5 = [*(id *)(a1 + 32) lastConnectionAvailabilityError];

      if (v5)
      {
        id v6 = *(void **)(a1 + 32);
        uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
        id obj = *(id *)(v7 + 40);
        id v8 = [v6 _copyConnectionAvailabilityWithSlotID:1 error:&obj];
        objc_storeStrong((id *)(v7 + 40), obj);
        [*(id *)(a1 + 32) setConnectionAvailability:v8];

        [*(id *)(a1 + 32) setLastConnectionAvailabilityError:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      }
    }

    id v9 = [*(id *)(a1 + 32) connectionAvailability];
  }

  id v14 = v9;
  uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;
}

- (id)_copySIMStatusWithSlotID:(int64_t)a3 error:(id *)a4
{
  if ((unint64_t)(a3 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    id v5 =  createMobileActivationError( (uint64_t)"-[MATelephonyInfo _copySIMStatusWithSlotID:error:]",  388LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Invalid input.");
    id v6 = 0LL;
    dispatch_semaphore_t v7 = 0LL;
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }

  dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
  if (!v7)
  {
    id v5 =  createMobileActivationError( (uint64_t)"-[MATelephonyInfo _copySIMStatusWithSlotID:error:]",  394LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to create semaphore.");
    id v6 = 0LL;
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }

  id v6 =  +[CTXPCServiceSubscriptionContext contextWithSlot:]( &OBJC_CLASS___CTXPCServiceSubscriptionContext,  "contextWithSlot:",  a3);
  if (!v6)
  {
    id v5 =  createMobileActivationError( (uint64_t)"-[MATelephonyInfo _copySIMStatusWithSlotID:error:]",  400LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to retrieve context for slot ID %ld.",  a3);
    if (!a4)
    {
LABEL_13:
      id v12 = 0LL;
      goto LABEL_14;
    }

- (id)_copyPhoneNumberWithSlotID:(int64_t)a3 error:(id *)a4
{
  if ((unint64_t)(a3 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    id v5 =  createMobileActivationError( (uint64_t)"-[MATelephonyInfo _copyPhoneNumberWithSlotID:error:]",  429LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Invalid input.");
    id v6 = 0LL;
    dispatch_semaphore_t v7 = 0LL;
    goto LABEL_10;
  }

  dispatch_semaphore_t v7 =  +[CTXPCServiceSubscriptionContext contextWithSlot:]( &OBJC_CLASS___CTXPCServiceSubscriptionContext,  "contextWithSlot:");
  if (!v7)
  {
    id v5 =  createMobileActivationError( (uint64_t)"-[MATelephonyInfo _copyPhoneNumberWithSlotID:error:]",  435LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to retrieve context for slot ID %ld.",  a3);
    id v6 = 0LL;
LABEL_10:
    id v11 = 0LL;
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }

  id v10 = -[MATelephonyInfo telephonyClient](self, "telephonyClient");
  id v15 = 0LL;
  id v11 = -[CoreTelephonyClient getPhoneNumber:error:](v10, "getPhoneNumber:error:", v7, &v15);
  id v5 = (NSError *)v15;

  if (v11)
  {
    if (![v11 isPresent]
      || (id v6 = [v11 number], v6, v6))
    {
      id v6 = [v11 number];
      if (!a4) {
        goto LABEL_13;
      }
      goto LABEL_11;
    }

    id v14 =  createMobileActivationError( (uint64_t)"-[MATelephonyInfo _copyPhoneNumberWithSlotID:error:]",  446LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to retrieve phone number.");
  }

  else
  {
    id v14 =  createMobileActivationError( (uint64_t)"-[MATelephonyInfo _copyPhoneNumberWithSlotID:error:]",  441LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  v5,  @"Failed to retrieve phone number information for subscription context.");

    id v6 = 0LL;
  }

  id v5 = v14;
  if (!a4) {
    goto LABEL_13;
  }
LABEL_11:
  if (!v6) {
    *a4 = v5;
  }
LABEL_13:
  id v12 = v6;

  return v12;
}

- (id)_copyConnectionAvailabilityWithSlotID:(int64_t)a3 error:(id *)a4
{
  if ((unint64_t)(a3 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    id v5 =  createMobileActivationError( (uint64_t)"-[MATelephonyInfo _copyConnectionAvailabilityWithSlotID:error:]",  469LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Invalid input.");
    id v6 = 0LL;
    dispatch_semaphore_t v7 = 0LL;
    goto LABEL_8;
  }

  dispatch_semaphore_t v7 =  +[CTXPCServiceSubscriptionContext contextWithSlot:]( &OBJC_CLASS___CTXPCServiceSubscriptionContext,  "contextWithSlot:");
  if (!v7)
  {
    id v5 =  createMobileActivationError( (uint64_t)"-[MATelephonyInfo _copyConnectionAvailabilityWithSlotID:error:]",  475LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to retrieve context for slot ID %ld.",  a3);
    id v6 = 0LL;
LABEL_8:
    id v11 = 0LL;
    if (!a4) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }

  id v10 = -[MATelephonyInfo telephonyClient](self, "telephonyClient");
  id v14 = 0LL;
  id v6 =  -[CoreTelephonyClient getConnectionAvailability:connectionType:error:]( v10,  "getConnectionAvailability:connectionType:error:",  v7,  9LL,  &v14);
  id v5 = (NSError *)v14;

  if (v6)
  {
    id v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 available]);
    if (!a4) {
      goto LABEL_11;
    }
  }

  else
  {
    id v13 =  createMobileActivationError( (uint64_t)"-[MATelephonyInfo _copyConnectionAvailabilityWithSlotID:error:]",  481LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  v5,  @"Failed to retrieve connection availability for SIM slot id %ld.",  -[CTXPCServiceSubscriptionContext slotID](v7, "slotID"));

    id v6 = 0LL;
    id v11 = 0LL;
    id v5 = v13;
    if (!a4) {
      goto LABEL_11;
    }
  }

- (void)phoneNumberChanged:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v10 = [v4 slotID];
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Phone number changed (%d).",  buf,  8u);
  }

  id v5 = -[MATelephonyInfo queue](self, "queue");
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3254779904LL;
  v7[2] = __38__MATelephonyInfo_phoneNumberChanged___block_invoke;
  v7[3] = &__block_descriptor_48_e8_32s40s_e5_v8__0l;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async((dispatch_queue_t)v5, v7);
}

void __38__MATelephonyInfo_phoneNumberChanged___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) slotID];
  id v6 = 0LL;
  id v4 = [v2 _copyPhoneNumberWithSlotID:v3 error:&v6];
  id v5 = v6;
  if ([*(id *)(a1 + 40) slotID] == (id)1)
  {
    [*(id *)(a1 + 32) setPhoneNumber:v4];
    [*(id *)(a1 + 32) setLastPhoneNumberError:v5];
  }

  else if ([*(id *)(a1 + 40) slotID] == (id)2)
  {
    [*(id *)(a1 + 32) setPhoneNumberTwo:v4];
    [*(id *)(a1 + 32) setLastPhoneNumberTwoError:v5];
  }
}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v16 = [v6 slotID];
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "SIM status changed (%d).",  buf,  8u);
  }

  id v8 = -[MATelephonyInfo queue](self, "queue");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904LL;
  block[2] = __45__MATelephonyInfo_simStatusDidChange_status___block_invoke;
  block[3] = &__block_descriptor_56_e8_32s40s48s_e5_v8__0l;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_async((dispatch_queue_t)v8, block);
}

id __45__MATelephonyInfo_simStatusDidChange_status___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) slotID] == (id)1)
  {
    [*(id *)(a1 + 40) setSimStatus:*(void *)(a1 + 48)];
    return [*(id *)(a1 + 40) setLastSimStatusError:0];
  }

  else
  {
    id result = [*(id *)(a1 + 32) slotID];
    if (result == (id)2)
    {
      [*(id *)(a1 + 40) setSimStatusTwo:*(void *)(a1 + 48)];
      return [*(id *)(a1 + 40) setLastSimStatusTwoError:0];
    }
  }

  return result;
}

- (void)connectionAvailability:(id)a3 availableConnections:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v16 = [v6 slotID];
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Connection availability changed (%d).",  buf,  8u);
  }

  id v8 = -[MATelephonyInfo queue](self, "queue");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904LL;
  block[2] = __63__MATelephonyInfo_connectionAvailability_availableConnections___block_invoke;
  block[3] = &__block_descriptor_56_e8_32s40s48s_e5_v8__0l;
  id v12 = v7;
  id v13 = v6;
  id v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_barrier_async((dispatch_queue_t)v8, block);
}

id __63__MATelephonyInfo_connectionAvailability_availableConnections___block_invoke(id *a1)
{
  id v2 = [a1[4] containsObject:kCTDataConnectionServiceTypeOTAActivation];
  if ([a1[5] slotID] == (id)1)
  {
    id v3 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v2);
    [a1[6] setConnectionAvailability:v3];

    return [a1[6] setLastConnectionAvailabilityError:0];
  }

  else
  {
    id result = [a1[5] slotID];
    if (result == (id)2)
    {
      id v5 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v2);
      [a1[6] setConnectionAvailabilityTwo:v5];

      return [a1[6] setLastConnectionAvailabilityTwoError:0];
    }
  }

  return result;
}

- (BOOL)dualSIMCapable
{
  return self->_dualSIMCapable;
}

- (void)setDualSIMCapable:(BOOL)a3
{
  self->_dualSIMCapable = a3;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSString)phoneNumberTwo
{
  return self->_phoneNumberTwo;
}

- (void)setPhoneNumberTwo:(id)a3
{
}

- (NSString)simStatus
{
  return self->_simStatus;
}

- (void)setSimStatus:(id)a3
{
}

- (NSString)simStatusTwo
{
  return self->_simStatusTwo;
}

- (void)setSimStatusTwo:(id)a3
{
}

- (NSNumber)connectionAvailability
{
  return self->_connectionAvailability;
}

- (void)setConnectionAvailability:(id)a3
{
}

- (NSNumber)connectionAvailabilityTwo
{
  return self->_connectionAvailabilityTwo;
}

- (void)setConnectionAvailabilityTwo:(id)a3
{
}

- (CoreTelephonyClient)telephonyClient
{
  return self->_telephonyClient;
}

- (void)setTelephonyClient:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSError)lastPhoneNumberError
{
  return self->_lastPhoneNumberError;
}

- (void)setLastPhoneNumberError:(id)a3
{
}

- (NSError)lastPhoneNumberTwoError
{
  return self->_lastPhoneNumberTwoError;
}

- (void)setLastPhoneNumberTwoError:(id)a3
{
}

- (NSError)lastSimStatusError
{
  return self->_lastSimStatusError;
}

- (void)setLastSimStatusError:(id)a3
{
}

- (NSError)lastSimStatusTwoError
{
  return self->_lastSimStatusTwoError;
}

- (void)setLastSimStatusTwoError:(id)a3
{
}

- (NSError)lastConnectionAvailabilityError
{
  return self->_lastConnectionAvailabilityError;
}

- (void)setLastConnectionAvailabilityError:(id)a3
{
}

- (NSError)lastConnectionAvailabilityTwoError
{
  return self->_lastConnectionAvailabilityTwoError;
}

- (void)setLastConnectionAvailabilityTwoError:(id)a3
{
}

- (void)otaActivationAssertion
{
  return self->_otaActivationAssertion;
}

- (void).cxx_destruct
{
}

@end