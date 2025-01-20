@interface VOTUIBrailleView
- (BOOL)_isEightDotBraille;
- (BOOL)accessibilityIgnoresInvertColors;
- (NSArray)dotNumberPositions;
- (NSArray)typingModeConstraintsForInsertedTextLabel;
- (NSArray)xConstraintsForDotNumbers;
- (NSArray)yConstraintsForDotNumbers;
- (VOTUIBrailleView)initWithDotNumberPositions:(id)a3 typingMode:(int64_t)a4;
- (id)_circleViewForDotNumber:(unint64_t)a3;
- (id)_constraintsToCenterItem:(id)a3 withItem:(id)a4;
- (id)_dotCircleImageFilled:(BOOL)a3;
- (id)_generateAndStoreConstraintsForDotNumbers;
- (id)_generateAndStoreTypingModeConstraintsForInsertedTextLabel;
- (id)_highlightedCircleViewForDotNumber:(unint64_t)a3;
- (id)_xConstraintForDotNumber:(unint64_t)a3;
- (id)_yConstraintForDotNumber:(unint64_t)a3;
- (int64_t)typingMode;
- (unint64_t)_numberOfDots;
- (void)_addSubviews;
- (void)_updateConstantsForDotNumberConstraints;
- (void)_updateDotsSevenAndEightVisibility;
- (void)flashInsertedText:(id)a3;
- (void)highlightBrailleDots:(id)a3;
- (void)setDotNumberPositions:(id)a3 typingMode:(int64_t)a4;
- (void)setTypingModeConstraintsForInsertedTextLabel:(id)a3;
- (void)setXConstraintsForDotNumbers:(id)a3;
- (void)setYConstraintsForDotNumbers:(id)a3;
@end

@implementation VOTUIBrailleView

- (VOTUIBrailleView)initWithDotNumberPositions:(id)a3 typingMode:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___VOTUIBrailleView;
  v8 = -[VOTUIBrailleView init](&v11, "init");
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.7));
    -[VOTUIBrailleView setBackgroundColor:](v8, "setBackgroundColor:", v9);

    v8->_typingMode = a4;
    objc_storeStrong((id *)&v8->_dotNumberPositions, a3);
    -[VOTUIBrailleView _addSubviews](v8, "_addSubviews");
  }

  return v8;
}

- (void)setDotNumberPositions:(id)a3 typingMode:(int64_t)a4
{
  v10 = (NSArray *)a3;
  if (self->_typingMode != a4)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[VOTUIBrailleView typingModeConstraintsForInsertedTextLabel]( self,  "typingModeConstraintsForInsertedTextLabel"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue( -[VOTUIBrailleView typingModeConstraintsForInsertedTextLabel]( self,  "typingModeConstraintsForInsertedTextLabel"));
      -[VOTUIBrailleView removeConstraints:](self, "removeConstraints:", v8);
    }
  }

  if (self->_dotNumberPositions != v10)
  {
    objc_storeStrong((id *)&self->_dotNumberPositions, a3);
    -[VOTUIBrailleView _updateConstantsForDotNumberConstraints](self, "_updateConstantsForDotNumberConstraints");
    -[VOTUIBrailleView _updateDotsSevenAndEightVisibility](self, "_updateDotsSevenAndEightVisibility");
    -[VOTUIBrailleView setNeedsLayout](self, "setNeedsLayout");
  }

  if (self->_typingMode != a4)
  {
    self->_typingMode = a4;
    v9 = (void *)objc_claimAutoreleasedReturnValue( -[VOTUIBrailleView _generateAndStoreTypingModeConstraintsForInsertedTextLabel]( self,  "_generateAndStoreTypingModeConstraintsForInsertedTextLabel"));
    -[VOTUIBrailleView addConstraints:](self, "addConstraints:", v9);
  }
}

- (void)flashInsertedText:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    -[UILabel setText:](self->_insertedTextLabel, "setText:", v4);
    -[UILabel setAlpha:](self->_insertedTextLabel, "setAlpha:", 1.0);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_C608;
    v5[3] = &unk_247D0;
    v5[4] = self;
    +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v5, 1.0);
  }
}

