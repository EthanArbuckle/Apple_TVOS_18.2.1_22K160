@interface CEMFontInstallOperation
- (BOOL)isAsynchronous;
- (CEMAssetBaseDescriptor)assetDescriptor;
- (CEMAssetBaseReference)assetReference;
- (CEMFontDeclaration)fontDeclaration;
- (CEMFontInstallOperation)initWithFontDeclaration:(id)a3 resolver:(id)a4;
- (DMDRemoteAssetResolver)resolver;
- (NSString)assetIdentifier;
- (void)assetResolutionDidSucceedWithAssetURL:(id)a3;
- (void)assetResolutionFailedWithError:(id)a3;
- (void)main;
- (void)setFontDeclaration:(id)a3;
- (void)setResolver:(id)a3;
@end

@implementation CEMFontInstallOperation

- (CEMFontInstallOperation)initWithFontDeclaration:(id)a3 resolver:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CEMFontInstallOperation;
  v9 = -[CEMFontInstallOperation init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fontDeclaration, a3);
    objc_storeStrong((id *)&v10->_resolver, a4);
  }

  return v10;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[CEMFontInstallOperation resolver](self, "resolver"));
  [v3 resolveAssetWithContext:self];
}

- (NSString)assetIdentifier
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CEMFontInstallOperation fontDeclaration](self, "fontDeclaration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 declarationIdentifier]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CEMFontInstallOperation fontDeclaration](self, "fontDeclaration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 declarationServerHash]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v4, v6));

  return (NSString *)v7;
}

- (CEMAssetBaseDescriptor)assetDescriptor
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CEMFontInstallOperation fontDeclaration](self, "fontDeclaration"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 payloadDescriptor]);

  return (CEMAssetBaseDescriptor *)v3;
}

- (CEMAssetBaseReference)assetReference
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CEMFontInstallOperation fontDeclaration](self, "fontDeclaration"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 payloadReference]);

  return (CEMAssetBaseReference *)v3;
}

- (void)assetResolutionDidSucceedWithAssetURL:(id)a3
{
  id v4 = a3;
  if (-[CEMFontInstallOperation isExecuting](self, "isExecuting"))
  {
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileManager dmd_userFontDatabaseDirectoryURL]( &OBJC_CLASS___NSFileManager,  "dmd_userFontDatabaseDirectoryURL"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v20 = 0LL;
      unsigned __int8 v7 = [v6 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v20];
      id v8 = v20;

      if ((v7 & 1) != 0)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CEMFontInstallOperation assetIdentifier](self, "assetIdentifier"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
        uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v9, v10));
        objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:v11]);

        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        id v19 = v8;
        LOBYTE(v11) = [v13 copyItemAtURL:v4 toURL:v12 error:&v19];
        id v14 = v19;

        if ((v11 & 1) != 0)
        {
          v15 = objc_opt_new(&OBJC_CLASS___CEMFontAssetInstallMetadata);
          -[CEMFontAssetInstallMetadata setFontURL:](v15, "setFontURL:", v12);
          -[CEMFontInstallOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v15);
        }

        else
        {
          -[CEMFontInstallOperation endOperationWithError:](self, "endOperationWithError:", v14);
        }
      }

      else
      {
        -[CEMFontInstallOperation endOperationWithError:](self, "endOperationWithError:", v8);
        id v14 = v8;
      }
    }

    else
    {
      uint64_t v16 = DMFConfigurationEngineLog();
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100060254(v17);
      }

      uint64_t v18 = DMFErrorWithCodeAndUserInfo(0LL, 0LL);
      id v14 = (id)objc_claimAutoreleasedReturnValue(v18);
      -[CEMFontInstallOperation endOperationWithError:](self, "endOperationWithError:", v14);
    }
  }
}

- (void)assetResolutionFailedWithError:(id)a3
{
  id v4 = a3;
}

- (CEMFontDeclaration)fontDeclaration
{
  return self->_fontDeclaration;
}

- (void)setFontDeclaration:(id)a3
{
}

- (DMDRemoteAssetResolver)resolver
{
  return self->_resolver;
}

- (void)setResolver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end