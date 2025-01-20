@interface CEMFontRemoveOperation
- (CEMFontAssetInstallMetadata)installMetadata;
- (CEMFontDeclaration)fontDeclaration;
- (CEMFontRemoveOperation)initWithFontDeclaration:(id)a3 installMetadata:(id)a4;
- (void)main;
- (void)setFontDeclaration:(id)a3;
- (void)setInstallMetadata:(id)a3;
@end

@implementation CEMFontRemoveOperation

- (CEMFontRemoveOperation)initWithFontDeclaration:(id)a3 installMetadata:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CEMFontRemoveOperation;
  v9 = -[CEMFontRemoveOperation init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fontDeclaration, a3);
    objc_storeStrong((id *)&v10->_installMetadata, a4);
  }

  return v10;
}

- (void)main
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CEMFontRemoveOperation installMetadata](self, "installMetadata"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 fontURL]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
  unsigned int v7 = [v5 fileExistsAtPath:v6];

  if (!v7)
  {
    id v9 = 0LL;
    goto LABEL_5;
  }

  id v10 = 0LL;
  unsigned __int8 v8 = [v5 removeItemAtURL:v4 error:&v10];
  id v9 = v10;
  if ((v8 & 1) != 0)
  {
LABEL_5:
    -[CEMFontRemoveOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0LL);
    goto LABEL_6;
  }

  -[CEMFontRemoveOperation endOperationWithError:](self, "endOperationWithError:", v9);
LABEL_6:
}

- (CEMFontDeclaration)fontDeclaration
{
  return self->_fontDeclaration;
}

- (void)setFontDeclaration:(id)a3
{
}

- (CEMFontAssetInstallMetadata)installMetadata
{
  return self->_installMetadata;
}

- (void)setInstallMetadata:(id)a3
{
}

- (void).cxx_destruct
{
}

@end