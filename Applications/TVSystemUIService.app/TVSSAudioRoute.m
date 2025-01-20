@interface TVSSAudioRoute
- (BOOL)_shouldShowNowPlayingInfo;
- (BOOL)_shouldShowSeparateBatteryPercentages;
- (BOOL)_shouldShowSingleBatteryPercentage;
- (NSString)contentText1;
- (NSString)contentText2;
- (NSString)contentText3;
- (NSString)contentTitle;
- (TVCSAudioRoute)route;
- (TVSSAudioRoute)initWithRoute:(id)a3;
- (UIImage)contentImage;
- (UIImage)contentImage1;
- (UIImage)contentImage2;
- (id)_currentLeftBatteryString;
- (id)_currentRightBatteryString;
- (id)_currentSingleBatteryImage;
- (id)_currentSingleBatteryString;
- (id)_symbolForBatteryLevel:(id)a3;
- (id)identifier;
@end

@implementation TVSSAudioRoute

- (TVSSAudioRoute)initWithRoute:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0LL;
  v6.receiver = v3;
  v6.super_class = (Class)&OBJC_CLASS___TVSSAudioRoute;
  v8 = -[TVSSAudioRoute init](&v6, "init");
  objc_storeStrong((id *)&v8, v8);
  if (v8) {
    objc_storeStrong((id *)&v8->_route, location[0]);
  }
  v5 = v8;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v8, 0LL);
  return v5;
}

- (id)identifier
{
  v3 = -[TVSSAudioRoute route](self, "route");
  id v4 = -[TVCSAudioRoute routeUID](v3, "routeUID");

  return v4;
}

- (NSString)contentTitle
{
  v3 = -[TVSSAudioRoute route](self, "route");
  id v4 = -[TVCSAudioRoute title](v3, "title");

  return (NSString *)v4;
}

- (UIImage)contentImage
{
  id v4 = -[TVSSAudioRoute route](self, "route");
  id v3 = -[TVCSAudioRoute deviceSymbolName](v4, "deviceSymbolName");
  id v5 = +[UIImage _systemImageNamed:](&OBJC_CLASS___UIImage, "_systemImageNamed:");

  return (UIImage *)v5;
}

- (UIImage)contentImage1
{
  id v4 = -[TVSSAudioRoute route](self, "route");
  char v7 = 0;
  char v5 = 0;
  if (-[TVCSAudioRoute selectionState](v4, "selectionState") == (id)1)
  {
    id v8 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"checkmark.circle.fill");
    char v7 = 1;
    id v2 = v8;
  }

  else
  {
    id v6 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"circle");
    char v5 = 1;
    id v2 = v6;
  }

  v9 = v2;
  if ((v5 & 1) != 0) {

  }
  if ((v7 & 1) != 0) {
  return (UIImage *)v9;
  }
}

- (UIImage)contentImage2
{
  if (-[TVSSAudioRoute _shouldShowSingleBatteryPercentage](self, "_shouldShowSingleBatteryPercentage")) {
    return (UIImage *)-[TVSSAudioRoute _currentSingleBatteryImage](self, "_currentSingleBatteryImage");
  }
  else {
    return (UIImage *)0LL;
  }
}