- (void)highlightBrailleDots:(id)a3
{
  id v4 = a3;
  if (-[VOTUIBrailleView _numberOfDots](self, "_numberOfDots"))
  {
    unint64_t v5 = 1LL;
    do
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v5));
      unsigned int v7 = [v4 containsObject:v6];

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIBrailleView _circleViewForDotNumber:](self, "_circleViewForDotNumber:", v5));
      v9 = v8;
      if (v7)
      {
        [v8 setAlpha:0.0];

        v10 = (void *)objc_claimAutoreleasedReturnValue( -[VOTUIBrailleView _highlightedCircleViewForDotNumber:]( self,  "_highlightedCircleViewForDotNumber:",  v5));
        [v10 setAlpha:0.5];
      }

      else
      {
        [v8 alpha];
        double v12 = v11;

        if (v12 != 0.5)
        {
          v13[0] = _NSConcreteStackBlock;
          v13[1] = 3221225472LL;
          v13[2] = sub_C784;
          v13[3] = &unk_24820;
          v13[4] = self;
          v13[5] = v5;
          +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v13, 0.3);
        }
      }

      ++v5;
    }

    while (v5 <= -[VOTUIBrailleView _numberOfDots](self, "_numberOfDots"));
  }
}

- (unint64_t)_numberOfDots
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIBrailleView dotNumberPositions](self, "dotNumberPositions"));
  v3 = (int *)[v2 count];

  if (v3 != (int *)((char *)&dword_4 + 2) && v3 != &dword_8)
  {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/VOTAXUIService/VOTUIBrailleView.m",  138LL,  "-[VOTUIBrailleView _numberOfDots]",  @"Only six dot and eight dot Braille are supported currently");
    if ((unint64_t)v3 >= 9) {
      _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/VOTAXUIService/VOTUIBrailleView.m",  139LL,  "-[VOTUIBrailleView _numberOfDots]",  @"Number of dots was greater than the maximum number of dot views we have.  We need to update that.");
    }
  }

  return (unint64_t)v3;
}

- (BOOL)_isEightDotBraille
{
  return (int *)-[VOTUIBrailleView _numberOfDots](self, "_numberOfDots") == &dword_8;
}

- (id)_circleViewForDotNumber:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndexedSubscript:](self->_dotNumberCircleViews, "objectAtIndexedSubscript:", a3 - 1);
}

- (id)_highlightedCircleViewForDotNumber:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndexedSubscript:]( self->_dotNumberHighlightedCircleViews,  "objectAtIndexedSubscript:",  a3 - 1);
}

- (id)_dotCircleImageFilled:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_2D378 != -1) {
    dispatch_once(&qword_2D378, &stru_24860);
  }
  id v4 = &qword_2D370;
  if (!v3) {
    id v4 = &qword_2D368;
  }
  return (id)*v4;
}

