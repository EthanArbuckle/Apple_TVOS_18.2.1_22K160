@interface CPLBucketFileStorageItem
- (BOOL)isMarkedForDelete;
- (BOOL)isOriginal;
- (CPLBucketFileStorageItem)initWithIdentity:(id)a3 url:(id)a4;
- (void)_cacheAttributes;
@end

@implementation CPLBucketFileStorageItem

- (CPLBucketFileStorageItem)initWithIdentity:(id)a3 url:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CPLBucketFileStorageItem;
  v7 = -[CPLBucketFileStorageItem initWithIdentity:original:markedForDelete:lastAccessDate:]( &v11,  "initWithIdentity:original:markedForDelete:lastAccessDate:",  a3,  0LL,  0LL,  0LL);
  if (v7)
  {
    v8 = (NSURL *)[v6 copy];
    url = v7->_url;
    v7->_url = v8;
  }

  return v7;
}

- (void)_cacheAttributes
{
  v3 = -[NSURL fileSystemRepresentation](self->_url, "fileSystemRepresentation");
  uint64_t v4 = open(v3, 0);
  if ((v4 & 0x80000000) != 0)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v7 = __CPLGenericOSLogDomain(v4);
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = __error();
        v10 = strerror(*v9);
        int v11 = *__error();
        int v13 = 136315650;
        v14 = v3;
        __int16 v15 = 2080;
        v16 = v10;
        __int16 v17 = 1024;
        int v18 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Can't read attributes at %s: %s (%i)",  (uint8_t *)&v13,  0x1Cu);
      }
    }
  }

  else
  {
    int v5 = v4;
    BOOL v6 = fgetxattr(v4, "com.apple.cpl.original", 0LL, 0xFFFFFFFFFFFFFFFFLL, 0, 0) > 0 || *__error() != 93;
    self->_cachedOriginal = v6;
    if (fgetxattr(v5, "com.apple.cpl.delete", 0LL, 0xFFFFFFFFFFFFFFFFLL, 0, 0) <= 0)
    {
      __error();
      BOOL v12 = 0;
    }

    else
    {
      BOOL v12 = 1;
    }

    self->_cachedMarkedForDelete = v12;
    close(v5);
  }

  self->_attributesAreCached = 1;
}

- (BOOL)isOriginal
{
  if (!self->_attributesAreCached) {
    -[CPLBucketFileStorageItem _cacheAttributes](self, "_cacheAttributes");
  }
  return self->_cachedOriginal;
}

- (BOOL)isMarkedForDelete
{
  if (!self->_attributesAreCached) {
    -[CPLBucketFileStorageItem _cacheAttributes](self, "_cacheAttributes");
  }
  return self->_cachedMarkedForDelete;
}

- (void).cxx_destruct
{
}

@end