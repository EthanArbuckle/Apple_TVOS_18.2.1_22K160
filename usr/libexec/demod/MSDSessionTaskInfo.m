@interface MSDSessionTaskInfo
- (BOOL)isValid;
- (NSData)postData;
- (NSMutableURLRequest)request;
- (NSString)postFile;
- (NSString)savePath;
- (id)description;
- (id)handler;
- (int64_t)maxRetry;
- (void)setHandler:(id)a3;
- (void)setMaxRetry:(int64_t)a3;
- (void)setPostData:(id)a3;
- (void)setPostFile:(id)a3;
- (void)setRequest:(id)a3;
- (void)setSavePath:(id)a3;
@end

@implementation MSDSessionTaskInfo

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskInfo request](self, "request"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: request=%@>",  v5,  v6));

  return v7;
}

- (BOOL)isValid
{
  return 1;
}

- (int64_t)maxRetry
{
  return self->_maxRetry;
}

- (void)setMaxRetry:(int64_t)a3
{
  self->_maxRetry = a3;
}

- (NSString)savePath
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setSavePath:(id)a3
{
}

- (NSData)postData
{
  return (NSData *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setPostData:(id)a3
{
}

- (NSString)postFile
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setPostFile:(id)a3
{
}

- (id)handler
{
  return objc_getProperty(self, a2, 40LL, 1);
}

- (void)setHandler:(id)a3
{
}

- (NSMutableURLRequest)request
{
  return (NSMutableURLRequest *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end