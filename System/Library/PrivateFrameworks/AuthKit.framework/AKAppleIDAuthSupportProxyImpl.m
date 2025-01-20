@interface AKAppleIDAuthSupportProxyImpl
- (__AppleIDAuthSupportTokenData)appleIDAuthSupportTokenCreateWithExternalizedVersion:(id)a3 error:(id *)a4;
- (id)appleIDAuthSupportCopyAppTokensWithMasterToken:(__AppleIDAuthSupportTokenData *)a3 authURL:(id)a4 serviceIds:(id)a5 authParams:(id)a6 error:(id *)a7;
@end

@implementation AKAppleIDAuthSupportProxyImpl

- (__AppleIDAuthSupportTokenData)appleIDAuthSupportTokenCreateWithExternalizedVersion:(id)a3 error:(id *)a4
{
  id v7 = 0LL;
  v5 = (__AppleIDAuthSupportTokenData *)AppleIDAuthSupportTokenCreateWithExternalizedVersion(a3, &v7);
  if (a4) {
    *a4 = v7;
  }
  if (v7) {
    CFRelease(v7);
  }
  return v5;
}

- (id)appleIDAuthSupportCopyAppTokensWithMasterToken:(__AppleIDAuthSupportTokenData *)a3 authURL:(id)a4 serviceIds:(id)a5 authParams:(id)a6 error:(id *)a7
{
  id v10 = 0LL;
  v8 = (void *)AppleIDAuthSupportCopyAppTokensOptions(a3, a4, a5, a6, &v10);
  if (a7) {
    *a7 = v10;
  }
  if (v10) {
    CFRelease(v10);
  }
  return v8;
}

@end