@interface SFECKeyPairClass
@end

@implementation SFECKeyPairClass

Class __get_SFECKeyPairClass_block_invoke(uint64_t a1)
{
  if (!SecurityFoundationLibraryCore_frameworkLibrary) {
    SecurityFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SecurityFoundationLibraryCore_frameworkLibrary)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithUTF8String:"void *SecurityFoundationLibrary(void)"];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v3,  "handleFailureInFunction:file:lineNumber:description:",  v4,  @"SOSFullPeerInfo.m",  68,  @"%s",  0);

    goto LABEL_8;
  }

  Class result = objc_getClass("_SFECKeyPair");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    [MEMORY[0x1896077D8] currentHandler];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithUTF8String:"Class get_SFECKeyPairClass(void)_block_invoke"];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v3,  "handleFailureInFunction:file:lineNumber:description:",  v5,  @"SOSFullPeerInfo.m",  72,  @"Unable to find class %s",  "_SFECKeyPair");

LABEL_8:
    __break(1u);
  }

  get_SFECKeyPairClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

@end