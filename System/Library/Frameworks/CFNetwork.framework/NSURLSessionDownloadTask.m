@interface NSURLSessionDownloadTask
- (NSURLSessionDownloadTask)init;
- (void)cancelByProducingResumeData:(void *)completionHandler;
@end

@implementation NSURLSessionDownloadTask

- (NSURLSessionDownloadTask)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSURLSessionDownloadTask;
  return -[NSURLSessionTask init](&v3, sel_init);
}

- (void)cancelByProducingResumeData:(void *)completionHandler
{
}

@end