@interface NSXPCConnection
- (BOOL)icd_isConnectionAllowedForService:(int64_t)a3;
- (BOOL)icd_isConnectionAllowedForService:(int64_t)a3 validationReason:(int64_t)a4;
@end

@implementation NSXPCConnection

- (BOOL)icd_isConnectionAllowedForService:(int64_t)a3
{
  return -[NSXPCConnection icd_isConnectionAllowedForService:validationReason:]( self,  "icd_isConnectionAllowedForService:validationReason:",  a3,  0LL);
}

- (BOOL)icd_isConnectionAllowedForService:(int64_t)a3 validationReason:(int64_t)a4
{
  uint64_t v7 = -[NSXPCConnection processIdentifier](self, "processIdentifier");
  -[NSXPCConnection auditToken](self, "auditToken");
  *(_OWORD *)buf = v26;
  *(_OWORD *)&buf[16] = v27;
  uint64_t v8 = MSVBundleIDForAuditToken(buf);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t Name = ICCloudServerSupportedServiceGetName(a3);
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue(Name);
  if (!a4)
  {
    v12 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544386;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = (int)v7;
      *(_WORD *)&buf[32] = 2114;
      *(void *)&buf[34] = v11;
      *(_WORD *)&buf[42] = 2048;
      *(void *)&buf[44] = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Incoming XPC connection %{public}@ from %{public}@[%ld] for service %{public}@[%ld].",  buf,  0x34u);
    }
  }

  if (a3 != 4 && a3 != 1)
  {
LABEL_14:
    *(_OWORD *)buf = v26;
    *(_OWORD *)&buf[16] = v27;
    if (!TCCAccessCheckAuditToken(kTCCServiceMediaLibrary, buf, 0LL))
    {
      if (!a4)
      {
        v19 = os_log_create("com.apple.amp.itunescloudd", "XPC");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138544642;
          *(void *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v9;
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = v7;
          *(_WORD *)&buf[28] = 2114;
          *(void *)&buf[30] = v11;
          *(_WORD *)&buf[38] = 2048;
          *(void *)&buf[40] = a3;
          *(_WORD *)&buf[48] = 2114;
          *(void *)&buf[50] = @"TCC not granted";
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Refusing XPC connection %{public}@ from %{public}@[%d] for %{public}@[%ld]: %{public}@.",  buf,  0x3Au);
        }
      }

      uint64_t v20 = MSVAutoBugCaptureDomainiTunesCloud;
      v28[0] = @"processIdentifier";
      uint64_t v21 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v7));
      v14 = (void *)v21;
      if (v9) {
        v22 = v9;
      }
      else {
        v22 = &stru_1001A7960;
      }
      v29[0] = v21;
      v29[1] = v22;
      v28[1] = @"bundleID";
      v28[2] = @"serviceName";
      v28[3] = @"refusalReason";
      if (v11) {
        v23 = v11;
      }
      else {
        v23 = &stru_1001A7960;
      }
      v29[2] = v23;
      v29[3] = @"TCC not granted";
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  v28,  4LL));
      v30 = v17;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL));
      +[MSVAutoBugCapture snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:]( &OBJC_CLASS___MSVAutoBugCapture,  "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:",  v20,  @"Bug",  @"RefuseXPCConnection",  &stru_1001A7960,  0LL,  v24,  0LL);

      BOOL v18 = 0;
      goto LABEL_27;
    }

    goto LABEL_15;
  }

  uint64_t v13 = ICCloudServiceEntitlementStatusAccessExemptedFromUserConsentRequirement;
  v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection valueForEntitlement:]( self,  "valueForEntitlement:",  ICCloudServiceEntitlementStatusAccessExemptedFromUserConsentRequirement));
  if ((objc_opt_respondsToSelector(v14, "BOOLValue") & 1) == 0)
  {

    goto LABEL_14;
  }

  unsigned int v15 = [v14 BOOLValue];
  char v16 = v15;
  if (!a4 && v15)
  {
    v17 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Client has %{public}@ entitlement. No need to check TCC access for cloud status monitor connection.",  buf,  0x16u);
    }

    BOOL v18 = 1;
LABEL_27:

    goto LABEL_28;
  }

  if ((v16 & 1) == 0) {
    goto LABEL_14;
  }
LABEL_15:
  BOOL v18 = 1;
LABEL_28:

  return v18;
}

@end