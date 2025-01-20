@interface TVSSHUDTimeIntervalVisualizationView
- (TVSSHUDTimeIntervalVisualizationView)initWithFrame:(CGRect)a3;
- (void)_cleanupTimer;
- (void)_setupTimer;
- (void)_timerTick;
- (void)_updateTimer;
- (void)_updateTitleAndTimeLabel;
- (void)dealloc;
- (void)visualizationDidUpdate;
@end

@implementation TVSSHUDTimeIntervalVisualizationView

- (TVSSHUDTimeIntervalVisualizationView)initWithFrame:(CGRect)a3
{
  CGRect v11 = a3;
  SEL v9 = a2;
  v10 = 0LL;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSSHUDTimeIntervalVisualizationView;
  v10 = -[TVSSHUDTimeIntervalVisualizationView initWithFrame:]( &v8,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  objc_storeStrong((id *)&v10, v10);
  if (v10)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleAndTimeLabel = v10->_titleAndTimeLabel;
    v10->_titleAndTimeLabel = v3;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v10->_titleAndTimeLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    id v7 = sub_100006F2C();
    -[UILabel setFont:](v10->_titleAndTimeLabel, "setFont:");

    -[TVSSHUDTimeIntervalVisualizationView addSubview:](v10, "addSubview:", v10->_titleAndTimeLabel);
    sub_100006F58(v10->_titleAndTimeLabel);
  }

  v6 = v10;
  objc_storeStrong((id *)&v10, 0LL);
  return v6;
}

- (void)visualizationDidUpdate
{
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[NSTimer invalidate](self->_timer, "invalidate");
  objc_storeStrong((id *)&v4->_timer, 0LL);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSHUDTimeIntervalVisualizationView;
  -[TVSSHUDTimeIntervalVisualizationView dealloc](&v2, "dealloc");
}

- (void)_updateTimer
{
  char v10 = 0;
  char v8 = 0;
  BOOL v3 = 0;
  if (self->_timer)
  {
    CGRect v11 = -[TVSSHUDAbstractVisualizationView visualization](self, "visualization");
    char v10 = 1;
    id v9 = -[TVSSHUDVisualization timeInterval](v11, "timeInterval");
    char v8 = 1;
    BOOL v3 = [v9 state] != (id)1;
  }

  if ((v8 & 1) != 0) {

  }
  if ((v10 & 1) != 0) {
  if (v3)
  }
  {
    -[TVSSHUDTimeIntervalVisualizationView _cleanupTimer](self, "_cleanupTimer");
  }

  else
  {
    char v6 = 0;
    char v4 = 0;
    BOOL v2 = 0;
    if (!self->_timer)
    {
      id v7 = -[TVSSHUDAbstractVisualizationView visualization](self, "visualization");
      char v6 = 1;
      id v5 = -[TVSSHUDVisualization timeInterval](v7, "timeInterval");
      char v4 = 1;
      BOOL v2 = [v5 state] == (id)1;
    }

    if ((v4 & 1) != 0) {

    }
    if ((v6 & 1) != 0) {
    if (v2)
    }
      -[TVSSHUDTimeIntervalVisualizationView _setupTimer](self, "_setupTimer");
  }

- (void)_setupTimer
{
  CGRect v11 = self;
  location[1] = (id)a2;
  if (!self->_timer)
  {
    objc_initWeak(location, v11);
    char v4 = _NSConcreteStackBlock;
    int v5 = -1073741824;
    int v6 = 0;
    id v7 = sub_100007FA0;
    char v8 = &unk_1001B5AB0;
    objc_copyWeak(&v9, location);
    BOOL v2 =  +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  1LL,  &v4,  0.1);
    timer = v11->_timer;
    v11->_timer = v2;

    objc_destroyWeak(&v9);
    objc_destroyWeak(location);
  }

- (void)_cleanupTimer
{
  if (self->_timer)
  {
    -[NSTimer invalidate](self->_timer, "invalidate");
    objc_storeStrong((id *)&self->_timer, 0LL);
  }

- (void)_timerTick
{
}

- (void)_updateTitleAndTimeLabel
{
  v13 = self;
  SEL v12 = a2;
  BOOL v3 = &OBJC_CLASS___NSString;
  id v8 = -[TVSSHUDAbstractVisualizationView visualization](self, "visualization");
  id v7 = [v8 title];
  id v6 = -[TVSSHUDAbstractVisualizationView visualization](v13, "visualization");
  id v5 = [v6 timeInterval];
  [v5 duration];
  id v4 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@: %.2f", v7, v2);
  id v9 = &selRef_previewView;
  -[UILabel setText:](v13->_titleAndTimeLabel, "setText:");

  CGRect v11 = -[TVSSHUDAbstractVisualizationView visualization](v13, "visualization");
  char v10 = -[TVSSHUDVisualization color](v11, "color");
  objc_msgSend(*(id *)((char *)&v13->super.super.super.super.isa + *((int *)v9 + 806)), "setTextColor:");
}

- (void).cxx_destruct
{
}

@end