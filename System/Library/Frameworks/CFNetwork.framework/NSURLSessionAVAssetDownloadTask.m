@interface NSURLSessionAVAssetDownloadTask
- (NSURL)URL;
- (NSURL)destinationURL;
- (unint64_t)AVAssetDownloadToken;
@end

@implementation NSURLSessionAVAssetDownloadTask

- (NSURL)URL
{
  return 0LL;
}

- (NSURL)destinationURL
{
  return 0LL;
}

- (unint64_t)AVAssetDownloadToken
{
  return self->_AVAssetDownloadToken;
}

@end