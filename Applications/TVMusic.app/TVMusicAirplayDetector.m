@interface TVMusicAirplayDetector
- (BOOL)isReceivingAudioAirplay;
- (MRNowPlayingController)nowPlayingController;
- (TVMusicAirplayDetector)initWithDelegate:(id)a3;
- (TVMusicAirplayDetectorDelegate)delegate;
- (void)_handleResponse:(id)a3;
- (void)controller:(id)a3 didLoadResponse:(id)a4;
- (void)controller:(id)a3 didUpdateResponse:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setIsReceivingAudioAirplay:(BOOL)a3;
- (void)setNowPlayingController:(id)a3;
@end

@implementation TVMusicAirplayDetector

- (TVMusicAirplayDetector)initWithDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVMusicAirplayDetector;
  v5 = -[TVMusicAirplayDetector init](&v11, "init");
  v6 = v5;
  if (v5)
  {
    -[TVMusicAirplayDetector setDelegate:](v5, "setDelegate:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[MRNowPlayingController localRouteController]( &OBJC_CLASS___MRNowPlayingController,  "localRouteController"));
    -[TVMusicAirplayDetector setNowPlayingController:](v6, "setNowPlayingController:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAirplayDetector nowPlayingController](v6, "nowPlayingController"));
    [v8 setDelegate:v6];

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAirplayDetector nowPlayingController](v6, "nowPlayingController"));
    [v9 beginLoadingUpdates];
  }

  return v6;
}

- (void)controller:(id)a3 didLoadResponse:(id)a4
{
}

- (void)controller:(id)a3 didUpdateResponse:(id)a4
{
}

- (void)_handleResponse:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 playbackQueue]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 contentItems]);
  id v11 = (id)objc_claimAutoreleasedReturnValue([v6 firstObject]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 playerPath]);
  LODWORD(v4) = objc_msgSend(v7, "tvm_isAirplayReceiver");

  if ((_DWORD)v4
    && v11
    && (v8 = (void *)objc_claimAutoreleasedReturnValue([v11 metadata]),
        id v9 = [v8 mediaType],
        v8,
        v9 != (id)2))
  {
    if (!-[TVMusicAirplayDetector isReceivingAudioAirplay](self, "isReceivingAudioAirplay"))
    {
      -[TVMusicAirplayDetector setIsReceivingAudioAirplay:](self, "setIsReceivingAudioAirplay:", 1LL);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAirplayDetector delegate](self, "delegate"));
      [v10 airplayDetectorAirplayStarted:self];
      goto LABEL_8;
    }
  }

  else if (-[TVMusicAirplayDetector isReceivingAudioAirplay](self, "isReceivingAudioAirplay"))
  {
    -[TVMusicAirplayDetector setIsReceivingAudioAirplay:](self, "setIsReceivingAudioAirplay:", 0LL);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAirplayDetector delegate](self, "delegate"));
    [v10 airplayDetectorAirplayEnded:self];
LABEL_8:
  }
}

- (TVMusicAirplayDetectorDelegate)delegate
{
  return (TVMusicAirplayDetectorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (MRNowPlayingController)nowPlayingController
{
  return self->_nowPlayingController;
}

- (void)setNowPlayingController:(id)a3
{
}

- (BOOL)isReceivingAudioAirplay
{
  return self->_isReceivingAudioAirplay;
}

- (void)setIsReceivingAudioAirplay:(BOOL)a3
{
  self->_isReceivingAudioAirplay = a3;
}

- (void).cxx_destruct
{
}

@end