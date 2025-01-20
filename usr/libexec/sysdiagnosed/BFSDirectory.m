@interface BFSDirectory
+ (id)BFSDirectoryWithURL:(id)a3 withDepth:(unint64_t)a4;
- (NSDirectoryEnumerator)urlEnumerator;
- (NSURL)url;
- (id)description;
- (unint64_t)remainingDepth;
- (void)setRemainingDepth:(unint64_t)a3;
- (void)setUrl:(id)a3;
- (void)setUrlEnumerator:(id)a3;
@end

@implementation BFSDirectory

+ (id)BFSDirectoryWithURL:(id)a3 withDepth:(unint64_t)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(&OBJC_CLASS___BFSDirectory);
  v7 = v6;
  if (v6)
  {
    -[BFSDirectory setUrl:](v6, "setUrl:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned __int8 v17 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
    unsigned int v10 = [v8 fileExistsAtPath:v9 isDirectory:&v17];
    int v11 = v17;

    if (v10) {
      BOOL v12 = v11 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (!v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BFSDirectory url](v7, "url"));
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  NSURLIsDirectoryKey,  NSURLNameKey,  NSURLPathKey,  0LL));
      v15 = (void *)objc_claimAutoreleasedReturnValue( [v8 enumeratorAtURL:v13 includingPropertiesForKeys:v14 options:7 errorHandler:&stru_100088F80]);
      -[BFSDirectory setUrlEnumerator:](v7, "setUrlEnumerator:", v15);
    }

    -[BFSDirectory setRemainingDepth:](v7, "setRemainingDepth:", a4);
  }

  return v7;
}

- (id)description
{
  unint64_t v3 = -[BFSDirectory remainingDepth](self, "remainingDepth");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BFSDirectory urlEnumerator](self, "urlEnumerator"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lu %@", v3, v4));

  return v5;
}

- (NSDirectoryEnumerator)urlEnumerator
{
  return (NSDirectoryEnumerator *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setUrlEnumerator:(id)a3
{
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setUrl:(id)a3
{
}

- (unint64_t)remainingDepth
{
  return self->_remainingDepth;
}

- (void)setRemainingDepth:(unint64_t)a3
{
  self->_remainingDepth = a3;
}

- (void).cxx_destruct
{
}

@end