- (void)_addSubviews
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unint64_t v4 = -[VOTUIBrailleView _numberOfDots](self, "_numberOfDots");
  unint64_t v5 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v4);
  dotNumberCircleViews = self->_dotNumberCircleViews;
  self->_dotNumberCircleViews = v5;

  unsigned int v7 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v4);
  dotNumberHighlightedCircleViews = self->_dotNumberHighlightedCircleViews;
  self->_dotNumberHighlightedCircleViews = v7;

  v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  viewsForEightDotBrailleOnly = self->_viewsForEightDotBrailleOnly;
  self->_viewsForEightDotBrailleOnly = v9;

  uint64_t v11 = 1LL;
  do
  {
    double v12 = objc_alloc(&OBJC_CLASS___UIImageView);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIBrailleView _dotCircleImageFilled:](self, "_dotCircleImageFilled:", 0LL));
    v14 = -[UIImageView initWithImage:](v12, "initWithImage:", v13);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v14,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v15 = objc_alloc(&OBJC_CLASS___UIImageView);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIBrailleView _dotCircleImageFilled:](self, "_dotCircleImageFilled:", 1LL));
    v17 = -[UIImageView initWithImage:](v15, "initWithImage:", v16);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v17,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIImageView setAlpha:](v14, "setAlpha:", 0.5);
    -[UIImageView setAlpha:](v17, "setAlpha:", 0.0);
    v18 = objc_alloc_init(&OBJC_CLASS___UILabel);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v11));
    uint64_t v20 = AXFormatNumber();
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    -[UILabel setText:](v18, "setText:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _thinSystemFontOfSize:](&OBJC_CLASS___UIFont, "_thinSystemFontOfSize:", 60.0));
    -[UILabel setFont:](v18, "setFont:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[UILabel setTextColor:](v18, "setTextColor:", v23);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
    -[VOTUIBrailleView addSubview:](self, "addSubview:", v14);
    -[VOTUIBrailleView addSubview:](self, "addSubview:", v17);
    -[VOTUIBrailleView addSubview:](self, "addSubview:", v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue( -[VOTUIBrailleView _constraintsToCenterItem:withItem:]( self,  "_constraintsToCenterItem:withItem:",  v14,  v17));
    [v3 addObjectsFromArray:v24];

    v25 = (void *)objc_claimAutoreleasedReturnValue( -[VOTUIBrailleView _constraintsToCenterItem:withItem:]( self,  "_constraintsToCenterItem:withItem:",  v18,  v14));
    [v3 addObjectsFromArray:v25];

    -[NSMutableArray addObject:](self->_dotNumberCircleViews, "addObject:", v14);
    -[NSMutableArray addObject:](self->_dotNumberHighlightedCircleViews, "addObject:", v17);
    uint64_t v26 = v11 - 7;
    if ((unint64_t)(v11 - 7) <= 1)
    {
      v27 = self->_viewsForEightDotBrailleOnly;
      v38[0] = v18;
      v38[1] = v14;
      v38[2] = v17;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v38, 3LL));
      -[NSMutableArray addObjectsFromArray:](v27, "addObjectsFromArray:", v28);
    }

    uint64_t v11 = v26 + 8;
  }

  while (v26 != 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIBrailleView xConstraintsForDotNumbers](self, "xConstraintsForDotNumbers"));
  if (v29)
  {

LABEL_8:
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/VOTAXUIService/VOTUIBrailleView.m",  233LL,  "-[VOTUIBrailleView _addSubviews]",  @"Should not have created constraints for the dot numbers already");
    goto LABEL_9;
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIBrailleView yConstraintsForDotNumbers](self, "yConstraintsForDotNumbers"));

  if (v30) {
    goto LABEL_8;
  }
LABEL_9:
  v31 = (void *)objc_claimAutoreleasedReturnValue( -[VOTUIBrailleView _generateAndStoreConstraintsForDotNumbers]( self,  "_generateAndStoreConstraintsForDotNumbers",  24LL));
  [v3 addObjectsFromArray:v31];

  v32 = objc_alloc_init(&OBJC_CLASS___UILabel);
  insertedTextLabel = self->_insertedTextLabel;
  self->_insertedTextLabel = v32;

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _thinSystemFontOfSize:](&OBJC_CLASS___UIFont, "_thinSystemFontOfSize:", 100.0));
  -[UILabel setFont:](self->_insertedTextLabel, "setFont:", v34);

  -[UILabel setAdjustsFontSizeToFitWidth:](self->_insertedTextLabel, "setAdjustsFontSizeToFitWidth:", 1LL);
  -[UILabel setTextAlignment:](self->_insertedTextLabel, "setTextAlignment:", 1LL);
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  -[UILabel setTextColor:](self->_insertedTextLabel, "setTextColor:", v35);

  -[UILabel setAlpha:](self->_insertedTextLabel, "setAlpha:", 0.0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( self->_insertedTextLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[VOTUIBrailleView addSubview:](self, "addSubview:", self->_insertedTextLabel);
  v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  self->_insertedTextLabel,  9LL,  0LL,  self,  9LL,  1.0,  0.0));
  [v3 addObject:v36];

  v37 = (void *)objc_claimAutoreleasedReturnValue( -[VOTUIBrailleView _generateAndStoreTypingModeConstraintsForInsertedTextLabel]( self,  "_generateAndStoreTypingModeConstraintsForInsertedTextLabel"));
  [v3 addObjectsFromArray:v37];

  -[VOTUIBrailleView addConstraints:](self, "addConstraints:", v3);
  -[VOTUIBrailleView _updateDotsSevenAndEightVisibility](self, "_updateDotsSevenAndEightVisibility");
}

- (void)_updateDotsSevenAndEightVisibility
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  BOOL v3 = self->_viewsForEightDotBrailleOnly;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      unsigned int v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend( *(id *)(*((void *)&v8 + 1) + 8 * (void)v7),  "setHidden:",  -[VOTUIBrailleView _isEightDotBraille](self, "_isEightDotBraille", (void)v8) ^ 1);
        unsigned int v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v5);
  }
}

