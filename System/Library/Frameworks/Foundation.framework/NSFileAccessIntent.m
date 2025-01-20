@interface NSFileAccessIntent
+ (NSFileAccessIntent)readingIntentWithURL:(NSURL *)url options:(NSFileCoordinatorReadingOptions)options;
+ (NSFileAccessIntent)writingIntentWithURL:(NSURL *)url options:(NSFileCoordinatorWritingOptions)options;
- (BOOL)isRead;
- (NSURL)URL;
- (id)description;
- (unint64_t)readingOptions;
- (unint64_t)writingOptions;
- (void)dealloc;
- (void)setURL:(id)a3;
@end

@implementation NSFileAccessIntent

+ (NSFileAccessIntent)readingIntentWithURL:(NSURL *)url options:(NSFileCoordinatorReadingOptions)options
{
  uint64_t v6 = objc_opt_new();
  *(void *)(v6 + 8) = url;
  *(void *)(v6 + 16) = options;
  *(_BYTE *)(v6 + 24) = 1;
  return (NSFileAccessIntent *)(id)v6;
}

+ (NSFileAccessIntent)writingIntentWithURL:(NSURL *)url options:(NSFileCoordinatorWritingOptions)options
{
  uint64_t v6 = objc_opt_new();
  *(void *)(v6 + 8) = url;
  *(void *)(v6 + 16) = options;
  *(_BYTE *)(v6 + 24) = 0;
  return (NSFileAccessIntent *)(id)v6;
}

- (unint64_t)readingOptions
{
  return self->_options;
}

- (unint64_t)writingOptions
{
  return self->_options;
}

- (id)description
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSFileAccessIntent;
  id v3 = -[NSFileAccessIntent description](&v6, sel_description);
  if (self->_isRead) {
    v4 = @"Reading";
  }
  else {
    v4 = @"Writing";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@ %@ with options: 0x%lx",  v3,  v4,  self->_url,  self->_options);
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFileAccessIntent;
  -[NSFileAccessIntent dealloc](&v3, sel_dealloc);
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setURL:(id)a3
{
}

- (BOOL)isRead
{
  return self->_isRead;
}

@end