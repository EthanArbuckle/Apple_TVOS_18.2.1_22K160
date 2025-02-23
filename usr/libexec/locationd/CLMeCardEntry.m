@interface CLMeCardEntry
- (CLLocation)meCardMapItem;
- (CLMeCardEntry)init;
- (NSString)meCardString;
- (void)setMeCardMapItem:(id)a3;
- (void)setMeCardString:(id)a3;
@end

@implementation CLMeCardEntry

- (CLMeCardEntry)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLMeCardEntry;
  result = -[CLMeCardEntry init](&v3, "init");
  result->meCardString = 0LL;
  result->meCardMapItem = 0LL;
  return result;
}

- (NSString)meCardString
{
  return self->meCardString;
}

- (void)setMeCardString:(id)a3
{
}

- (CLLocation)meCardMapItem
{
  return self->meCardMapItem;
}

- (void)setMeCardMapItem:(id)a3
{
}

@end