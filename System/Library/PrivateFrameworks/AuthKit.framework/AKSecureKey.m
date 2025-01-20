@interface AKSecureKey
+ (__SecKey)createOSVersionAttestationRefKeyWithContext:(id)a3 accessControl:(__SecAccessControl *)a4 error:(id *)a5;
+ (__SecKey)osVersionAttestationRefKey;
+ (int)deleteOSVersionAttestationRefKey;
+ (int)storeOSVersionAttestationRefKey:(__SecKey *)a3;
@end

@implementation AKSecureKey

+ (__SecKey)createOSVersionAttestationRefKeyWithContext:(id)a3 accessControl:(__SecAccessControl *)a4 error:(id *)a5
{
  v8 = (id)kSecAttrKeyTypeECSECPrimeRandom;
  CFTypeRef cf = 0LL;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[AAFAnalyticsEvent ak_analyticsEventWithContext:eventName:error:]( &OBJC_CLASS___AAFAnalyticsEvent,  "ak_analyticsEventWithContext:eventName:error:",  a3,  @"com.apple.authkit.generateOSBoundRefKey",  0LL));
  uint64_t v10 = kAAFDidSucceed;
  [v9 setObject:&__kCFBooleanFalse forKeyedSubscript:kAAFDidSucceed];
  if (!a4 || (v11 = CFRetain(a4)) == 0LL)
  {
    v11 = SecAccessControlCreateWithFlags( 0LL,  kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly,  0x40000000uLL,  (CFErrorRef *)&cf);
    if (!v11)
    {
      uint64_t v30 = _AKLogSystem(0LL);
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        sub_10013B0D8((uint64_t)&cf, v31, v32, v33, v34, v35, v36, v37);
      }

      v12 = (const __CFDictionary *)cf;
      if (cf) {
        CFTypeRef cf = 0LL;
      }
      id v38 = (id)objc_claimAutoreleasedReturnValue( +[NSError ak_attestationErrorWithCode:underlyingError:]( &OBJC_CLASS___NSError,  "ak_attestationErrorWithCode:underlyingError:",  -10003LL,  v12,  cf));
      *a5 = v38;
      [v9 populateUnderlyingErrorsStartingWithRootError:v38];
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[AKAnalyticsReporterRTC rtcAnalyticsReporter]( &OBJC_CLASS___AKAnalyticsReporterRTC,  "rtcAnalyticsReporter"));
      [v19 sendEvent:v9];
      goto LABEL_20;
    }
  }

  v41[0] = kSecAttrIsPermanent;
  v41[1] = kSecAttrTokenID;
  v42[0] = &__kCFBooleanFalse;
  v42[1] = kSecAttrTokenIDAppleKeyStore;
  v41[2] = kSecAttrKeyType;
  v41[3] = kSecAttrAccessControl;
  v42[2] = v8;
  v42[3] = v11;
  v41[4] = kSecKeyOSBound;
  v41[5] = kSecAttrKeySizeInBits;
  v42[4] = &__kCFBooleanTrue;
  v42[5] = &off_1001D8E60;
  v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v42,  v41,  6LL));
  RandomKey = SecKeyCreateRandomKey(v12, (CFErrorRef *)&cf);
  uint64_t v14 = _AKLogSystem(RandomKey);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if (!RandomKey)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10013B144((uint64_t)&cf, v16, v22, v23, v24, v25, v26, v27);
    }

    v19 = (void *)cf;
    if (cf) {
      CFTypeRef cf = 0LL;
    }
    id v28 = (id)objc_claimAutoreleasedReturnValue( +[NSError ak_attestationErrorWithCode:underlyingError:]( &OBJC_CLASS___NSError,  "ak_attestationErrorWithCode:underlyingError:",  -10004LL,  v19,  cf));
    *a5 = v28;
    [v9 populateUnderlyingErrorsStartingWithRootError:v28];
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[AKAnalyticsReporterRTC rtcAnalyticsReporter]( &OBJC_CLASS___AKAnalyticsReporterRTC,  "rtcAnalyticsReporter"));
    [v29 sendEvent:v9];

    CFRelease(v11);
