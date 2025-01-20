@interface VOTUIBrailleViewController
- (BOOL)_canShowWhileLocked;
- (NSArray)dotNumberPositions;
- (VOTUIBrailleViewController)initWithOrientation:(int64_t)a3 dotNumberPositions:(id)a4 typingMode:(int64_t)a5;
- (int64_t)orientation;
- (int64_t)typingMode;
- (unint64_t)supportedInterfaceOrientations;
- (void)flashInsertedText:(id)a3;
- (void)highlightBrailleDots:(id)a3;
- (void)loadView;
- (void)setOrientation:(int64_t)a3 dotNumberPositions:(id)a4 typingMode:(int64_t)a5;
@end

@implementation VOTUIBrailleViewController

- (VOTUIBrailleViewController)initWithOrientation:(int64_t)a3 dotNumberPositions:(id)a4 typingMode:(int64_t)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___VOTUIBrailleViewController;
  v10 = -[VOTUIBrailleViewController init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    v10->_orientation = a3;
    objc_storeStrong((id *)&v10->_dotNumberPositions, a4);
    v11->_typingMode = a5;
  }

  return v11;
}

- (void)loadView
{
  v3 = objc_alloc(&OBJC_CLASS___VOTUIBrailleView);
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[VOTUIBrailleViewController dotNumberPositions](self, "dotNumberPositions"));
  v4 = -[VOTUIBrailleView initWithDotNumberPositions:typingMode:]( v3,  "initWithDotNumberPositions:typingMode:",  v5,  -[VOTUIBrailleViewController typingMode](self, "typingMode"));
  -[VOTUIBrailleViewController setView:](self, "setView:", v4);
}

- (void)highlightBrailleDots:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[VOTUIBrailleViewController view](self, "view"));
  [v5 highlightBrailleDots:v4];
}

- (void)flashInsertedText:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[VOTUIBrailleViewController view](self, "view"));
  [v5 flashInsertedText:v4];
}

- (void)setOrientation:(int64_t)a3 dotNumberPositions:(id)a4 typingMode:(int64_t)a5
{
  self->_orientation = a3;
  objc_storeStrong((id *)&self->_dotNumberPositions, a4);
  id v8 = a4;
  self->_typingMode = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIBrailleViewController view](self, "view"));
  [v9 setDotNumberPositions:v8 typingMode:a5];

  -[VOTUIBrailleViewController setNeedsUpdateOfSupportedInterfaceOrientations]( self,  "setNeedsUpdateOfSupportedInterfaceOrientations");
}

- (unint64_t)supportedInterfaceOrientations
{
  int64_t v2 = -[VOTUIBrailleViewController orientation](self, "orientation");
  else {
    return qword_1BA58[v2 - 2];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (NSArray)dotNumberPositions
{
  return self->_dotNumberPositions;
}

- (int64_t)typingMode
{
  return self->_typingMode;
}

- (void).cxx_destruct
{
}

@end