- (NSString)contentText1
{
  if (-[TVSSAudioRoute _shouldShowSingleBatteryPercentage](self, "_shouldShowSingleBatteryPercentage")) {
    return (NSString *)-[TVSSAudioRoute _currentSingleBatteryString](self, "_currentSingleBatteryString");
  }
  if (-[TVSSAudioRoute _shouldShowNowPlayingInfo](self, "_shouldShowNowPlayingInfo"))
  {
    v12 = -[TVSSAudioRoute route](self, "route");
    id v13 = -[TVCSAudioRoute nowPlayingInfo](v12, "nowPlayingInfo");
    id v14 = [v13 title];
    char v20 = 0;
    char v18 = 0;
    char v16 = 0;
    BOOL v15 = 0;
    if (v14)
    {
      v21 = -[TVSSAudioRoute route](self, "route");
      char v20 = 1;
      id v19 = -[TVCSAudioRoute nowPlayingInfo](v21, "nowPlayingInfo");
      char v18 = 1;
      id v17 = [v19 artist];
      char v16 = 1;
      BOOL v15 = v17 != 0LL;
    }

    if ((v16 & 1) != 0) {

    }
    if ((v18 & 1) != 0) {
    if ((v20 & 1) != 0)
    }

    if (v15)
    {
      id v11 = TVSSLocString(@"TVSSAudioRoutingNowPlayingInfo");
      v10 = -[TVSSAudioRoute route](self, "route");
      id v9 = -[TVCSAudioRoute nowPlayingInfo](v10, "nowPlayingInfo");
      id v8 = [v9 title];
      char v7 = -[TVSSAudioRoute route](self, "route");
      id v6 = -[TVCSAudioRoute nowPlayingInfo](v7, "nowPlayingInfo");
      id v5 = [v6 artist];
      v23 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v11, v8, v5);

      return v23;
    }

    id v4 = -[TVSSAudioRoute route](self, "route");
    id v3 = -[TVCSAudioRoute nowPlayingInfo](v4, "nowPlayingInfo");
    id v24 = [v3 title];
  }

  else
  {
    id v24 = 0LL;
  }

  return (NSString *)v24;
}

- (NSString)contentText2
{
  id v11 = -[TVSSAudioRoute route](self, "route");
  id v12 = -[TVCSAudioRoute batteryLevel](v11, "batteryLevel");
  id v13 = [v12 leftPercentage];
  char v19 = 0;
  char v17 = 0;
  char v15 = 0;
  BOOL v14 = 0;
  if (v13)
  {
    char v20 = -[TVSSAudioRoute route](self, "route");
    char v19 = 1;
    id v18 = -[TVCSAudioRoute batteryLevel](v20, "batteryLevel");
    char v17 = 1;
    id v16 = [v18 rightPercentage];
    char v15 = 1;
    BOOL v14 = v16 != 0LL;
  }

  if ((v15 & 1) != 0) {

  }
  if ((v17 & 1) != 0) {
  if ((v19 & 1) != 0)
  }

  if (v14)
  {
    if (-[TVSSAudioRoute _shouldShowSeparateBatteryPercentages](self, "_shouldShowSeparateBatteryPercentages")) {
      return (NSString *)-[TVSSAudioRoute _currentLeftBatteryString](self, "_currentLeftBatteryString");
    }
  }

  else
  {
    id v9 = -[TVSSAudioRoute route](self, "route");
    id v8 = -[TVCSAudioRoute batteryLevel](v9, "batteryLevel");
    id v3 = [v8 leftPercentage];
    BOOL v10 = v3 == 0LL;

    if (!v10) {
      return (NSString *)-[TVSSAudioRoute _currentLeftBatteryString](self, "_currentLeftBatteryString");
    }
    id v6 = -[TVSSAudioRoute route](self, "route");
    id v5 = -[TVCSAudioRoute batteryLevel](v6, "batteryLevel");
    id v4 = [v5 rightPercentage];
    BOOL v7 = v4 == 0LL;

    if (!v7) {
      return (NSString *)-[TVSSAudioRoute _currentRightBatteryString](self, "_currentRightBatteryString");
    }
  }

  return (NSString *)0LL;
}