- (id)_xConstraintForDotNumber:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIBrailleView xConstraintsForDotNumbers](self, "xConstraintsForDotNumbers"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:a3 - 1]);

  return v5;
}

- (id)_yConstraintForDotNumber:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIBrailleView yConstraintsForDotNumbers](self, "yConstraintsForDotNumbers"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:a3 - 1]);

  return v5;
}

- (id)_constraintsToCenterItem:(id)a3 withItem:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v6,  9LL,  0LL,  v5,  9LL,  1.0,  0.0));
  v11[0] = v7;
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v6,  10LL,  0LL,  v5,  10LL,  1.0,  0.0));

  v11[1] = v8;
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));

  return v9;
}

- (id)_generateAndStoreTypingModeConstraintsForInsertedTextLabel
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  int64_t v4 = -[VOTUIBrailleView typingMode](self, "typingMode");
  if (v4 == 1)
  {
    if (-[VOTUIBrailleView _isEightDotBraille](self, "_isEightDotBraille")) {
      uint64_t v12 = 7LL;
    }
    else {
      uint64_t v12 = 3LL;
    }
    if (-[VOTUIBrailleView _isEightDotBraille](self, "_isEightDotBraille")) {
      uint64_t v13 = 8LL;
    }
    else {
      uint64_t v13 = 6LL;
    }
    insertedTextLabel = self->_insertedTextLabel;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIBrailleView _circleViewForDotNumber:](self, "_circleViewForDotNumber:", v12));
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  insertedTextLabel,  1LL,  1LL,  v15,  2LL,  1.0,  10.0));
    [v3 addObject:v16];

    v17 = self->_insertedTextLabel;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIBrailleView _circleViewForDotNumber:](self, "_circleViewForDotNumber:", v13));
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v17,  2LL,  -1LL,  v18,  1LL,  1.0,  -10.0));
    [v3 addObject:v19];

    uint64_t v20 = self->_insertedTextLabel;
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIBrailleView _circleViewForDotNumber:](self, "_circleViewForDotNumber:", v12));
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v20,  10LL,  0LL,  v11,  10LL,  1.0,  0.0));
    [v3 addObject:v21];
  }

  else
  {
    if (v4)
    {
      int64_t v23 = -[VOTUIBrailleView typingMode](self, "typingMode");
      _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/VOTAXUIService/VOTUIBrailleView.m",  323LL,  "-[VOTUIBrailleView _generateAndStoreTypingModeConstraintsForInsertedTextLabel]",  @"Unknown typing mode when setting up constraints for inserted text label: %i");
      goto LABEL_13;
    }

    id v5 = self->_insertedTextLabel;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIBrailleView _circleViewForDotNumber:](self, "_circleViewForDotNumber:", 4LL));
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v5,  1LL,  1LL,  v6,  2LL,  1.0,  10.0));
    [v3 addObject:v7];

    __int128 v8 = self->_insertedTextLabel;
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIBrailleView _circleViewForDotNumber:](self, "_circleViewForDotNumber:", 1LL));
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v8,  2LL,  -1LL,  v9,  1LL,  1.0,  -10.0));
    [v3 addObject:v10];

    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  self->_insertedTextLabel,  10LL,  0LL,  self,  10LL,  1.0,  0.0));
    [v3 addObject:v11];
  }

LABEL_13:
  -[VOTUIBrailleView setTypingModeConstraintsForInsertedTextLabel:]( self,  "setTypingModeConstraintsForInsertedTextLabel:",  v3,  v23);
  return v3;
}

