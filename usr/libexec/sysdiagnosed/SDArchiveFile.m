@interface SDArchiveFile
- (NSArray)offsets;
- (NSArray)sizes;
- (NSString)fileType;
- (NSString)sourcePath;
- (NSString)targetPath;
- (SDArchiveFile)initWithPath:(id)a3 target:(id)a4 ofType:(id)a5;
- (int)fd;
- (void)setFd:(int)a3;
- (void)setFileType:(id)a3;
- (void)setOffsets:(id)a3;
- (void)setSizes:(id)a3;
- (void)setSourcePath:(id)a3;
- (void)setTargetPath:(id)a3;
@end

@implementation SDArchiveFile

- (SDArchiveFile)initWithPath:(id)a3 target:(id)a4 ofType:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___SDArchiveFile;
  v12 = -[SDArchiveFile init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sourcePath, a3);
    objc_storeStrong((id *)&v13->_targetPath, a4);
    objc_storeStrong((id *)&v13->_fileType, a5);
    offsets = v13->_offsets;
    v13->_offsets = 0LL;

    sizes = v13->_sizes;
    v13->_sizes = 0LL;

    v13->_fd = -1;
  }

  return v13;
}

- (NSString)sourcePath
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setSourcePath:(id)a3
{
}

- (NSString)targetPath
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setTargetPath:(id)a3
{
}

- (NSString)fileType
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setFileType:(id)a3
{
}

- (NSArray)offsets
{
  return (NSArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setOffsets:(id)a3
{
}

- (NSArray)sizes
{
  return (NSArray *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setSizes:(id)a3
{
}

- (int)fd
{
  return self->_fd;
}

- (void)setFd:(int)a3
{
  self->_fd = a3;
}

- (void).cxx_destruct
{
}

@end