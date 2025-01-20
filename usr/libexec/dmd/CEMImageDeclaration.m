@interface CEMImageDeclaration
- (id)dmf_installAssetOperationWithReferenceResolver:(id)a3 error:(id *)a4;
- (id)dmf_removeAssetOperationWithInstallMetadata:(id)a3 error:(id *)a4;
@end

@implementation CEMImageDeclaration

- (id)dmf_installAssetOperationWithReferenceResolver:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[CEMImageInstallOperation initWithImageDeclaration:resolver:]( objc_alloc(&OBJC_CLASS___CEMImageInstallOperation),  "initWithImageDeclaration:resolver:",  self,  v5);

  return v6;
}

- (id)dmf_removeAssetOperationWithInstallMetadata:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[CEMImageRemoveOperation initWithImageDeclaration:installMetadata:]( objc_alloc(&OBJC_CLASS___CEMImageRemoveOperation),  "initWithImageDeclaration:installMetadata:",  self,  v5);

  return v6;
}

@end