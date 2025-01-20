@interface MAInternalServerAnchorCertificates
@end

@implementation MAInternalServerAnchorCertificates

void __MAInternalServerAnchorCertificates_block_invoke(id a1)
{
  Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  MAInternalServerAnchorCertificates_anchors = (uint64_t)Mutable;
  v2 = CFDataCreateWithBytesNoCopy(0LL, APPLE_CORPORATE_ROOT_CA_2, 585LL, kCFAllocatorNull);
  SecCertificateRef v3 = SecCertificateCreateWithData(0LL, v2);
  CFArrayAppendValue(Mutable, v3);
  CFRelease(v3);
  CFRelease(v2);
}

@end