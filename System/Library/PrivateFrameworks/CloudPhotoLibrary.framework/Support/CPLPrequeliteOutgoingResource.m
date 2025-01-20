@interface CPLPrequeliteOutgoingResource
- (CPLPrequeliteOutgoingResource)initWithResource:(id)a3 uploadIdentifier:(id)a4;
- (CPLPrequeliteOutgoingResource)resourceWithOutgoingResources:(id)a3;
- (CPLPrequeliteOutgoingResource)resourceWithScopeIdentifier:(id)a3;
- (NSString)fileUTI;
- (NSString)fingerPrint;
- (NSString)itemIdentifier;
- (NSString)uploadIdentifier;
- (id)initFromPQLResultSet:(id)a3 error:(id *)a4;
- (int)fileKind;
- (int64_t)scopeIndex;
- (unint64_t)fileSize;
- (unint64_t)resourceType;
- (void)setFileKind:(int)a3;
- (void)setFileSize:(unint64_t)a3;
- (void)setFileUTI:(id)a3;
- (void)setFingerPrint:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setResourceType:(unint64_t)a3;
- (void)setScopeIndex:(int64_t)a3;
- (void)setUploadIdentifier:(id)a3;
@end

@implementation CPLPrequeliteOutgoingResource

- (id)initFromPQLResultSet:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___CPLPrequeliteOutgoingResource;
  v6 = -[CPLPrequeliteOutgoingResource init](&v16, "init");
  if (v6)
  {
    v6->_scopeIndex = (int64_t)[v5 integerAtIndex:0];
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 stringAtIndex:1]);
    itemIdentifier = v6->_itemIdentifier;
    v6->_itemIdentifier = (NSString *)v7;

    v6->_resourceType = (int)[v5 intAtIndex:2];
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v5 stringAtIndex:3]);
    fingerPrint = v6->_fingerPrint;
    v6->_fingerPrint = (NSString *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue([v5 stringAtIndex:4]);
    fileUTI = v6->_fileUTI;
    v6->_fileUTI = (NSString *)v11;

    v6->_fileKind = [v5 intAtIndex:5];
    v6->_fileSize = (unint64_t)[v5 unsignedIntegerAtIndex:6];
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v5 stringAtIndex:7]);
    uploadIdentifier = v6->_uploadIdentifier;
    v6->_uploadIdentifier = (NSString *)v13;
  }

  return v6;
}

- (CPLPrequeliteOutgoingResource)initWithResource:(id)a3 uploadIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___CPLPrequeliteOutgoingResource;
  uint64_t v9 = -[CPLPrequeliteOutgoingResource init](&v28, "init");
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v7 itemScopedIdentifier]);
    id v11 = [v10 scopeIndex];
    if (v11 == (id)0x7FFFFFFFFFFFFFFFLL) {
      sub_10019AF8C((uint64_t)a2, (uint64_t)v9);
    }
    v9->_scopeIndex = (int64_t)v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
    uint64_t v13 = (NSString *)[v12 copy];
    itemIdentifier = v9->_itemIdentifier;
    v9->_itemIdentifier = v13;

    v9->_resourceType = (unint64_t)[v7 resourceType];
    v15 = (void *)objc_claimAutoreleasedReturnValue([v7 identity]);
    objc_super v16 = (void *)objc_claimAutoreleasedReturnValue([v15 fingerPrint]);
    v17 = (NSString *)[v16 copy];
    fingerPrint = v9->_fingerPrint;
    v9->_fingerPrint = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue([v15 fileUTI]);
    v20 = (NSString *)[v19 copy];
    fileUTI = v9->_fileUTI;
    v9->_fileUTI = v20;

    if (v9->_fileUTI)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithIdentifier:](&OBJC_CLASS___UTType, "typeWithIdentifier:"));
      v23 = v22;
      if (v9->_resourceType != 1)
      {
LABEL_13:
        v9->_fileSize = (unint64_t)[v15 fileSize];
        v25 = (NSString *)[v8 copy];
        uploadIdentifier = v9->_uploadIdentifier;
        v9->_uploadIdentifier = v25;

        goto LABEL_14;
      }

      if (v22)
      {
        if ([v22 conformsToType:UTTypeImage])
        {
          v9->_fileKind = 0;
          goto LABEL_13;
        }

        if ([v23 conformsToType:UTTypeMovie])
        {
          int v24 = 1;
          goto LABEL_11;
        }

- (CPLPrequeliteOutgoingResource)resourceWithOutgoingResources:(id)a3
{
  v4 = (CPLScopedIdentifier *)objc_claimAutoreleasedReturnValue( [a3 scopedIdentifierForLocalIdentifier:self->_itemIdentifier scopeIndex:self->_scopeIndex]);
  if (!v4) {
    v4 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:scopeIndex:]( objc_alloc(&OBJC_CLASS___CPLScopedIdentifier),  "initWithScopeIdentifier:identifier:scopeIndex:",  @"<DELETED_SCOPE>",  self->_itemIdentifier,  self->_scopeIndex);
  }
  id v5 = objc_alloc_init(&OBJC_CLASS___CPLResourceIdentity);
  -[CPLResourceIdentity setFingerPrint:](v5, "setFingerPrint:", self->_fingerPrint);
  -[CPLResourceIdentity setFileUTI:](v5, "setFileUTI:", self->_fileUTI);
  -[CPLResourceIdentity setFileSize:](v5, "setFileSize:", self->_fileSize);
  -[CPLResourceIdentity setAvailable:](v5, "setAvailable:", 1LL);
  v6 = -[CPLResource initWithResourceIdentity:itemScopedIdentifier:resourceType:]( objc_alloc(&OBJC_CLASS___CPLResource),  "initWithResourceIdentity:itemScopedIdentifier:resourceType:",  v5,  v4,  self->_resourceType);

  return (CPLPrequeliteOutgoingResource *)v6;
}

- (CPLPrequeliteOutgoingResource)resourceWithScopeIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:]( objc_alloc(&OBJC_CLASS___CPLScopedIdentifier),  "initWithScopeIdentifier:identifier:",  v4,  self->_itemIdentifier);

  v6 = objc_alloc_init(&OBJC_CLASS___CPLResourceIdentity);
  -[CPLResourceIdentity setFingerPrint:](v6, "setFingerPrint:", self->_fingerPrint);
  -[CPLResourceIdentity setFileUTI:](v6, "setFileUTI:", self->_fileUTI);
  -[CPLResourceIdentity setFileSize:](v6, "setFileSize:", self->_fileSize);
  -[CPLResourceIdentity setAvailable:](v6, "setAvailable:", 1LL);
  id v7 = -[CPLResource initWithResourceIdentity:itemScopedIdentifier:resourceType:]( objc_alloc(&OBJC_CLASS___CPLResource),  "initWithResourceIdentity:itemScopedIdentifier:resourceType:",  v6,  v5,  self->_resourceType);

  return (CPLPrequeliteOutgoingResource *)v7;
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

- (int)fileKind
{
  return self->_fileKind;
}

- (void)setFileKind:(int)a3
{
  self->_fileKind = a3;
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(unint64_t)a3
{
  self->_fileSize = a3;
}

- (NSString)uploadIdentifier
{
  return self->_uploadIdentifier;
}

- (void)setUploadIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end