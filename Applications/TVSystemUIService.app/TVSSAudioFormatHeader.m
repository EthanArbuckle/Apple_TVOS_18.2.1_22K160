@interface TVSSAudioFormatHeader
- (NSString)contentText1;
- (NSString)contentTitle;
- (TVSSAudioFormatHeader)initWithFormat:(int64_t)a3;
- (UIImage)contentImage;
- (int64_t)format;
@end

@implementation TVSSAudioFormatHeader

- (TVSSAudioFormatHeader)initWithFormat:(int64_t)a3
{
  SEL v7 = a2;
  int64_t v6 = a3;
  v8 = 0LL;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSSAudioFormatHeader;
  v8 = -[TVSSAudioFormatHeader init](&v5, "init");
  objc_storeStrong((id *)&v8, v8);
  if (v8) {
    v8->_format = v6;
  }
  v4 = v8;
  objc_storeStrong((id *)&v8, 0LL);
  return v4;
}

- (NSString)contentTitle
{
  return (NSString *)TVSSLocString(@"TVSSAudioRoutingTitle");
}

- (NSString)contentText1
{
  if (self->_format == 1) {
    return (NSString *)TVSSLocString(@"TVSSAudioRoutingMultichannelAudioCallout");
  }
  else {
    return (NSString *)0LL;
  }
}

- (UIImage)contentImage
{
  if (self->_format == 2) {
    return +[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"DolbyAtmos");
  }
  else {
    return (UIImage *)0LL;
  }
}

- (int64_t)format
{
  return self->_format;
}

@end