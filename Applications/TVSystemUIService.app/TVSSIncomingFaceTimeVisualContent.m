@interface TVSSIncomingFaceTimeVisualContent
- (CGSize)size;
- (Class)preferredVisualizerViewClass;
- (NSString)description;
- (NSURL)packageURL;
- (TVSSIncomingFaceTimeVisualContent)initWithMode:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)avMode;
- (void)setAvMode:(unint64_t)a3;
@end

@implementation TVSSIncomingFaceTimeVisualContent

- (TVSSIncomingFaceTimeVisualContent)initWithMode:(unint64_t)a3
{
  SEL v8 = a2;
  unint64_t v7 = a3;
  v9 = 0LL;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSSIncomingFaceTimeVisualContent;
  v5 = -[TVSSIncomingFaceTimeVisualContent init](&v6, "init");
  v9 = v5;
  objc_storeStrong((id *)&v9, v5);
  if (v5) {
    v9->_avMode = v7;
  }
  v4 = v9;
  objc_storeStrong((id *)&v9, 0LL);
  return v4;
}

- (NSURL)packageURL
{
  v6[2] = self;
  v6[1] = (id)a2;
  if (self->_avMode == 2) {
    v2 = @"IncomingFaceTimeVideo";
  }
  else {
    v2 = @"IncomingFaceTimeAudio";
  }
  v6[0] = v2;
  v4 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  v5 = -[NSBundle URLForResource:withExtension:](v4, "URLForResource:withExtension:", v6[0], @"ca");

  objc_storeStrong(v6, 0LL);
  return v5;
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
  return (Class)objc_opt_class(&OBJC_CLASS___TVSSIncomingFaceTimeContentView);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (NSString)description
{
  SEL v8 = self;
  v7[1] = (id)a2;
  v7[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  id v4 = v7[0];
  v5 = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v8->_avMode);
  id v2 = objc_msgSend(v4, "appendObject:withName:skipIfNil:");

  id v6 = [v7[0] build];
  objc_storeStrong(v7, 0LL);
  return (NSString *)v6;
}

- (unint64_t)avMode
{
  return self->_avMode;
}

- (void)setAvMode:(unint64_t)a3
{
  self->_avMode = a3;
}

@end