@interface TVMusicB39TapGestureRecognizer
+ (BOOL)isRotary;
+ (BOOL)isRotaryAndTouch;
- (BOOL)isSynthetic;
- (void)_updateSynthenticForPress:(id)a3;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation TVMusicB39TapGestureRecognizer

+ (BOOL)isRotary
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  BOOL v3 = [v2 _remoteTouchSurfaceType] == (id)2;

  return v3;
}

+ (BOOL)isRotaryAndTouch
{
  unsigned __int8 v2 = [a1 isRotary];
  BOOL v3 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.TVPeripheralServices");
  id v4 = -[NSUserDefaults integerForKey:](v3, "integerForKey:", @"RemoteClickpadMode");

  if (v4 == (id)1) {
    return 0;
  }
  else {
    return v2;
  }
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 allPresses]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 anyObject]);

  -[TVMusicB39TapGestureRecognizer _updateSynthenticForPress:](self, "_updateSynthenticForPress:", v9);
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVMusicB39TapGestureRecognizer;
  -[TVMusicB39TapGestureRecognizer pressesBegan:withEvent:](&v10, "pressesBegan:withEvent:", v7, v6);
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 allPresses]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 anyObject]);

  -[TVMusicB39TapGestureRecognizer _updateSynthenticForPress:](self, "_updateSynthenticForPress:", v9);
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVMusicB39TapGestureRecognizer;
  -[TVMusicB39TapGestureRecognizer pressesChanged:withEvent:](&v10, "pressesChanged:withEvent:", v7, v6);
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 allPresses]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 anyObject]);

  -[TVMusicB39TapGestureRecognizer _updateSynthenticForPress:](self, "_updateSynthenticForPress:", v9);
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVMusicB39TapGestureRecognizer;
  -[TVMusicB39TapGestureRecognizer pressesEnded:withEvent:](&v10, "pressesEnded:withEvent:", v7, v6);
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 allPresses]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 anyObject]);

  -[TVMusicB39TapGestureRecognizer _updateSynthenticForPress:](self, "_updateSynthenticForPress:", v9);
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVMusicB39TapGestureRecognizer;
  -[TVMusicB39TapGestureRecognizer pressesCancelled:withEvent:](&v10, "pressesCancelled:withEvent:", v7, v6);
}

- (void)_updateSynthenticForPress:(id)a3
{
  self->_synthetic = [a3 _isSynthetic];
}

- (BOOL)isSynthetic
{
  return self->_synthetic;
}

@end