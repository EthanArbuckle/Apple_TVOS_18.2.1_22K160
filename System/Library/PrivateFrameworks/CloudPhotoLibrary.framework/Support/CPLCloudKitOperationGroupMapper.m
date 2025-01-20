@interface CPLCloudKitOperationGroupMapper
- (CPLCloudKitOperationGroupMapper)initWithMappingAtURL:(id)a3;
- (CPLCloudKitOperationGroupMapper)initWithMappingInFolderWithURL:(id)a3;
- (NSArray)mappingList;
- (NSURL)mappingURL;
- (id)groupNameForGroupName:(id)a3;
@end

@implementation CPLCloudKitOperationGroupMapper

- (CPLCloudKitOperationGroupMapper)initWithMappingAtURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CPLCloudKitOperationGroupMapper;
  v5 = -[CPLCloudKitOperationGroupMapper init](&v9, "init");
  if (v5)
  {
    v6 = (NSURL *)[v4 copy];
    mappingURL = v5->_mappingURL;
    v5->_mappingURL = v6;

    v5->_lock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (CPLCloudKitOperationGroupMapper)initWithMappingInFolderWithURL:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( [a3 URLByAppendingPathComponent:@"CKOperationGroupMapping.plist" isDirectory:0]);
  v5 = -[CPLCloudKitOperationGroupMapper initWithMappingAtURL:](self, "initWithMappingAtURL:", v4);

  return v5;
}

- (id)groupNameForGroupName:(id)a3
{
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = sub_100042A6C;
  v19 = sub_100042A7C;
  id v20 = 0LL;
  p_lock = &self->_lock;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v10 = sub_100042A84;
  v11 = &unk_10023FA28;
  v12 = self;
  v14 = &v15;
  id v4 = a3;
  id v13 = v4;
  v5 = v9;
  os_unfair_lock_lock(p_lock);
  v10(v5);
  os_unfair_lock_unlock(p_lock);

  v6 = (void *)v16[5];
  if (!v6) {
    v6 = v4;
  }
  id v7 = v6;

  _Block_object_dispose(&v15, 8);
  return v7;
}

- (NSArray)mappingList
{
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = sub_100042A6C;
  v16 = sub_100042A7C;
  id v17 = 0LL;
  p_lock = &self->_lock;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v8 = sub_100042BE0;
  objc_super v9 = &unk_10023E658;
  v10 = self;
  v11 = &v12;
  v3 = v7;
  os_unfair_lock_lock(p_lock);
  v8((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  id v4 = (void *)v13[5];
  if (!v4) {
    id v4 = &__NSArray0__struct;
  }
  id v5 = v4;
  _Block_object_dispose(&v12, 8);

  return (NSArray *)v5;
}

- (NSURL)mappingURL
{
  return self->_mappingURL;
}

- (void).cxx_destruct
{
}

@end