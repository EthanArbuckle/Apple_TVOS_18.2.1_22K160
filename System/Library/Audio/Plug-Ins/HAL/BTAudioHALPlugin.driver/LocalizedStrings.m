@interface LocalizedStrings
- (LocalizedStrings)init;
- (NSString)spatialFormat;
- (void)dealloc;
@end

@implementation LocalizedStrings

- (LocalizedStrings)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___LocalizedStrings;
  v2 = -[LocalizedStrings init](&v5, "init");
  v3 = v2;
  if (v2) {
    v2->_spatialFormat = -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v2)),  "localizedStringForKey:value:table:",  @"SPATIAL_AUDIO",  &stru_84880,  @"SpatialAudio");
  }
  return v3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___LocalizedStrings;
  -[LocalizedStrings dealloc](&v2, "dealloc");
}

- (NSString)spatialFormat
{
  return self->_spatialFormat;
}

@end