@interface TVSSSleepTimerContent
- (Class)preferredVisualizerViewClass;
- (NSString)description;
- (TVSSSleepTimerContent)initWithSleepTimerController:(id)a3;
- (TVSSSleepTimerController)sleepTimerController;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation TVSSSleepTimerContent

- (TVSSSleepTimerContent)initWithSleepTimerController:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0LL;
  v6.receiver = v3;
  v6.super_class = (Class)&OBJC_CLASS___TVSSSleepTimerContent;
  v8 = -[TVSSSleepTimerContent init](&v6, "init");
  objc_storeStrong((id *)&v8, v8);
  if (v8) {
    objc_storeStrong((id *)&v8->_sleepTimerController, location[0]);
  }
  v5 = v8;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v8, 0LL);
  return v5;
}

- (Class)preferredVisualizerViewClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___TVSSSleepTimerContentView);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (NSString)description
{
  objc_super v6 = self;
  v5[1] = (id)a2;
  v5[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  id v2 = [v5[0] appendPointer:v6->_sleepTimerController withName:@"sleepTimerController"];
  id v4 = [v5[0] build];
  objc_storeStrong(v5, 0LL);
  return (NSString *)v4;
}

- (TVSSSleepTimerController)sleepTimerController
{
  return self->_sleepTimerController;
}

- (void).cxx_destruct
{
}

@end