@interface ICDDeleteOnDeallocTemporaryFile
- (ICDDeleteOnDeallocTemporaryFile)initWithTemporaryFileURL:(id)a3;
- (void)dealloc;
@end

@implementation ICDDeleteOnDeallocTemporaryFile

- (ICDDeleteOnDeallocTemporaryFile)initWithTemporaryFileURL:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
  unsigned int v7 = [v5 fileExistsAtPath:v6];

  if (v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___ICDDeleteOnDeallocTemporaryFile;
    v8 = -[ICDDeleteOnDeallocTemporaryFile init](&v13, "init");
    if (v8)
    {
      v9 = (NSURL *)[v4 copy];
      fileURL = v8->_fileURL;
      v8->_fileURL = v9;
    }

    self = v8;
    v11 = self;
  }

  else
  {
    v11 = 0LL;
  }

  return v11;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  [v3 removeItemAtURL:self->_fileURL error:0];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ICDDeleteOnDeallocTemporaryFile;
  -[ICDDeleteOnDeallocTemporaryFile dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
}

@end