- (NSString)contentText3
{
  id v3 = -[TVSSAudioRoute route](self, "route");
  id v4 = -[TVCSAudioRoute batteryLevel](v3, "batteryLevel");
  id v5 = [v4 leftPercentage];
  char v11 = 0;
  char v9 = 0;
  char v7 = 0;
  unsigned __int8 v6 = 0;
  if (v5)
  {
    id v12 = -[TVSSAudioRoute route](self, "route");
    char v11 = 1;
    id v10 = -[TVCSAudioRoute batteryLevel](v12, "batteryLevel");
    char v9 = 1;
    id v8 = [v10 rightPercentage];
    char v7 = 1;
    unsigned __int8 v6 = 0;
    if (v8) {
      unsigned __int8 v6 = -[TVSSAudioRoute _shouldShowSeparateBatteryPercentages](self, "_shouldShowSeparateBatteryPercentages");
    }
  }

  if ((v7 & 1) != 0) {

  }
  if ((v9 & 1) != 0) {
  if ((v11 & 1) != 0)
  }

  if ((v6 & 1) != 0) {
    return (NSString *)-[TVSSAudioRoute _currentRightBatteryString](self, "_currentRightBatteryString");
  }
  else {
    return (NSString *)0LL;
  }
}

- (id)_currentLeftBatteryString
{
  char v11 = self;
  v10[1] = (id)a2;
  v10[0] = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
  [v10[0] setNumberStyle:3];
  [v10[0] setUsesSignificantDigits:0];
  [v10[0] setUsesGroupingSeparator:0];
  id v8 = TVSSLocString(@"TVSSAudioRoutingLeftBatteryFormat");
  id v3 = v10[0];
  char v7 = -[TVSSAudioRoute route](v11, "route");
  id v6 = -[TVCSAudioRoute batteryLevel](v7, "batteryLevel");
  id v5 = [v6 leftPercentage];
  id v4 = objc_msgSend(v3, "stringFromNumber:");
  char v9 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v8, v4);

  objc_storeStrong(v10, 0LL);
  return v9;
}

- (id)_currentRightBatteryString
{
  char v11 = self;
  v10[1] = (id)a2;
  v10[0] = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
  [v10[0] setNumberStyle:3];
  [v10[0] setUsesSignificantDigits:0];
  [v10[0] setUsesGroupingSeparator:0];
  id v8 = TVSSLocString(@"TVSSAudioRoutingRightBatteryFormat");
  id v3 = v10[0];
  char v7 = -[TVSSAudioRoute route](v11, "route");
  id v6 = -[TVCSAudioRoute batteryLevel](v7, "batteryLevel");
  id v5 = [v6 rightPercentage];
  id v4 = objc_msgSend(v3, "stringFromNumber:");
  char v9 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v8, v4);

  objc_storeStrong(v10, 0LL);
  return v9;
}

