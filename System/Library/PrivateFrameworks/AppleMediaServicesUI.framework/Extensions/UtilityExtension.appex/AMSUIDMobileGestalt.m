@interface AMSUIDMobileGestalt
+ (BOOL)hasCapabilities:(id)a3;
+ (BOOL)hasHEVCDecoding;
+ (BOOL)hasSystemTelephonyOfAnyKind;
+ (BOOL)hasVenice;
+ (BOOL)isTouchIDSupported;
+ (BOOL)wapiCapability;
+ (NSString)activePairedSystemVersion;
+ (NSString)deviceClass;
+ (NSString)productType;
@end

@implementation AMSUIDMobileGestalt

+ (NSString)deviceClass
{
  return (NSString *)MGGetStringAnswer(@"DeviceClass", a2);
}

+ (BOOL)hasHEVCDecoding
{
  return MGGetBoolAnswer(@"N8lZxRgC7lfdRS3dRLn+Ag", a2);
}

+ (BOOL)hasSystemTelephonyOfAnyKind
{
  return MGGetBoolAnswer(@"any-telephony", a2);
}

+ (BOOL)hasVenice
{
  return MGGetBoolAnswer(@"venice", a2);
}

+ (BOOL)isTouchIDSupported
{
  return MGGetBoolAnswer(@"touch-id", a2);
}

+ (NSString)productType
{
  return (NSString *)MGGetStringAnswer(@"ProductType", a2);
}

+ (BOOL)wapiCapability
{
  return MGGetBoolAnswer(@"wapi", a2);
}

+ (NSString)activePairedSystemVersion
{
  return 0LL;
}

+ (BOOL)hasCapabilities:(id)a3
{
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v27;
    CFBooleanRef v8 = kCFBooleanTrue;
    *(void *)&__int128 v5 = 138544130LL;
    __int128 v22 = v5;
    uint64_t v23 = *(void *)v27;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v3);
        }
        v10 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        if ((objc_msgSend(v10, "isEqualToString:", &stru_10004B6E8, v22) & 1) == 0)
        {
          int v25 = 0;
          v11 = (const __CFBoolean *)MGCopyAnswerWithError(v10, 0LL, &v25);
          v12 = v11;
          if (v11)
          {
            CFRelease(v11);
          }

          else
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
            if (!v13) {
              v13 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
            }
            v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 OSLogObject]);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              id v15 = v3;
              v16 = v8;
              uint64_t v17 = objc_opt_class(a1);
              uint64_t v18 = AMSLogKey();
              v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
              *(_DWORD *)buf = v22;
              uint64_t v31 = v17;
              CFBooleanRef v8 = v16;
              id v3 = v15;
              uint64_t v7 = v23;
              __int16 v32 = 2114;
              v33 = v19;
              __int16 v34 = 2114;
              v35 = v10;
              __int16 v36 = 1026;
              int v37 = v25;
              _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to obtain capability: %{public}@, %{public}d",  buf,  0x26u);
            }
          }

          if (v12 != v8)
          {
            BOOL v20 = 0;
            goto LABEL_19;
          }
        }
      }

      id v6 = [v3 countByEnumeratingWithState:&v26 objects:v38 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  BOOL v20 = 1;
LABEL_19:

  return v20;
}

@end