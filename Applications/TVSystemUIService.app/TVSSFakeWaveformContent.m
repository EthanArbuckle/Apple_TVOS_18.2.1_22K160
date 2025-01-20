@interface TVSSFakeWaveformContent
+ (id)fakeWaveform;
- (CGSize)size;
- (Class)preferredVisualizerViewClass;
- (NSURL)packageURL;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation TVSSFakeWaveformContent

+ (id)fakeWaveform
{
  return objc_alloc_init((Class)a1);
}

- (NSURL)packageURL
{
  v3 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  v4 =  -[NSBundle URLForResource:withExtension:]( v3,  "URLForResource:withExtension:",  @"BouncyBars",  @"ca");

  return v4;
}

- (CGSize)size
{
  result.height = v3;
  result.width = v2;
  return result;
}

  ;
}

- (Class)preferredVisualizerViewClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___TVSSFakeWaveformContentView);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

@end