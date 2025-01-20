@interface PBAVKitHintRecorder
- (BOOL)metLimitForHint:(unint64_t)a3;
- (PBAVKitHintRecorder)init;
- (void)noteHintShown:(unint64_t)a3;
@end

@implementation PBAVKitHintRecorder

- (PBAVKitHintRecorder)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBAVKitHintRecorder;
  v2 = -[PBAVKitHintRecorder init](&v6, "init");
  if (v2)
  {
    v3 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.avkit");
    avKitDefaults = v2->_avKitDefaults;
    v2->_avKitDefaults = v3;
  }

  return v2;
}

- (BOOL)metLimitForHint:(unint64_t)a3
{
  return a3 == 1
      && -[NSUserDefaults integerForKey:]( self->_avKitDefaults,  "integerForKey:",  @"AVRotaryScrubAnimationHintCount",  v3,  v4) > 9;
}

- (void)noteHintShown:(unint64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v4 = -[NSUserDefaults integerForKey:]( self->_avKitDefaults,  "integerForKey:",  @"AVRotaryScrubAnimationHintCount");
    if (v4 <= 9) {
      -[NSUserDefaults setInteger:forKey:]( self->_avKitDefaults,  "setInteger:forKey:",  v4 + 1,  @"AVRotaryScrubAnimationHintCount");
    }
  }

- (void).cxx_destruct
{
}

@end