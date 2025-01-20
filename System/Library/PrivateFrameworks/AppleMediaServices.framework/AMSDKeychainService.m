@interface AMSDKeychainService
+ (BOOL)isConnectionEntitled:(id)a3;
- (void)getPublicKeyHeaderWithAccount:(id)a3 options:(id)a4 signatureResult:(id)a5 completion:(id)a6;
- (void)testKeychainWithCompletion:(id)a3;
@end

@implementation AMSDKeychainService

+ (BOOL)isConnectionEntitled:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 valueForEntitlement:@"com.apple.private.applemediaservices"]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    id v6 = v3;
  }
  else {
    id v6 = 0LL;
  }

  unsigned __int8 v7 = [v6 BOOLValue];
  return v7;
}

- (void)getPublicKeyHeaderWithAccount:(id)a3 options:(id)a4 signatureResult:(id)a5 completion:(id)a6
{
  unsigned __int8 v7 = (void (**)(id, uint64_t, void *))a6;
  id v20 = 0LL;
  v8 = (__SecKey *)+[AMSKeychain copyPublicKeyForOptions:error:]( &OBJC_CLASS___AMSKeychain,  "copyPublicKeyForOptions:error:",  a4,  &v20);
  id v9 = v20;
  v10 = v9;
  if (v8)
  {
    CFErrorRef error = 0LL;
    CFDataRef v11 = SecKeyCopyExternalRepresentation(v8, &error);
    CFRelease(v8);
    CFErrorRef v12 = error;
    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[__CFData base64EncodedStringWithOptions:](v11, "base64EncodedStringWithOptions:", 0LL));
    v14 = (void *)v13;
    if (v13)
    {
      uint64_t v21 = AMSHTTPHeaderTouchIDPublicKey;
      uint64_t v22 = v13;
      uint64_t v15 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
    }

    else
    {
      uint64_t v15 = 0LL;
    }
  }

  else
  {
    if (v9)
    {
      v16 = (__CFError *)v9;
      goto LABEL_10;
    }

    CFErrorRef v12 = 0LL;
    uint64_t v15 = 0LL;
  }

  uint64_t v17 = AMSError(0LL, @"Unknown Error", 0LL, 0LL);
  v16 = (__CFError *)objc_claimAutoreleasedReturnValue(v17);
LABEL_10:
  CFErrorRef v12 = v16;
  uint64_t v15 = 0LL;
LABEL_11:
  if (v7)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[__CFError ams_sanitizedForSecureCoding](v12, "ams_sanitizedForSecureCoding"));
    v7[2](v7, v15, v18);
  }
}

- (void)testKeychainWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, _UNKNOWN **, void))a3 + 2))(a3, &off_1000DEBD8, 0LL);
  }
}

@end