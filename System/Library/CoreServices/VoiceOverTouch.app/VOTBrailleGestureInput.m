@interface VOTBrailleGestureInput
- (NSArray)seriesOfTouchPoints;
- (NSString)languageCode;
- (id)description;
- (void)setLanguageCode:(id)a3;
- (void)setSeriesOfTouchPoints:(id)a3;
@end

@implementation VOTBrailleGestureInput

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___VOTBrailleGestureInput;
  id v3 = -[VOTBrailleGestureInput description](&v9, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureInput seriesOfTouchPoints](self, "seriesOfTouchPoints"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureInput languageCode](self, "languageCode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingFormat:@" - touch points: %@, language code: %@", v5, v6]);

  return v7;
}

- (NSArray)seriesOfTouchPoints
{
  return self->_seriesOfTouchPoints;
}

- (void)setSeriesOfTouchPoints:(id)a3
{
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
}

- (void).cxx_destruct
{
}

@end