- (id)_generateAndStoreConstraintsForDotNumbers
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIBrailleView dotNumberPositions](self, "dotNumberPositions"));
  id v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v6)
  {

    for (unint64_t i = 1LL; i != 9; ++i)
    {
LABEL_11:
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIBrailleView _circleViewForDotNumber:](self, "_circleViewForDotNumber:", i));
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v18,  9LL,  0LL,  self,  1LL,  1.0,  0.0));
      [v3 addObject:v19];

      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v18,  10LL,  0LL,  self,  3LL,  1.0,  0.0));
      [v4 addObject:v20];
    }

    goto LABEL_12;
  }

  id v7 = v6;
  id obj = v5;
  uint64_t v8 = *(void *)v25;
  unint64_t i = 1LL;
  do
  {
    for (j = 0LL; j != v7; j = (char *)j + 1)
    {
      if (*(void *)v25 != v8) {
        objc_enumerationMutation(obj);
      }
      [*(id *)(*((void *)&v24 + 1) + 8 * (void)j) CGPointValue];
      double v12 = v11;
      double v14 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIBrailleView _circleViewForDotNumber:](self, "_circleViewForDotNumber:", (char *)j + i));
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v15,  9LL,  0LL,  self,  1LL,  1.0,  v12));
      [v3 addObject:v16];

      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v15,  10LL,  0LL,  self,  3LL,  1.0,  v14));
      [v4 addObject:v17];
    }

    id v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    i += (unint64_t)j;
  }

  while (v7);

  if (i <= 8) {
    goto LABEL_11;
  }
LABEL_12:
  -[VOTUIBrailleView setXConstraintsForDotNumbers:](self, "setXConstraintsForDotNumbers:", v3);
  -[VOTUIBrailleView setYConstraintsForDotNumbers:](self, "setYConstraintsForDotNumbers:", v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v3 arrayByAddingObjectsFromArray:v4]);

  return v21;
}

- (void)_updateConstantsForDotNumberConstraints
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIBrailleView xConstraintsForDotNumbers](self, "xConstraintsForDotNumbers"));
  id v4 = [v3 count];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIBrailleView dotNumberPositions](self, "dotNumberPositions"));
  if (v4 < [v5 count])
  {

LABEL_4:
    id v26 = (id)objc_claimAutoreleasedReturnValue(-[VOTUIBrailleView xConstraintsForDotNumbers](self, "xConstraintsForDotNumbers"));
    [v26 count];
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIBrailleView yConstraintsForDotNumbers](self, "yConstraintsForDotNumbers"));
    [v10 count];
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIBrailleView dotNumberPositions](self, "dotNumberPositions"));
    [v11 count];
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/VOTAXUIService/VOTUIBrailleView.m",  362LL,  "-[VOTUIBrailleView _updateConstantsForDotNumberConstraints]",  @"Should have two constraints for each dot number.  Had %lu X constraints, %lu Y constraints, and %lu dot number positions.");

    return;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIBrailleView yConstraintsForDotNumbers](self, "yConstraintsForDotNumbers"));
  id v7 = [v6 count];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIBrailleView dotNumberPositions](self, "dotNumberPositions"));
  id v9 = [v8 count];

  if (v7 < v9) {
    goto LABEL_4;
  }
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIBrailleView dotNumberPositions](self, "dotNumberPositions"));
  id v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = 0LL;
    uint64_t v16 = *(void *)v28;
    do
    {
      v17 = 0LL;
      do
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v27 + 1) + 8 * (void)v17) CGPointValue];
        double v19 = v18;
        double v21 = v20;
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIBrailleView xConstraintsForDotNumbers](self, "xConstraintsForDotNumbers"));
        int64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectAtIndexedSubscript:(char *)v17 + v15]);

        [v23 setConstant:v19];
        __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIBrailleView yConstraintsForDotNumbers](self, "yConstraintsForDotNumbers"));
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectAtIndexedSubscript:(char *)v17 + v15]);

        [v25 setConstant:v21];
        v17 = (char *)v17 + 1;
      }

      while (v14 != v17);
      id v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
      v15 += (uint64_t)v17;
    }

    while (v14);
  }
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (NSArray)dotNumberPositions
{
  return self->_dotNumberPositions;
}

- (int64_t)typingMode
{
  return self->_typingMode;
}

- (NSArray)xConstraintsForDotNumbers
{
  return self->_xConstraintsForDotNumbers;
}

- (void)setXConstraintsForDotNumbers:(id)a3
{
}

- (NSArray)yConstraintsForDotNumbers
{
  return self->_yConstraintsForDotNumbers;
}

- (void)setYConstraintsForDotNumbers:(id)a3
{
}

- (NSArray)typingModeConstraintsForInsertedTextLabel
{
  return self->_typingModeConstraintsForInsertedTextLabel;
}

- (void)setTypingModeConstraintsForInsertedTextLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end