@interface TVFaceTimeAppConfig
+ (id)sharedInstance;
- (BOOL)alwaysShowLocalVideo;
- (BOOL)contentViewAnimationsFadeInsteadOfMove;
- (BOOL)contentViewCanRotate;
- (BOOL)inCall;
- (BOOL)isSuspended;
- (BOOL)tabBarCanSlide;
- (BOOL)tabBarFillsScreen;
- (BOOL)usesUnifiedInterface;
- (TVFaceTimeAppConfig)init;
- (int64_t)statusBarOrientation;
- (unsigned)contentViewOffscreenEdge;
- (unsigned)userInterfaceStyle;
@end

@implementation TVFaceTimeAppConfig

+ (id)sharedInstance
{
  if (qword_100116918 != -1) {
    dispatch_once(&qword_100116918, &stru_1000F6AF0);
  }
  return (id)qword_100116910;
}

- (TVFaceTimeAppConfig)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVFaceTimeAppConfig;
  result = -[TVFaceTimeAppConfig init](&v3, "init");
  if (result)
  {
    result->_statusBarOrientation = 1LL;
    *(_WORD *)&result->_contentViewCanRotate = 1;
    result->_userInterfaceStyle = 0;
    *(_DWORD *)&result->_usesUnifiedInterface = 16843009;
  }

  return result;
}

- (unsigned)contentViewOffscreenEdge
{
  return 2 * ([UIApp userInterfaceLayoutDirection] != 0);
}

- (BOOL)isSuspended
{
  return 0;
}

- (BOOL)inCall
{
  return 0;
}

- (int64_t)statusBarOrientation
{
  return self->_statusBarOrientation;
}

- (BOOL)contentViewCanRotate
{
  return self->_contentViewCanRotate;
}

- (BOOL)contentViewAnimationsFadeInsteadOfMove
{
  return self->_contentViewAnimationsFadeInsteadOfMove;
}

- (unsigned)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (BOOL)usesUnifiedInterface
{
  return self->_usesUnifiedInterface;
}

- (BOOL)tabBarFillsScreen
{
  return self->_tabBarFillsScreen;
}

- (BOOL)tabBarCanSlide
{
  return self->_tabBarCanSlide;
}

- (BOOL)alwaysShowLocalVideo
{
  return self->_alwaysShowLocalVideo;
}

@end