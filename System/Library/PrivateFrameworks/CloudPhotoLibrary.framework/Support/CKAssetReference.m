@interface CKAssetReference
- (id)cplFingerPrint;
@end

@implementation CKAssetReference

- (id)cplFingerPrint
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKAssetReference fileSignature](self, "fileSignature"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CKAsset cplFingerPrintForSignature:](&OBJC_CLASS___CKAsset, "cplFingerPrintForSignature:", v2));

  return v3;
}

@end