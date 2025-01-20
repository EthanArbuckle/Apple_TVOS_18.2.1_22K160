@interface MRScrapbookLayout
- (NSArray)subtract;
- (NSString)backgroundPaper;
- (NSString)frame;
- (NSString)mask;
- (void)dealloc;
- (void)setBackgroundPaper:(id)a3;
- (void)setFrame:(id)a3;
- (void)setMask:(id)a3;
- (void)setSubtract:(id)a3;
@end

@implementation MRScrapbookLayout

- (void)dealloc
{
  self->frame = 0LL;
  self->mask = 0LL;

  self->subtract = 0LL;
  self->backgroundPaper = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRScrapbookLayout;
  -[MRScrapbookLayout dealloc](&v3, "dealloc");
}

- (NSString)mask
{
  return self->mask;
}

- (void)setMask:(id)a3
{
}

- (NSString)frame
{
  return self->frame;
}

- (void)setFrame:(id)a3
{
}

- (NSArray)subtract
{
  return self->subtract;
}

- (void)setSubtract:(id)a3
{
}

- (NSString)backgroundPaper
{
  return self->backgroundPaper;
}

- (void)setBackgroundPaper:(id)a3
{
}

@end