- (id)_currentSingleBatteryString
{
  v45 = self;
  v44[1] = (id)a2;
  v44[0] = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
  [v44[0] setNumberStyle:3];
  [v44[0] setUsesSignificantDigits:0];
  [v44[0] setUsesGroupingSeparator:0];
  v21 = -[TVSSAudioRoute route](v45, "route");
  id v22 = -[TVCSAudioRoute batteryLevel](v21, "batteryLevel");
  id v23 = [v22 leftPercentage];
  char v42 = 0;
  char v40 = 0;
  char v38 = 0;
  BOOL v24 = 0;
  if (v23)
  {
    v43 = -[TVSSAudioRoute route](v45, "route");
    char v42 = 1;
    id v41 = -[TVCSAudioRoute batteryLevel](v43, "batteryLevel");
    char v40 = 1;
    id v39 = [v41 rightPercentage];
    char v38 = 1;
    BOOL v24 = v39 != 0LL;
  }

  if ((v38 & 1) != 0) {

  }
  if ((v40 & 1) != 0) {
  if ((v42 & 1) != 0)
  }

  if (v24)
  {
    BOOL v14 = -[TVSSAudioRoute route](v45, "route");
    id v15 = -[TVCSAudioRoute batteryLevel](v14, "batteryLevel");
    id v16 = [v15 leftPercentage];
    [v16 floatValue];
    float v20 = v2;
    char v17 = -[TVSSAudioRoute route](v45, "route");
    id v18 = -[TVCSAudioRoute batteryLevel](v17, "batteryLevel");
    id v19 = [v18 rightPercentage];
    [v19 floatValue];
    float v3 = *(float *)&v4;
    *(float *)&double v4 = v20;
    char v35 = 0;
    char v33 = 0;
    char v31 = 0;
    char v29 = 0;
    char v27 = 0;
    char v25 = 0;
    if (v20 >= v3)
    {
      v30 = -[TVSSAudioRoute route](v45, "route", v4);
      char v29 = 1;
      id v28 = -[TVCSAudioRoute batteryLevel](v30, "batteryLevel");
      char v27 = 1;
      id v26 = [v28 rightPercentage];
      char v25 = 1;
      id v5 = v26;
    }

    else
    {
      v36 = -[TVSSAudioRoute route](v45, "route", v4);
      char v35 = 1;
      id v34 = -[TVCSAudioRoute batteryLevel](v36, "batteryLevel");
      char v33 = 1;
      id v32 = [v34 leftPercentage];
      char v31 = 1;
      id v5 = v32;
    }

    id v37 = v5;
    if ((v25 & 1) != 0) {

    }
    if ((v27 & 1) != 0) {
    if ((v29 & 1) != 0)
    }

    if ((v31 & 1) != 0) {
    if ((v33 & 1) != 0)
    }

    if ((v35 & 1) != 0) {
    id v46 = [v44[0] stringFromNumber:v37];
    }
    objc_storeStrong(&v37, 0LL);
  }

  else
  {
    id v12 = -[TVSSAudioRoute route](v45, "route");
    id v11 = -[TVCSAudioRoute batteryLevel](v12, "batteryLevel");
    id v6 = [v11 singlePercentage];
    BOOL v13 = v6 == 0LL;

    if (v13)
    {
      id v46 = 0LL;
    }

    else
    {
      id v10 = -[TVSSAudioRoute route](v45, "route");
      id v9 = -[TVCSAudioRoute batteryLevel](v10, "batteryLevel");
      id v8 = [v9 singlePercentage];
      id v46 = objc_msgSend(v44[0], "stringFromNumber:");
    }
  }

  objc_storeStrong(v44, 0LL);
  return v46;
}

