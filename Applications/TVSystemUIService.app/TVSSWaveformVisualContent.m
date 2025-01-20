@interface TVSSWaveformVisualContent
+ (id)staticWaveform;
- (BOOL)isStaticWaveform;
- (Class)preferredVisualizerViewClass;
- (NSString)description;
- (TVSSWaveformController)waveformController;
- (TVSSWaveformVisualContent)initWithWaveformController:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation TVSSWaveformVisualContent

+ (id)staticWaveform
{
  return [objc_alloc((Class)a1) initWithWaveformController:0];
}

- (TVSSWaveformVisualContent)initWithWaveformController:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0LL;
  v6.receiver = v3;
  v6.super_class = (Class)&OBJC_CLASS___TVSSWaveformVisualContent;
  v8 = -[TVSSWaveformVisualContent init](&v6, "init");
  objc_storeStrong((id *)&v8, v8);
  if (v8)
  {
    objc_storeStrong((id *)&v8->_waveformController, location[0]);
    v8->_staticWaveform = v8->_waveformController == 0LL;
  }

  v5 = v8;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v8, 0LL);
  return v5;
}

- (Class)preferredVisualizerViewClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___TVSSWaveformContentView);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (NSString)description
{
  v7 = self;
  v6[1] = (id)a2;
  v6[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  id v2 = [v6[0] appendPointer:v7->_waveformController withName:@"waveformController"];
  id v3 = [v6[0] appendBool:v7->_staticWaveform withName:@"staticWaveform"];
  id v5 = [v6[0] build];
  objc_storeStrong(v6, 0LL);
  return (NSString *)v5;
}

- (TVSSWaveformController)waveformController
{
  return self->_waveformController;
}

- (BOOL)isStaticWaveform
{
  return self->_staticWaveform;
}

- (void).cxx_destruct
{
}

@end