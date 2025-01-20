@interface TVPMediaURLCacheRecord
- (NSDate)expiration;
- (NSURL)url;
- (void)setExpiration:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation TVPMediaURLCacheRecord

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSDate)expiration
{
  return self->_expiration;
}

- (void)setExpiration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end