@interface IDSDeviceCertificationRepair
- (BOOL)_missingDeviceIdentity:(BOOL *)a3;
- (IDSDeviceCertificationRepair)init;
- (IDSDeviceCertificationRepairDelegate)delegate;
- (IMDispatchTimer)repairTimer;
- (void)recertifyDeviceIfNeeded;
- (void)setDelegate:(id)a3;
- (void)setRepairTimer:(id)a3;
@end

@implementation IDSDeviceCertificationRepair

- (IDSDeviceCertificationRepair)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___IDSDeviceCertificationRepair;
  v2 = -[IDSDeviceCertificationRepair init](&v13, "init");
  if (v2)
  {
    v3 = objc_alloc(&OBJC_CLASS___IMDispatchTimer);
    uint64_t v5 = im_primary_queue(v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1003CFF14;
    v11[3] = &unk_1008F8088;
    v7 = v2;
    v12 = v7;
    v8 = -[IMDispatchTimer initWithQueue:interval:repeats:handlerBlock:]( v3,  "initWithQueue:interval:repeats:handlerBlock:",  v6,  604800LL,  1LL,  v11);
    repairTimer = v7->_repairTimer;
    v7->_repairTimer = v8;
  }

  return v2;
}

- (void)recertifyDeviceIfNeeded
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
  unsigned int v4 = [v3 isUnderFirstDataProtectionLock];

  if (v4)
  {
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "Under first lock, not re-certifying device";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
      goto LABEL_17;
    }

    goto LABEL_17;
  }

  if (+[IDSRegistrationController isBuddyBlockingRegistration]( &OBJC_CLASS___IDSRegistrationController,  "isBuddyBlockingRegistration"))
  {
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v20 = 0x402E000000000000LL;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Device is not setup, trying to re-certify in %f seconds",  buf,  0xCu);
    }

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1003D020C;
    v18[3] = &unk_1008F6010;
    v18[4] = self;
    double v8 = 15.0;
    v9 = v18;
LABEL_13:
    im_dispatch_after_primary_queue(v9, v8);
    return;
  }

  unsigned __int8 v17 = 0;
  if (!-[IDSDeviceCertificationRepair _missingDeviceIdentity:](self, "_missingDeviceIdentity:", &v17))
  {
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "Identity present, not re-certifying";
      goto LABEL_16;
    }

- (BOOL)_missingDeviceIdentity:(BOOL *)a3
{
  if (a3) {
    *a3 = 0;
  }
  *(void *)buf = 0LL;
  unsigned int v4 = (__SecIdentity *)MAECopyLegacyDeviceIdentityWithError(buf, a2);
  id v5 = *(id *)buf;
  unsigned int v6 = sub_1003CFCE4(v5);

  v7 = (__SecIdentity *)[sub_1003D09B8() copyIdentity];
  double v8 = v7;
  if (v7) {
    int v9 = 0;
  }
  else {
    int v9 = -25300;
  }
  if (v4 && v7)
  {
    CFTypeRef cf = 0LL;
    SecCertificateRef certificateRef = 0LL;
    OSStatus v10 = SecIdentityCopyCertificate(v4, &certificateRef);
    OSStatus v11 = SecIdentityCopyCertificate(v8, (SecCertificateRef *)&cf);
    int v12 = v11;
    if (v10 || !certificateRef || v11 || !cf)
    {
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning", cf));
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        sub_1006AC830(v10, v12, v19);
      }
    }

    else
    {
      BOOL v13 = sub_1003D07D4((uint64_t)cf);
      BOOL v14 = sub_1003D07D4((uint64_t)certificateRef);
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = @"NO";
        if (v14) {
          unsigned __int8 v17 = @"YES";
        }
        else {
          unsigned __int8 v17 = @"NO";
        }
        *(_DWORD *)buf = 134218754;
        if (v13) {
          v16 = @"YES";
        }
        *(void *)&uint8_t buf[4] = certificateRef;
        __int16 v35 = 2112;
        *(void *)v36 = v17;
        *(_WORD *)&v36[8] = 2048;
        *(void *)&v36[10] = cf;
        *(_WORD *)&v36[18] = 2112;
        v37[0] = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Loaded identities { lockdownIdentityCert: %p, lockdownCertWillExpire: %@, apsIdentityCert: %p, apsCertWillExpire: %@ }",  buf,  0x2Au);
      }

      int v18 = v13 || v14;
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
      if (v18 != 1)
      {
        if (v20)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Device identity is not expired", buf, 2u);
        }

        BOOL v27 = 0;
        goto LABEL_45;
      }

      if (v20)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "An identity is expired -- deleting identity",  buf,  2u);
      }

      sleep(5u);
      *(void *)buf = 0LL;
      char v21 = MAEDeleteLegacyDeviceIdentityWithError(buf);
      id v22 = *(id *)buf;
      if ((v21 & 1) == 0)
      {
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
          sub_1006AC7BC((uint64_t)v22, v23);
        }
      }

      sleep(5u);
      dispatch_time_t v24 = dispatch_time(0LL, 5000000000LL);
      uint64_t v26 = im_primary_queue(v24, v25);
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      dispatch_after(v24, (dispatch_queue_t)v19, &stru_100904318);
    }

    BOOL v27 = 1;
LABEL_45:

    if (certificateRef)
    {
      CFRelease(certificateRef);
      SecCertificateRef certificateRef = 0LL;
    }

    if (cf) {
      CFRelease(cf);
    }
    goto LABEL_49;
  }

  if (v6 == -34019)
  {
    if (a3) {
      *a3 = 1;
    }
  }

  else
  {
    if (qword_1009C0D50 != -1) {
      dispatch_once(&qword_1009C0D50, &stru_100904338);
    }
    if (!byte_1009C0D48)
    {
      int v28 = MGGetBoolAnswer(@"ShouldHactivate");
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
        v31 = @"NO";
        *(_DWORD *)buf = 134219010;
        *(void *)&uint8_t buf[4] = v4;
        __int16 v35 = 1024;
        if (v28) {
          v31 = @"YES";
        }
        *(_DWORD *)v36 = v6;
        *(_WORD *)&v36[4] = 2048;
        *(void *)&v36[6] = v8;
        *(_WORD *)&v36[14] = 1024;
        *(_DWORD *)&v36[16] = v9;
        LOWORD(v37[0]) = 2112;
        *(void *)((char *)v37 + 2) = v31;
        _os_log_fault_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_FAULT,  "Failed to load identities { lockdownIdentity: %p, lockdownResult: %d, apsIdentity: %p, apsResult: %d, shouldHacktivate: %@ }",  buf,  0x2Cu);
      }
    }
  }

  BOOL v27 = 1;
  if (v4)
  {
LABEL_49:
    CFRelease(v4);
    if (!v8) {
      return v27;
    }
    goto LABEL_40;
  }

  if (v8) {
LABEL_40:
  }
    CFRelease(v8);
  return v27;
}

- (IDSDeviceCertificationRepairDelegate)delegate
{
  return (IDSDeviceCertificationRepairDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (IMDispatchTimer)repairTimer
{
  return self->_repairTimer;
}

- (void)setRepairTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end