- (id)_currentSingleBatteryImage
{
  v45 = self;
  SEL v44 = a2;
  v21 = -[TVSSAudioRoute route](self, "route");
  id v22 = -[TVCSAudioRoute batteryLevel](v21, "batteryLevel");
  id v23 = [v22 leftPercentage];
  char v42 = 0;
  char v40 = 0;
  char v38 = 0;
  BOOL v24 = 0;
  if (v23)
  {
    v43 = -[TVSSAudioRoute route](v45, "route");
    char v42 = 1;
    id v41 = -[TVCSAudioRoute batteryLevel](v43, "batteryLevel");
    char v40 = 1;
    id v39 = [v41 rightPercentage];
    char v38 = 1;
    BOOL v24 = v39 != 0LL;
  }

  if ((v38 & 1) != 0) {

  }
  if ((v40 & 1) != 0) {
  if ((v42 & 1) != 0)
  }

  if (v24)
  {
    BOOL v14 = -[TVSSAudioRoute route](v45, "route");
    id v15 = -[TVCSAudioRoute batteryLevel](v14, "batteryLevel");
    id v16 = [v15 leftPercentage];
    [v16 floatValue];
    float v20 = v2;
    char v17 = -[TVSSAudioRoute route](v45, "route");
    id v18 = -[TVCSAudioRoute batteryLevel](v17, "batteryLevel");
    id v19 = [v18 rightPercentage];
    [v19 floatValue];
    float v3 = *(float *)&v4;
    *(float *)&double v4 = v20;
    char v35 = 0;
    char v33 = 0;
    char v31 = 0;
    char v29 = 0;
    char v27 = 0;
    char v25 = 0;
    if (v20 >= v3)
    {
      v30 = -[TVSSAudioRoute route](v45, "route", v4);
      char v29 = 1;
      id v28 = -[TVCSAudioRoute batteryLevel](v30, "batteryLevel");
      char v27 = 1;
      id v26 = [v28 rightPercentage];
      char v25 = 1;
      id v5 = v26;
    }

    else
    {
      v36 = -[TVSSAudioRoute route](v45, "route", v4);
      char v35 = 1;
      id v34 = -[TVCSAudioRoute batteryLevel](v36, "batteryLevel");
      char v33 = 1;
      id v32 = [v34 leftPercentage];
      char v31 = 1;
      id v5 = v32;
    }

    id v37 = v5;
    if ((v25 & 1) != 0) {

    }
    if ((v27 & 1) != 0) {
    if ((v29 & 1) != 0)
    }

    if ((v31 & 1) != 0) {
    if ((v33 & 1) != 0)
    }

    if ((v35 & 1) != 0) {
    id v46 = -[TVSSAudioRoute _symbolForBatteryLevel:](v45, "_symbolForBatteryLevel:", v37);
    }
    objc_storeStrong(&v37, 0LL);
  }

  else
  {
    id v12 = -[TVSSAudioRoute route](v45, "route");
    id v11 = -[TVCSAudioRoute batteryLevel](v12, "batteryLevel");
    id v6 = [v11 singlePercentage];
    BOOL v13 = v6 == 0LL;

    if (v13)
    {
      id v46 = 0LL;
    }

    else
    {
      id v10 = -[TVSSAudioRoute route](v45, "route");
      id v9 = -[TVCSAudioRoute batteryLevel](v10, "batteryLevel");
      id v8 = [v9 singlePercentage];
      id v46 = -[TVSSAudioRoute _symbolForBatteryLevel:](v45, "_symbolForBatteryLevel:");
    }
  }

  return v46;
}

- (BOOL)_shouldShowSeparateBatteryPercentages
{
  id v6 = -[TVSSAudioRoute route](self, "route");
  id v7 = -[TVCSAudioRoute batteryLevel](v6, "batteryLevel");
  id v8 = [v7 leftPercentage];
  char v26 = 0;
  char v24 = 0;
  char v22 = 0;
  char v20 = 0;
  char v18 = 0;
  char v16 = 0;
  char v14 = 0;
  char v12 = 0;
  char v10 = 0;
  BOOL v9 = 0;
  if (v8)
  {
    char v27 = -[TVSSAudioRoute route](self, "route");
    char v26 = 1;
    id v25 = -[TVCSAudioRoute batteryLevel](v27, "batteryLevel");
    char v24 = 1;
    id v23 = [v25 rightPercentage];
    char v22 = 1;
    BOOL v9 = 0;
    if (v23)
    {
      v21 = -[TVSSAudioRoute route](self, "route");
      char v20 = 1;
      id v19 = -[TVCSAudioRoute batteryLevel](v21, "batteryLevel");
      char v18 = 1;
      id v17 = [v19 leftPercentage];
      char v16 = 1;
      [v17 floatValue];
      float v5 = v2;
      id v15 = -[TVSSAudioRoute route](self, "route");
      char v14 = 1;
      id v13 = -[TVCSAudioRoute batteryLevel](v15, "batteryLevel");
      char v12 = 1;
      id v11 = [v13 rightPercentage];
      char v10 = 1;
      [v11 floatValue];
      BOOL v9 = vabds_f32(v5, v3) >= 0.1;
    }
  }

  if ((v10 & 1) != 0) {

  }
  if ((v12 & 1) != 0) {
  if ((v14 & 1) != 0)
  }

  if ((v16 & 1) != 0) {
  if ((v18 & 1) != 0)
  }

  if ((v20 & 1) != 0) {
  if ((v22 & 1) != 0)
  }

  if ((v24 & 1) != 0) {
  if ((v26 & 1) != 0)
  }

  return v9;
}

