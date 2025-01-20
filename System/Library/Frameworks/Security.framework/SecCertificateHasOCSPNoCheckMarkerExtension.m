@interface SecCertificateHasOCSPNoCheckMarkerExtension
@end

@implementation SecCertificateHasOCSPNoCheckMarkerExtension

CFArrayRef __SecCertificateHasOCSPNoCheckMarkerExtension_block_invoke()
{
  result = SecCertificateCreateOidDataFromString(0LL, @"1.3.6.1.5.5.7.48.1.5");
  SecCertificateHasOCSPNoCheckMarkerExtension_sOCSPNoCheckOIDData = (uint64_t)result;
  return result;
}

@end