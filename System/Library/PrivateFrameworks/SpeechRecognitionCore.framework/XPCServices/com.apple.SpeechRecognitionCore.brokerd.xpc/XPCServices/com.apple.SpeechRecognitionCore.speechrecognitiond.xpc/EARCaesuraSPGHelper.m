@interface EARCaesuraSPGHelper
- (EARCaesuraSPGHelper)initWithDelegate:(RDOSDDelegate *)a3;
- (void)addAudio:(signed __int16 *)a3 count:(int)a4;
- (void)clientSilenceFeaturesAvailable:(id)a3;
- (void)createCaesuraSPG;
- (void)endAudio;
@end

@implementation EARCaesuraSPGHelper

- (void)createCaesuraSPG
{
  v3 = -[EARCaesuraSilencePosteriorGenerator initWithConfigFile:samplingRate:queue:]( objc_alloc(&OBJC_CLASS___EARCaesuraSilencePosteriorGenerator),  "initWithConfigFile:samplingRate:queue:",  self->caesuraSPG_config,  16000LL,  self->caesuraSPGQueue);
  caesuraSPG = self->caesuraSPG;
  self->caesuraSPG = v3;

  -[EARCaesuraSilencePosteriorGenerator setDelegate:](self->caesuraSPG, "setDelegate:", self);
}

- (void)endAudio
{
  helperQueue = self->helperQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100049B18;
  block[3] = &unk_1000CFFE8;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)helperQueue, block);
}

- (EARCaesuraSPGHelper)initWithDelegate:(RDOSDDelegate *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___EARCaesuraSPGHelper;
  v4 = -[EARCaesuraSPGHelper init](&v16, "init");
  v5 = v4;
  if (v4)
  {
    *(_WORD *)&v4->_startOfSpeechDetected = 0;
    v4->_numConsecutiveNonSilenceFrames = 0LL;
    dispatch_queue_t v6 = dispatch_queue_create("EARCaesuraSPGQueue", 0LL);
    caesuraSPGQueue = v5->caesuraSPGQueue;
    v5->caesuraSPGQueue = (OS_dispatch_queue *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("EARCaesuraSPGHelperQueue", 0LL);
    helperQueue = v5->helperQueue;
    v5->helperQueue = (OS_dispatch_queue *)v8;

    v10 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v5));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = objc_claimAutoreleasedReturnValue( [v11 pathForResource:@"hybridendpointer" ofType:@"json" inDirectory:@"models/SpeechEndpointAssets"]);
    caesuraSPG_config = v5->caesuraSPG_config;
    v5->caesuraSPG_config = (NSString *)v12;

    fprintf( __stdoutp,  "hybridendpointer config path is at %s\n",  -[NSString UTF8String](v5->caesuraSPG_config, "UTF8String"));
    -[EARCaesuraSPGHelper createCaesuraSPG](v5, "createCaesuraSPG");
    __int128 v14 = *(_OWORD *)&a3->ctx;
    v5->_caesuraSPGDelegate.SpeechEnded = a3->SpeechEnded;
    *(_OWORD *)&v5->_caesuraSPGDelegate.ctx = v14;
  }

  return v5;
}

- (void)addAudio:(signed __int16 *)a3 count:(int)a4
{
  helperQueue = self->helperQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100049CC8;
  block[3] = &unk_1000D0010;
  int v6 = a4;
  block[4] = self;
  void block[5] = a3;
  dispatch_sync((dispatch_queue_t)helperQueue, block);
}

- (void)clientSilenceFeaturesAvailable:(id)a3
{
  id v4 = a3;
  [v4 silenceProbability];
  double v6 = v5;
  [v4 silenceDurationMs];
  double v8 = v7;

  if (v8 >= 60000.0) {
    -[EARCaesuraSPGHelper endAudio](self, "endAudio");
  }
  if (!self->_startOfSpeechDetected)
  {
    if (v6 >= 0.6)
    {
      self->_numConsecutiveNonSilenceFrames = 0LL;
    }

    else
    {
      unint64_t v9 = self->_numConsecutiveNonSilenceFrames + 1;
      self->_numConsecutiveNonSilenceFrames = v9;
      if (v9 >= 0xA)
      {
        *(_WORD *)&self->_startOfSpeechDetected = 1;
        SpeechStarted = (void (*)(void *))self->_caesuraSPGDelegate.SpeechStarted;
        if (SpeechStarted) {
          SpeechStarted(self->_caesuraSPGDelegate.ctx);
        }
      }
    }
  }

  if (!self->_endOfSpeechDetected && v8 >= 0.975 && self->_startOfSpeechDetected)
  {
    *(_WORD *)&self->_startOfSpeechDetected = 256;
    SpeechEnded = (void (*)(void *))self->_caesuraSPGDelegate.SpeechEnded;
    if (SpeechEnded) {
      SpeechEnded(self->_caesuraSPGDelegate.ctx);
    }
  }

- (void).cxx_destruct
{
}

@end