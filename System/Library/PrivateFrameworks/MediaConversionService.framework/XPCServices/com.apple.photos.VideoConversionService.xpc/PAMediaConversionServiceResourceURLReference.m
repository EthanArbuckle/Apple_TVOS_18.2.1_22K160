@interface PAMediaConversionServiceResourceURLReference
+ (BOOL)getPathHash:(unint64_t *)a3 lastPathComponent:(id *)a4 forDictionaryRepresentation:(id)a5;
+ (id)referenceWithDictionaryRepresentation:(id)a3 error:(id *)a4;
+ (id)referenceWithURL:(id)a3;
- (BOOL)getFileSize:(unint64_t *)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)mustStopAccessingURL;
- (BOOL)shouldDeleteOnDeallocation;
- (NSURL)url;
- (id)dictionaryRepresentationWithError:(id *)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)getPathHash:(unint64_t *)a3 lastPathComponent:(id *)a4;
- (void)setMustStopAccessingURL:(BOOL)a3;
- (void)setShouldDeleteOnDeallocation:(BOOL)a3;
- (void)setUrl:(id)a3;
@end

@implementation PAMediaConversionServiceResourceURLReference

- (void)getPathHash:(unint64_t *)a3 lastPathComponent:(id *)a4
{
  url = self->_url;
  if (!url)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v10 handleFailureInMethod:a2 object:self file:@"PAMediaConversionServiceResourceURLCollection.m" lineNumber:82 description:@"Unexpected nil resource reference URL"];

    url = self->_url;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](url, "path"));
  id v11 = v8;
  if (a3)
  {
    *a3 = (unint64_t)[v8 hash];
    v8 = v11;
  }

  if (a4)
  {
    *a4 = (id)objc_claimAutoreleasedReturnValue([v11 lastPathComponent]);
    v8 = v11;
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 url]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_url, "path"));
  unsigned __int8 v7 = [v5 isEqual:v6];

  return v7;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_url, "path"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)getFileSize:(unint64_t *)a3 error:(id *)a4
{
  url = self->_url;
  id v9 = 0LL;
  unsigned int v6 = -[NSURL getResourceValue:forKey:error:](url, "getResourceValue:forKey:error:", &v9, NSURLFileSizeKey, a4);
  BOOL v7 = v6;
  if (a3 && v6) {
    *a3 = (unint64_t)[v9 unsignedLongLongValue];
  }
  return v7;
}

- (void)dealloc
{
  if (self->_shouldDeleteOnDeallocation)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_url, "path"));
    unsigned int v5 = [v3 fileExistsAtPath:v4];

    if (v5)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_url, "path"));
        *(_DWORD *)buf = 138412290;
        v14 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Deleting temporary file %@",  buf,  0xCu);
      }

      url = self->_url;
      id v12 = 0LL;
      unsigned __int8 v8 = [v3 removeItemAtURL:url error:&v12];
      id v9 = v12;
      if ((v8 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_url, "path"));
        *(_DWORD *)buf = 138412546;
        v14 = v10;
        __int16 v15 = 2112;
        id v16 = v9;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to delete temporary file %@: %@",  buf,  0x16u);
      }
    }
  }

  if (self->_mustStopAccessingURL) {
    -[NSURL stopAccessingSecurityScopedResource](self->_url, "stopAccessingSecurityScopedResource");
  }
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PAMediaConversionServiceResourceURLReference;
  -[PAMediaConversionServiceResourceURLReference dealloc](&v11, "dealloc");
}

- (id)dictionaryRepresentationWithError:(id *)a3
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue( -[NSURL bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:]( self->_url,  "bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:",  0x20000000LL,  0LL,  0LL,  a3));
  v4 = (void *)v3;
  if (v3)
  {
    BOOL v7 = @"bookmarkData";
    uint64_t v8 = v3;
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  }

  else
  {
    unsigned int v5 = 0LL;
  }

  return v5;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setUrl:(id)a3
{
}

- (BOOL)mustStopAccessingURL
{
  return self->_mustStopAccessingURL;
}

- (void)setMustStopAccessingURL:(BOOL)a3
{
  self->_mustStopAccessingURL = a3;
}

- (BOOL)shouldDeleteOnDeallocation
{
  return self->_shouldDeleteOnDeallocation;
}

- (void)setShouldDeleteOnDeallocation:(BOOL)a3
{
  self->_shouldDeleteOnDeallocation = a3;
}

- (void).cxx_destruct
{
}

+ (id)referenceWithURL:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v9 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceResourceURLCollection.m", 29, @"Invalid parameter not satisfying: %@", @"url" object file lineNumber description];
  }

  BOOL v7 = (void *)objc_opt_new(&OBJC_CLASS___PAMediaConversionServiceResourceURLReference, v5);
  [v7 setUrl:v6];

  return v7;
}

+ (id)referenceWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"bookmarkData"]);
  if (!v7)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v12 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceResourceURLCollection.m", 38, @"Invalid parameter not satisfying: %@", @"bookmarkData" object file lineNumber description];
  }

  id v13 = 0LL;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:]( &OBJC_CLASS___NSURL,  "URLByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:",  v7,  0LL,  0LL,  0LL,  &v13));
  id v9 = v13;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([a1 referenceWithURL:v8]);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Unable to decode URL reference bookmark data: %@",  buf,  0xCu);
    }

    v10 = 0LL;
    if (a4) {
      *a4 = v9;
    }
  }

  return v10;
}

+ (BOOL)getPathHash:(unint64_t *)a3 lastPathComponent:(id *)a4 forDictionaryRepresentation:(id)a5
{
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a5 objectForKeyedSubscript:@"bookmarkData"]);
  if (!v9)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v15 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceResourceURLCollection.m", 60, @"Invalid parameter not satisfying: %@", @"bookmarkData" object file lineNumber description];
  }

  id v16 = 0LL;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:]( &OBJC_CLASS___NSURL,  "URLByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:",  v9,  256LL,  0LL,  0LL,  &v16));
  id v11 = v16;
  if (v10)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);
    id v13 = v12;
    if (a3) {
      *a3 = (unint64_t)[v12 hash];
    }
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue([v13 lastPathComponent]);
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v11;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to decode bookmark data to get hash/filename: %@",  buf,  0xCu);
  }

  return v10 != 0LL;
}

@end