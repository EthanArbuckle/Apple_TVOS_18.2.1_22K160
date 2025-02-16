@interface DownloadSinf
- (DownloadSinf)init;
- (DownloadSinf)initWithDictionary:(id)a3;
- (id)dataForSinfDataKey:(id)a3;
- (int64_t)identifier;
- (void)dealloc;
@end

@implementation DownloadSinf

- (DownloadSinf)init
{
  return -[DownloadSinf initWithDictionary:](self, "initWithDictionary:", 0LL);
}

- (DownloadSinf)initWithDictionary:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DownloadSinf;
  v4 = -[DownloadSinf init](&v6, "init");
  if (v4) {
    v4->_info = (NSDictionary *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DownloadSinf;
  -[DownloadSinf dealloc](&v3, "dealloc");
}

- (id)dataForSinfDataKey:(id)a3
{
  return -[NSDictionary objectForKey:](self->_info, "objectForKey:", a3);
}

- (int64_t)identifier
{
  return (int)objc_msgSend(-[NSDictionary objectForKey:](self->_info, "objectForKey:", @"id"), "intValue");
}

@end