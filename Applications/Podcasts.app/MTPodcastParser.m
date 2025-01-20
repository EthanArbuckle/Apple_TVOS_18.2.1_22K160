@interface MTPodcastParser
- (MTPodcastParser)init;
- (id)dateFromRSSDateString:(id)a3;
@end

@implementation MTPodcastParser

- (MTPodcastParser)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTPodcastParser;
  v2 = -[MTPodcastParser init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___MTDateParser);
    dateParser = v2->_dateParser;
    v2->_dateParser = v3;
  }

  return v2;
}

- (id)dateFromRSSDateString:(id)a3
{
  return -[MTDateParser dateFromRSSDateString:](self->_dateParser, "dateFromRSSDateString:", a3);
}

- (void).cxx_destruct
{
}

@end