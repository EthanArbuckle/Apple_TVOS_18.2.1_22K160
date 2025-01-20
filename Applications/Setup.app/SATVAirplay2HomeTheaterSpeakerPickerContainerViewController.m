@interface SATVAirplay2HomeTheaterSpeakerPickerContainerViewController
- (SATVAirplay2HomeTheaterSpeaker)speakers;
- (SATVAirplay2HomeTheaterSpeakerPickerContainerViewController)initWithSpeakers:(id)a3;
- (id)completionHandler;
- (void)setCompletionHandler:(id)a3;
- (void)setSpeakers:(id)a3;
- (void)viewDidLoad;
@end

@implementation SATVAirplay2HomeTheaterSpeakerPickerContainerViewController

- (SATVAirplay2HomeTheaterSpeakerPickerContainerViewController)initWithSpeakers:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SATVAirplay2HomeTheaterSpeakerPickerContainerViewController;
  v6 = -[SATVAirplay2HomeTheaterSpeakerPickerContainerViewController initWithNibName:bundle:]( &v9,  "initWithNibName:bundle:",  0LL,  0LL);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_speakers, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SATVAirplay2HomeTheaterSpeakerPickerContainerViewController;
  -[SATVAirplay2HomeTheaterSpeakerPickerContainerViewController viewDidLoad](&v13, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomeTheaterSpeaker bs_map:](self->_speakers, "bs_map:", &stru_1000CA1D8));
  id v4 = objc_alloc(&OBJC_CLASS___TVSUIHomeTheaterSpeakerPickerViewController);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SATVSiriSettings sharedInstance](&OBJC_CLASS___SATVSiriSettings, "sharedInstance"));
  id v6 = objc_msgSend(v4, "initWithSpeakers:isSiriEnabled:", v3, objc_msgSend(v5, "isSiriEnabled"));

  objc_initWeak(&location, self);
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  objc_super v9 = sub_100037444;
  v10 = &unk_1000CA228;
  objc_copyWeak(&v11, &location);
  [v6 setCompletionHandler:&v7];
  -[SATVAirplay2HomeTheaterSpeakerPickerContainerViewController bs_addChildViewController:]( self,  "bs_addChildViewController:",  v6,  v7,  v8,  v9,  v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (SATVAirplay2HomeTheaterSpeaker)speakers
{
  return self->_speakers;
}

- (void)setSpeakers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end