@interface TVCRDViewController
- (TVCRDViewController)init;
- (UIImageView)backgroundImageView;
- (void)_updateBackgroundImage;
- (void)dealloc;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setBackgroundImageView:(id)a3;
@end

@implementation TVCRDViewController

- (TVCRDViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVCRDViewController;
  v2 = -[TVCRDViewController init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[PBSConferenceRoomDisplaySettings sharedInstance]( &OBJC_CLASS___PBSConferenceRoomDisplaySettings,  "sharedInstance"));
    [v3 addObserver:v2 forKeyPath:@"conferenceRoomDisplayBackgroundPhoto" options:0 context:off_100008D70];
  }

  return v2;
}

- (void)loadView
{
  v3 = objc_alloc(&OBJC_CLASS___UIImageView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v4 bounds];
  objc_super v5 = -[UIImageView initWithFrame:](v3, "initWithFrame:");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  -[UIImageView setBackgroundColor:](v5, "setBackgroundColor:", v6);

  -[UIImageView setContentMode:](v5, "setContentMode:", 2LL);
  -[TVCRDViewController setView:](self, "setView:", v5);
  backgroundImageView = self->_backgroundImageView;
  self->_backgroundImageView = v5;

  -[TVCRDViewController _updateBackgroundImage](self, "_updateBackgroundImage");
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[PBSConferenceRoomDisplaySettings sharedInstance]( &OBJC_CLASS___PBSConferenceRoomDisplaySettings,  "sharedInstance"));
  [v3 removeObserver:self forKeyPath:@"conferenceRoomDisplayBackgroundPhoto" context:off_100008D70];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVCRDViewController;
  -[TVCRDViewController dealloc](&v4, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_100008D70 == a6)
  {
    -[TVCRDViewController _updateBackgroundImage](self, "_updateBackgroundImage", a3, a4, a5);
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___TVCRDViewController;
    -[TVCRDViewController observeValueForKeyPath:ofObject:change:context:]( &v6,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)_updateBackgroundImage
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[PBSConferenceRoomDisplaySettings sharedInstance]( &OBJC_CLASS___PBSConferenceRoomDisplaySettings,  "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v4 conferenceRoomDisplayBackgroundPhoto]);
  -[UIImageView setImage:](self->_backgroundImageView, "setImage:", v3);
}

- (UIImageView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (void)setBackgroundImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end