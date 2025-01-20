@interface VOTSpeechRotor
- (VOTSpeechRotor)init;
@end

@implementation VOTSpeechRotor

- (VOTSpeechRotor)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VOTSpeechRotor;
  v2 = -[VOTRotor init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    sub_1000D4914(v2->super._currentRotors, (const void *)0x48);
    sub_1000D4914(v3->super._currentRotors, (const void *)0x49);
    sub_1000D4914(v3->super._currentRotors, (const void *)0x4D);
    sub_1000D4914(v3->super._currentRotors, (const void *)0x4A);
    sub_1000D4914(v3->super._currentRotors, (const void *)0x4E);
    sub_1000D4914(v3->super._currentRotors, (const void *)0x4B);
    sub_1000D4914(v3->super._currentRotors, (const void *)0x4C);
    sub_1000D4914(v3->super._currentRotors, (const void *)0x4F);
    sub_1000D4914(v3->super._currentRotors, (const void *)0x50);
    v4 = v3;
  }

  return v3;
}

@end