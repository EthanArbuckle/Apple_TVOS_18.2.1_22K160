@interface CPLPrequeliteDownloadResource
- (CPLPrequeliteDownloadResource)initWithResource:(id)a3;
- (CPLPrequeliteDownloadResource)resourceWithDownloadQueue:(id)a3;
- (NSString)fileUTI;
- (NSString)fingerPrint;
- (NSString)itemIdentifier;
- (id)initFromPQLResultSet:(id)a3 error:(id *)a4;
- (int)retryCount;
- (int)status;
- (int64_t)scopeIndex;
- (unint64_t)fileSize;
- (unint64_t)intent;
- (unint64_t)position;
- (unint64_t)resourceType;
- (unint64_t)taskIdentifier;
- (void)setFileSize:(unint64_t)a3;
- (void)setFileUTI:(id)a3;
- (void)setFingerPrint:(id)a3;
- (void)setIntent:(unint64_t)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setPosition:(unint64_t)a3;
- (void)setResourceType:(unint64_t)a3;
- (void)setRetryCount:(int)a3;
- (void)setScopeIndex:(int64_t)a3;
- (void)setStatus:(int)a3;
- (void)setTaskIdentifier:(unint64_t)a3;
@end

@implementation CPLPrequeliteDownloadResource

- (id)initFromPQLResultSet:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CPLPrequeliteDownloadResource;
  v6 = -[CPLPrequeliteDownloadResource init](&v14, "init");
  if (v6)
  {
    v6->_position = (unint64_t)[v5 integerAtIndex:0];
    v6->_scopeIndex = (int64_t)[v5 integerAtIndex:1];
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 stringAtIndex:2]);
    itemIdentifier = v6->_itemIdentifier;
    v6->_itemIdentifier = (NSString *)v7;

    v6->_resourceType = (int)[v5 intAtIndex:3];
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v5 stringAtIndex:4]);
    fingerPrint = v6->_fingerPrint;
    v6->_fingerPrint = (NSString *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue([v5 stringAtIndex:5]);
    fileUTI = v6->_fileUTI;
    v6->_fileUTI = (NSString *)v11;

    v6->_fileSize = (unint64_t)[v5 unsignedIntegerAtIndex:6];
    v6->_taskIdentifier = (unint64_t)[v5 integerAtIndex:7];
    v6->_retryCount = [v5 intAtIndex:8];
    v6->_status = [v5 intAtIndex:9];
    v6->_intent = (int)[v5 intAtIndex:10];
  }

  return v6;
}

- (CPLPrequeliteDownloadResource)initWithResource:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CPLPrequeliteDownloadResource;
  id v5 = -[CPLPrequeliteDownloadResource init](&v18, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 itemScopedIdentifier]);
    id v7 = [v6 scopeIndex];
    v5->_scopeIndex = (int64_t)v7;
    if (v7 == (id)0x7FFFFFFFFFFFFFFFLL) {
      sub_10019B8A4();
    }
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 identifier]);
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v8;

    v5->_resourceType = (unint64_t)[v4 resourceType];
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 identity]);
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 fingerPrint]);
    fingerPrint = v5->_fingerPrint;
    v5->_fingerPrint = (NSString *)v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue([v4 identity]);
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 fileUTI]);
    fileUTI = v5->_fileUTI;
    v5->_fileUTI = (NSString *)v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue([v4 identity]);
    v5->_fileSize = (unint64_t)[v16 fileSize];

    v5->_taskIdentifier = (unint64_t)[v4 _backgroundDownloadTaskIdentifier];
    v5->_intent = 1LL;
  }

  return v5;
}

- (CPLPrequeliteDownloadResource)resourceWithDownloadQueue:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( [a3 scopedIdentifierForLocalIdentifier:self->_itemIdentifier scopeIndex:self->_scopeIndex]);
  if (v4)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___CPLResourceIdentity);
    -[CPLResourceIdentity setFingerPrint:](v5, "setFingerPrint:", self->_fingerPrint);
    -[CPLResourceIdentity setFileUTI:](v5, "setFileUTI:", self->_fileUTI);
    -[CPLResourceIdentity setFileSize:](v5, "setFileSize:", self->_fileSize);
    v6 = -[CPLResource initWithResourceIdentity:itemScopedIdentifier:resourceType:]( objc_alloc(&OBJC_CLASS___CPLResource),  "initWithResourceIdentity:itemScopedIdentifier:resourceType:",  v5,  v4,  self->_resourceType);
    -[CPLResource _setBackgroundDownloadTaskIdentifier:]( v6,  "_setBackgroundDownloadTaskIdentifier:",  self->_taskIdentifier);
  }

  else
  {
    v6 = 0LL;
  }

  return (CPLPrequeliteDownloadResource *)v6;
}

- (unint64_t)position
{
  return self->_position;
}

- (void)setPosition:(unint64_t)a3
{
  self->_position = a3;
}

- (int64_t)scopeIndex
{
  return self->_scopeIndex;
}

- (void)setScopeIndex:(int64_t)a3
{
  self->_scopeIndex = a3;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (unint64_t)resourceType
{
  return self->_resourceType;
}

- (void)setResourceType:(unint64_t)a3
{
  self->_resourceType = a3;
}

- (NSString)fingerPrint
{
  return self->_fingerPrint;
}

- (void)setFingerPrint:(id)a3
{
}

- (NSString)fileUTI
{
  return self->_fileUTI;
}

- (void)setFileUTI:(id)a3
{
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(unint64_t)a3
{
  self->_fileSize = a3;
}

- (unint64_t)taskIdentifier
{
  return self->_taskIdentifier;
}

- (void)setTaskIdentifier:(unint64_t)a3
{
  self->_taskIdentifier = a3;
}

- (int)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int)a3
{
  self->_retryCount = a3;
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (unint64_t)intent
{
  return self->_intent;
}

- (void)setIntent:(unint64_t)a3
{
  self->_intent = a3;
}

- (void).cxx_destruct
{
}

@end