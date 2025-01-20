@interface CEMFontDeclaration
- (id)dmf_installAssetOperationWithReferenceResolver:(id)a3 error:(id *)a4;
- (id)dmf_removeAssetOperationWithInstallMetadata:(id)a3 error:(id *)a4;
@end

@implementation CEMFontDeclaration

- (id)dmf_installAssetOperationWithReferenceResolver:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[CEMFontInstallOperation initWithFontDeclaration:resolver:]( objc_alloc(&OBJC_CLASS___CEMFontInstallOperation),  "initWithFontDeclaration:resolver:",  self,  v5);

  return v6;
}

- (id)dmf_removeAssetOperationWithInstallMetadata:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[CEMFontRemoveOperation initWithFontDeclaration:installMetadata:]( objc_alloc(&OBJC_CLASS___CEMFontRemoveOperation),  "initWithFontDeclaration:installMetadata:",  self,  v5);

  return v6;
}

@end