- (BOOL)_shouldShowSingleBatteryPercentage
{
  id v7 = -[TVSSAudioRoute route](self, "route");
  id v8 = -[TVCSAudioRoute batteryLevel](v7, "batteryLevel");
  id v9 = [v8 leftPercentage];
  char v15 = 0;
  char v13 = 0;
  char v11 = 0;
  BOOL v10 = 0;
  if (v9)
  {
    char v16 = -[TVSSAudioRoute route](self, "route");
    char v15 = 1;
    id v14 = -[TVCSAudioRoute batteryLevel](v16, "batteryLevel");
    char v13 = 1;
    id v12 = [v14 rightPercentage];
    char v11 = 1;
    BOOL v10 = v12 != 0LL;
  }

  if ((v11 & 1) != 0) {

  }
  if ((v13 & 1) != 0) {
  if ((v15 & 1) != 0)
  }

  if (v10) {
    return !-[TVSSAudioRoute _shouldShowSeparateBatteryPercentages](self, "_shouldShowSeparateBatteryPercentages");
  }
  float v5 = -[TVSSAudioRoute route](self, "route");
  id v4 = -[TVCSAudioRoute batteryLevel](v5, "batteryLevel");
  id v2 = [v4 singlePercentage];
  BOOL v6 = v2 == 0LL;

  return !v6;
}

- (id)_symbolForBatteryLevel:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  [location[0] floatValue];
  float v6 = v3;
  if (v3 > 1.0 || v3 < 0.875)
  {
    if (v3 > 0.874 || v3 < 0.625)
    {
      if (v3 > 0.624 || v3 < 0.375)
      {
        double v4 = v3;
        if (v6 > 0.374 || (double v4 = v6, v6 < 0.125)) {
          id v8 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"battery.0percent", v4);
        }
        else {
          id v8 =  +[UIImage systemImageNamed:]( &OBJC_CLASS___UIImage,  "systemImageNamed:",  @"battery.25percent",  v4);
        }
      }

      else
      {
        id v8 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"battery.50percent", v3);
      }
    }

    else
    {
      id v8 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"battery.75percent", v3);
    }
  }

  else
  {
    id v8 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"battery.100percent", v3);
  }

  objc_storeStrong(location, 0LL);
  return v8;
}

- (BOOL)_shouldShowNowPlayingInfo
{
  float v5 = -[TVSSAudioRoute route](self, "route");
  id v6 = -[TVCSAudioRoute nowPlayingInfo](v5, "nowPlayingInfo");
  char v15 = 0;
  char v13 = 0;
  char v11 = 0;
  char v9 = 0;
  char v7 = 0;
  if ([v6 playbackState] == (id)1
    || (char v16 = -[TVSSAudioRoute route](self, "route"),
        char v15 = 1,
        id v14 = -[TVCSAudioRoute nowPlayingInfo](v16, "nowPlayingInfo"),
        char v13 = 1,
        BOOL v4 = 0,
        [v14 playbackState] == (id)2))
  {
    id v12 = -[TVSSAudioRoute route](self, "route");
    char v11 = 1;
    id v10 = -[TVCSAudioRoute nowPlayingInfo](v12, "nowPlayingInfo");
    char v9 = 1;
    id v8 = [v10 lastPlayingDate];
    char v7 = 1;
    [v8 timeIntervalSinceNow];
    BOOL v4 = -v2 < TVSSLingeringDuration();
  }

  if ((v7 & 1) != 0) {

  }
  if ((v9 & 1) != 0) {
  if ((v11 & 1) != 0)
  }

  if ((v13 & 1) != 0) {
  if ((v15 & 1) != 0)
  }

  return v4;
}

- (TVCSAudioRoute)route
{
  return self->_route;
}

- (void).cxx_destruct
{
}

@end