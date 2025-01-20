@interface CKKSPBFileStorage
- (CKKSPBCodable)protobufStorage;
- (CKKSPBFileStorage)initWithStoragePath:(id)a3 storageClass:(Class)a4;
- (Class)storageClass;
- (NSURL)storageFile;
- (id)storage;
- (void)setProtobufStorage:(id)a3;
- (void)setStorage:(id)a3;
- (void)setStorageClass:(Class)a3;
- (void)setStorageFile:(id)a3;
@end

@implementation CKKSPBFileStorage

- (CKKSPBFileStorage)initWithStoragePath:(id)a3 storageClass:(Class)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CKKSPBFileStorage;
  v7 = -[CKKSPBFileStorage init](&v15, "init");
  v8 = v7;
  if (v7)
  {
    -[CKKSPBFileStorage setStorageFile:](v7, "setStorageFile:", v6);
    -[CKKSPBFileStorage setStorageClass:](v8, "setStorageClass:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](&OBJC_CLASS___NSData, "dataWithContentsOfURL:", v6));
    if (v9)
    {
      v10 = -[objc_class initWithData:]( -[objc_class alloc](-[CKKSPBFileStorage storageClass](v8, "storageClass"), "alloc"),  "initWithData:",  v9);
      -[CKKSPBFileStorage setProtobufStorage:](v8, "setProtobufStorage:", v10);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSPBFileStorage protobufStorage](v8, "protobufStorage"));

    if (!v11)
    {
      v12 = -[objc_class init]( -[objc_class alloc](-[CKKSPBFileStorage storageClass](v8, "storageClass"), "alloc"),  "init");
      -[CKKSPBFileStorage setProtobufStorage:](v8, "setProtobufStorage:", v12);
    }

    v13 = v8;
  }

  return v8;
}

- (id)storage
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSPBFileStorage protobufStorage](v2, "protobufStorage"));
  objc_sync_exit(v2);

  return v3;
}

- (void)setStorage:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v9 = v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v9 data]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSPBFileStorage storageFile](v5, "storageFile"));
  [v6 writeToURL:v7 atomically:1];

  v8 = -[objc_class initWithData:]( -[objc_class alloc](-[CKKSPBFileStorage storageClass](v5, "storageClass"), "alloc"),  "initWithData:",  v6);
  -[CKKSPBFileStorage setProtobufStorage:](v5, "setProtobufStorage:", v8);

  objc_sync_exit(v5);
}

- (NSURL)storageFile
{
  return (NSURL *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setStorageFile:(id)a3
{
}

- (Class)storageClass
{
  return (Class)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setStorageClass:(Class)a3
{
}

- (CKKSPBCodable)protobufStorage
{
  return (CKKSPBCodable *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setProtobufStorage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end