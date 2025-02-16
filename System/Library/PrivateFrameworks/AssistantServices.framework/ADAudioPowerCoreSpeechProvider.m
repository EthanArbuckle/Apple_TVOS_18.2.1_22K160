@interface ADAudioPowerCoreSpeechProvider
- (ADAudioPowerCoreSpeechProvider)initWithChannel:(unint64_t)a3 speechController:(id)a4;
- (BOOL)getAveragePower:(float *)a3 andPeakPower:(float *)a4;
- (void)willBeginAccessPower;
@end

@implementation ADAudioPowerCoreSpeechProvider

- (ADAudioPowerCoreSpeechProvider)initWithChannel:(unint64_t)a3 speechController:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ADAudioPowerCoreSpeechProvider;
  v8 = -[ADAudioPowerCoreSpeechProvider init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_channel = a3;
    objc_storeStrong((id *)&v8->_speechController, a4);
  }

  return v9;
}

- (void)willBeginAccessPower
{
}

- (BOOL)getAveragePower:(float *)a3 andPeakPower:(float *)a4
{
  speechController = self->_speechController;
  if (speechController)
  {
    if ((unint64_t)a3 | (unint64_t)a4)
    {
      -[CSSpeechController updateMeters](speechController, "updateMeters");
      if (a3)
      {
        -[CSSpeechController averagePowerForChannel:]( self->_speechController,  "averagePowerForChannel:",  self->_channel);
        *(_DWORD *)a3 = v8;
      }

      if (a4)
      {
        -[CSSpeechController peakPowerForChannel:](self->_speechController, "peakPowerForChannel:", self->_channel);
        *(_DWORD *)a4 = v9;
      }

      LOBYTE(speechController) = 1;
    }

    else
    {
      LOBYTE(speechController) = 0;
    }
  }

  return (char)speechController;
}

- (void).cxx_destruct
{
}

@end