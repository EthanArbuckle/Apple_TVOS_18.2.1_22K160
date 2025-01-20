@interface CPLCloudKitComputeStateNoEncryptionHelper
- (BOOL)decryptFileAtURL:(id)a3 outputFileURL:(id)a4 error:(id *)a5;
- (BOOL)encryptFileAtURL:(id)a3 outputFileURL:(id)a4 error:(id *)a5;
- (CPLCloudKitComputeStateNoEncryptionHelper)init;
- (CPLCloudKitComputeStateNoEncryptionHelper)initWithPrefix:(id)a3;
- (NSData)prefix;
@end

@implementation CPLCloudKitComputeStateNoEncryptionHelper

- (CPLCloudKitComputeStateNoEncryptionHelper)initWithPrefix:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CPLCloudKitComputeStateNoEncryptionHelper;
  v6 = -[CPLCloudKitComputeStateNoEncryptionHelper init](&v12, "init");
  if (v6)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
    fm = v6->_fm;
    v6->_fm = v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue([v5 dataUsingEncoding:4]);
    prefix = v6->_prefix;
    v6->_prefix = (NSData *)v9;

    if (!v6->_prefix) {
      sub_100191218((uint64_t)a2, (uint64_t)v6);
    }
  }

  return v6;
}

- (CPLCloudKitComputeStateNoEncryptionHelper)init
{
  return -[CPLCloudKitComputeStateNoEncryptionHelper initWithPrefix:](self, "initWithPrefix:", &stru_1002482B0);
}

- (BOOL)encryptFileAtURL:(id)a3 outputFileURL:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (-[NSData length](self->_prefix, "length"))
  {
    id v17 = 0LL;
    v10 = -[NSMutableData initWithContentsOfURL:options:error:]( objc_alloc(&OBJC_CLASS___NSMutableData),  "initWithContentsOfURL:options:error:",  v8,  0LL,  &v17);
    id v11 = v17;
    if (v10)
    {
      objc_super v12 = objc_autoreleasePoolPush();
      -[NSMutableData replaceBytesInRange:withBytes:length:]( v10,  "replaceBytesInRange:withBytes:length:",  0LL,  0LL,  -[NSData bytes](self->_prefix, "bytes"),  -[NSData length](self->_prefix, "length"));
      id v16 = v11;
      unsigned __int8 v13 = -[NSMutableData writeToURL:options:error:](v10, "writeToURL:options:error:", v9, 1LL, &v16);
      id v14 = v16;

      objc_autoreleasePoolPop(v12);
      id v11 = v14;
      if (!a5) {
        goto LABEL_9;
      }
    }

    else
    {
      unsigned __int8 v13 = 0;
      if (!a5)
      {
LABEL_9:

        goto LABEL_10;
      }
    }

    if ((v13 & 1) == 0) {
      *a5 = v11;
    }
    goto LABEL_9;
  }

  unsigned __int8 v13 = -[NSFileManager cplCopyItemAtURL:toURL:error:]( self->_fm,  "cplCopyItemAtURL:toURL:error:",  v8,  v9,  a5);
LABEL_10:

  return v13;
}

- (BOOL)decryptFileAtURL:(id)a3 outputFileURL:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (-[NSData length](self->_prefix, "length"))
  {
    id v23 = 0LL;
    v10 = -[NSData initWithContentsOfURL:options:error:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithContentsOfURL:options:error:",  v8,  0LL,  &v23);
    id v11 = (NSError *)v23;
    if (v10)
    {
      id v12 = -[NSData length](v10, "length");
      if (v12 >= (id)-[NSData length](self->_prefix, "length"))
      {
        id v17 = objc_autoreleasePoolPush();
        if (-[NSData rangeOfData:options:range:]( v10,  "rangeOfData:options:range:",  self->_prefix,  2LL,  0LL,  -[NSData length](self->_prefix, "length")))
        {
          v18 = objc_alloc(&OBJC_CLASS___NSError);
          NSErrorUserInfoKey v26 = NSLocalizedRecoverySuggestionErrorKey;
          v27 = @"Invalid pseudo-encryption prefix";
          v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
          v20 = -[NSError initWithDomain:code:userInfo:]( v18,  "initWithDomain:code:userInfo:",  @"CPLComputeStateEncryptionError",  3LL,  v19);
          unsigned __int8 v16 = 0;
        }

        else
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue( -[NSData subdataWithRange:]( v10,  "subdataWithRange:",  -[NSData length](self->_prefix, "length"),  (_BYTE *)-[NSData length](v10, "length")
                          - (_BYTE *)-[NSData length](self->_prefix, "length")));
          v22 = v11;
          unsigned __int8 v16 = [v19 writeToURL:v9 options:1 error:&v22];
          v20 = v22;
        }

        objc_autoreleasePoolPop(v17);
        id v11 = v20;
        if (!a5) {
          goto LABEL_15;
        }
      }

      else
      {
        unsigned __int8 v13 = objc_alloc(&OBJC_CLASS___NSError);
        NSErrorUserInfoKey v24 = NSLocalizedRecoverySuggestionErrorKey;
        v25 = @"File is too short";
        id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
        v15 = -[NSError initWithDomain:code:userInfo:]( v13,  "initWithDomain:code:userInfo:",  @"CPLComputeStateEncryptionError",  3LL,  v14);

        unsigned __int8 v16 = 0;
        id v11 = v15;
        if (!a5)
        {
LABEL_15:

          goto LABEL_16;
        }
      }
    }

    else
    {
      unsigned __int8 v16 = 0;
      if (!a5) {
        goto LABEL_15;
      }
    }

    if ((v16 & 1) == 0) {
      *a5 = v11;
    }
    goto LABEL_15;
  }

  unsigned __int8 v16 = -[NSFileManager cplCopyItemAtURL:toURL:error:]( self->_fm,  "cplCopyItemAtURL:toURL:error:",  v8,  v9,  a5);
LABEL_16:

  return v16;
}

- (NSData)prefix
{
  return self->_prefix;
}

- (void).cxx_destruct
{
}

@end