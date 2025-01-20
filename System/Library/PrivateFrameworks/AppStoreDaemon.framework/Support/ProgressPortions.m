@interface ProgressPortions
- (id)description;
@end

@implementation ProgressPortions

- (id)description
{
  double postProcessPortion = self->_postProcessPortion;
  double installPortion = self->_installPortion;
  if (postProcessPortion <= 0.0) {
    v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{ %.2f : %.2f }",  *(void *)&self->_downloadPortion,  *(void *)&installPortion,  v6,  v7);
  }
  else {
    v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{ %.2f : %.2f : %.2f }(%lld)",  *(void *)&self->_downloadPortion,  *(void *)&installPortion,  *(void *)&postProcessPortion,  self->_essentialBackgroundAssetAllowance);
  }
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

@end