@interface CPLCloudKitComputeStateEncryptionHelper
- (BOOL)decryptFileAtURL:(id)a3 outputFileURL:(id)a4 error:(id *)a5;
- (BOOL)encryptFileAtURL:(id)a3 outputFileURL:(id)a4 error:(id *)a5;
- (BOOL)unitTestMode;
- (CPLCloudKitComputeStateEncryptionHelper)init;
- (PFClientSideEncryptionManager)clientSideEncryptionManager;
- (void)setUnitTestMode:(BOOL)a3;
- (void)shutdown;
- (void)start;
@end

@implementation CPLCloudKitComputeStateEncryptionHelper

- (CPLCloudKitComputeStateEncryptionHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CPLCloudKitComputeStateEncryptionHelper;
  result = -[CPLCloudKitComputeStateEncryptionHelper init](&v3, "init");
  if (result) {
    result->_unitTestMode = 0;
  }
  return result;
}

- (void)start
{
  objc_super v3 = (id *)&PFClientSideEncryptionManagerProfilePhotosCloudPhotoD;
  if (self->_unitTestMode) {
    objc_super v3 = (id *)&PFClientSideEncryptionManagerProfilePhotosUnitTest;
  }
  id v6 = *v3;
  v4 = -[PFClientSideEncryptionManager initWithProfile:]( objc_alloc(&OBJC_CLASS___PFClientSideEncryptionManager),  "initWithProfile:",  v6);
  clientSideEncryptionManager = self->_clientSideEncryptionManager;
  self->_clientSideEncryptionManager = v4;

  -[PFClientSideEncryptionManager start](self->_clientSideEncryptionManager, "start");
}

- (void)shutdown
{
}

- (BOOL)encryptFileAtURL:(id)a3 outputFileURL:(id)a4 error:(id *)a5
{
  clientSideEncryptionManager = self->_clientSideEncryptionManager;
  id v22 = 0LL;
  unsigned __int8 v7 = -[PFClientSideEncryptionManager archiveFileAtURL:outputFileURL:error:]( clientSideEncryptionManager,  "archiveFileAtURL:outputFileURL:error:",  a3,  a4,  &v22);
  id v8 = v22;
  id v9 = v8;
  if ((v7 & 1) != 0) {
    goto LABEL_12;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
  unsigned int v11 = [v10 isEqualToString:PFErrorDomain];

  if (v11)
  {
    id v12 = [v9 code];
    if (v12 != (id)8)
    {
      if (v12 == (id)500101)
      {
        v13 = objc_alloc(&OBJC_CLASS___NSString);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedDescription]);
        v15 = -[NSString initWithFormat:](v13, "initWithFormat:", @"Encryption helper is unavailable: %@", v14);
        uint64_t v16 = 1LL;
        goto LABEL_8;
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue([v9 cplUnderlyingPOSIXError]);

      if (!v17)
      {
        v18 = objc_alloc(&OBJC_CLASS___NSString);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedDescription]);
        v15 = -[NSString initWithFormat:](v18, "initWithFormat:", @"Failed to encrypt file: %@", v14);
        uint64_t v16 = 2LL;
LABEL_8:

        if (v15)
        {
          v23[0] = NSLocalizedDescriptionKey;
          v23[1] = NSUnderlyingErrorKey;
          v24[0] = v15;
          v24[1] = v9;
          v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  2LL));
          uint64_t v20 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CPLComputeStateEncryptionError",  v16,  v19));

          id v9 = (id)v20;
        }
      }
    }
  }

  if (a5)
  {
    id v9 = v9;
    *a5 = v9;
  }

- (BOOL)decryptFileAtURL:(id)a3 outputFileURL:(id)a4 error:(id *)a5
{
  clientSideEncryptionManager = self->_clientSideEncryptionManager;
  id v22 = 0LL;
  unsigned __int8 v7 = -[PFClientSideEncryptionManager unarchiveFileAtURL:outputFileURL:error:]( clientSideEncryptionManager,  "unarchiveFileAtURL:outputFileURL:error:",  a3,  a4,  &v22);
  id v8 = v22;
  id v9 = v8;
  if ((v7 & 1) != 0) {
    goto LABEL_12;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
  unsigned int v11 = [v10 isEqualToString:PFErrorDomain];

  if (v11)
  {
    id v12 = [v9 code];
    if (v12 != (id)8)
    {
      if (v12 == (id)500101)
      {
        v13 = objc_alloc(&OBJC_CLASS___NSString);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedDescription]);
        v15 = -[NSString initWithFormat:](v13, "initWithFormat:", @"Encryption helper is unavailable: %@", v14);
        uint64_t v16 = 1LL;
        goto LABEL_8;
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue([v9 cplUnderlyingPOSIXError]);

      if (!v17)
      {
        v18 = objc_alloc(&OBJC_CLASS___NSString);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedDescription]);
        v15 = -[NSString initWithFormat:](v18, "initWithFormat:", @"Failed to decrypt file: %@", v14);
        uint64_t v16 = 3LL;
LABEL_8:

        if (v15)
        {
          v23[0] = NSLocalizedDescriptionKey;
          v23[1] = NSUnderlyingErrorKey;
          v24[0] = v15;
          v24[1] = v9;
          v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  2LL));
          uint64_t v20 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CPLComputeStateEncryptionError",  v16,  v19));

          id v9 = (id)v20;
        }
      }
    }
  }

  if (a5)
  {
    id v9 = v9;
    *a5 = v9;
  }

- (PFClientSideEncryptionManager)clientSideEncryptionManager
{
  return (PFClientSideEncryptionManager *)objc_getProperty(self, a2, 16LL, 1);
}

- (BOOL)unitTestMode
{
  return self->_unitTestMode;
}

- (void)setUnitTestMode:(BOOL)a3
{
  self->_unitTestMode = a3;
}

- (void).cxx_destruct
{
}

@end