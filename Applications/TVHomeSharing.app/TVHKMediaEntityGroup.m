@interface TVHKMediaEntityGroup
- (NSString)tvh_displayTitle;
@end

@implementation TVHKMediaEntityGroup

- (NSString)tvh_displayTitle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHKMediaEntityGroup title](self, "title"));
  if ([v2 length])
  {
    id v3 = v2;
  }

  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v3 = (id)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:@"UNKNOWN_GENRE_TITLE" value:0 table:0]);
  }

  return (NSString *)v3;
}

@end