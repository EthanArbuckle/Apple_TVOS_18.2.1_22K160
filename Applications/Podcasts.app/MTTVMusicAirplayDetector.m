@interface MTTVMusicAirplayDetector
- (MPRequestResponseController)requestResponseController;
- (MTTVMusicAirplayDetector)initWithDelegate:(id)a3;
- (MTTVMusicAirplayDetectorDelegate)delegate;
- (void)controller:(id)a3 defersResponseReplacement:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setRequestResponseController:(id)a3;
@end

@implementation MTTVMusicAirplayDetector

- (MTTVMusicAirplayDetector)initWithDelegate:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MTTVMusicAirplayDetector;
  v5 = -[MTTVMusicAirplayDetector init](&v13, "init");
  v6 = v5;
  if (v5)
  {
    -[MTTVMusicAirplayDetector setDelegate:](v5, "setDelegate:", v4);
    v7 = objc_alloc_init(&OBJC_CLASS___MPRequestResponseController);
    -[MTTVMusicAirplayDetector setRequestResponseController:](v6, "setRequestResponseController:", v7);

    id v8 = objc_alloc_init(&OBJC_CLASS___MPCPlayerRequest);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicAirplayDetector requestResponseController](v6, "requestResponseController"));
    [v9 setRequest:v8];

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicAirplayDetector requestResponseController](v6, "requestResponseController"));
    [v10 setDelegate:v6];

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicAirplayDetector requestResponseController](v6, "requestResponseController"));
    [v11 beginAutomaticResponseLoading];
  }

  return v6;
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  id v17 = a3;
  v6 = (void (**)(void))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v17 response]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 playerPath]);
  unsigned int v9 = [v8 isAirplayReceiver];

  v6[2](v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v17 response]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 playerPath]);

  v12 = v17;
  if (v11)
  {
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v17 response]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 playerPath]);
    unsigned int v15 = [v14 isAirplayReceiver];

    if (((v15 ^ 1 | v9) & 1) == 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicAirplayDetector delegate](self, "delegate"));
      [v16 airplayDetectorAirplayStarted:self];
      goto LABEL_6;
    }

    v12 = v17;
    if (((v15 | v9 ^ 1) & 1) == 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicAirplayDetector delegate](self, "delegate"));
      [v16 airplayDetectorAirplayEnded:self];
LABEL_6:

      v12 = v17;
    }
  }
}

- (MTTVMusicAirplayDetectorDelegate)delegate
{
  return (MTTVMusicAirplayDetectorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (MPRequestResponseController)requestResponseController
{
  return self->_requestResponseController;
}

- (void)setRequestResponseController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end