LABEL_20:
    RandomKey = 0LL;
    goto LABEL_21;
  }

  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_10013B1B0(v16);
  }

  signed int v17 = +[AKSecureKey deleteOSVersionAttestationRefKey](&OBJC_CLASS___AKSecureKey, "deleteOSVersionAttestationRefKey");
  uint64_t v18 = AKAttestationErrorDomain;
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ak_generalErrorWithCode:errorDomain:underlyingError:]( &OBJC_CLASS___NSError,  "ak_generalErrorWithCode:errorDomain:underlyingError:",  v17,  AKAttestationErrorDomain,  0LL));
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ak_generalErrorWithCode:errorDomain:underlyingError:]( &OBJC_CLASS___NSError,  "ak_generalErrorWithCode:errorDomain:underlyingError:",  +[AKSecureKey storeOSVersionAttestationRefKey:]( &OBJC_CLASS___AKSecureKey,  "storeOSVersionAttestationRefKey:",  RandomKey),  v18,  v19));
  [v9 setObject:&__kCFBooleanTrue forKeyedSubscript:v10];
  [v9 populateUnderlyingErrorsStartingWithRootError:v20];
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[AKAnalyticsReporterRTC rtcAnalyticsReporter]( &OBJC_CLASS___AKAnalyticsReporterRTC,  "rtcAnalyticsReporter"));
  [v21 sendEvent:v9];

  CFRelease(v11);
  if (cf) {
    CFRelease(cf);
  }
  CFTypeRef cf = 0LL;

LABEL_21:
  return RandomKey;
}

+ (int)storeOSVersionAttestationRefKey:(__SecKey *)a3
{
  v11[0] = kSecAttrLabel;
  v11[1] = kSecClass;
  v12[0] = @"com.apple.authkit.osVersionAttestationRefKey";
  v12[1] = kSecClassKey;
  v11[2] = kSecValueRef;
  v11[3] = kSecUseDataProtectionKeychain;
  v12[2] = a3;
  v12[3] = &__kCFBooleanTrue;
  v11[4] = kSecAttrAccessible;
  v12[4] = kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate;
  v3 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  5LL));
  uint64_t v4 = SecItemAdd(v3, 0LL);
  int v5 = v4;
  if ((_DWORD)v4)
  {
    uint64_t v6 = _AKLogSystem(v4);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10013B258();
    }
  }

  uint64_t v8 = _AKLogSystem(v4);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10013B1EC();
  }

  return v5;
}

+ (__SecKey)osVersionAttestationRefKey
{
  v9[0] = kSecClass;
  v9[1] = kSecAttrLabel;
  v10[0] = kSecClassKey;
  v10[1] = @"com.apple.authkit.osVersionAttestationRefKey";
  v9[2] = kSecUseDataProtectionKeychain;
  v9[3] = kSecReturnRef;
  v10[2] = &__kCFBooleanTrue;
  v10[3] = &__kCFBooleanTrue;
  v2 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  4LL));
  uint64_t v8 = 0LL;
  uint64_t v3 = SecItemCopyMatching(v2, (CFTypeRef *)&v8);
  if ((_DWORD)v3)
  {
    uint64_t v4 = _AKLogSystem(v3);
    int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10013B2B8();
    }
  }

  uint64_t v6 = v8;

  return v6;
}

+ (int)deleteOSVersionAttestationRefKey
{
  v8[0] = kSecClass;
  v8[1] = kSecAttrLabel;
  v9[0] = kSecClassKey;
  v9[1] = @"com.apple.authkit.osVersionAttestationRefKey";
  v8[2] = kSecUseDataProtectionKeychain;
  v9[2] = &__kCFBooleanTrue;
  v2 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  3LL));
  uint64_t v3 = SecItemDelete(v2);
  int v4 = v3;
  if ((_DWORD)v3)
  {
    uint64_t v5 = _AKLogSystem(v3);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10013B318();
    }
  }

  return v4;
}

@end