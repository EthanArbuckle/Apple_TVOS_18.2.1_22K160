@interface AXTVBluetoothCell
- (AXTVBluetoothCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (AXTVBluetoothDevice)bluetoothDevice;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (void)_enableTouchGestureIfPossible;
- (void)_touchGesture:(id)a3;
- (void)_updateAccessoryTintColor;
- (void)_updateBatteryImage;
- (void)dealloc;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prepareForReuse;
- (void)setBluetoothDevice:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation AXTVBluetoothCell

- (AXTVBluetoothCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___AXTVBluetoothCell;
  v4 = -[AXTVBluetoothCell initWithStyle:reuseIdentifier:](&v14, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    batteryIconView = v4->_batteryIconView;
    v4->_batteryIconView = v5;

    -[UIImageView setContentMode:](v4->_batteryIconView, "setContentMode:", 4LL);
    v7 = v4->_batteryIconView;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothCell detailTextLabel](v4, "detailTextLabel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 textColor]);
    -[UIImageView setTintColor:](v7, "setTintColor:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothCell contentView](v4, "contentView"));
    [v10 addSubview:v4->_batteryIconView];

    v11 = -[AXTVBluetoothRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___AXTVBluetoothRecognizer),  "initWithTarget:action:",  v4,  "_touchGesture:");
    touchGesture = v4->_touchGesture;
    v4->_touchGesture = v11;

    -[AXTVBluetoothRecognizer setDelegate:](v4->_touchGesture, "setDelegate:", v4);
    -[AXTVBluetoothRecognizer setEnabled:](v4->_touchGesture, "setEnabled:", 0LL);
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AXTVBluetoothCell;
  -[AXTVBluetoothCell dealloc](&v3, "dealloc");
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AXTVBluetoothCell;
  -[AXTVBluetoothCell prepareForReuse](&v3, "prepareForReuse");
  -[AXTVBluetoothCell setBluetoothDevice:](self, "setBluetoothDevice:", 0LL);
}

- (void)setBluetoothDevice:(id)a3
{
  v5 = (AXTVBluetoothDevice *)a3;
  p_bluetoothDevice = &self->_bluetoothDevice;
  bluetoothDevice = self->_bluetoothDevice;
  v8 = v5;
  if (bluetoothDevice != v5)
  {
    -[AXTVBluetoothDevice removeObserver:forKeyPath:context:]( bluetoothDevice,  "removeObserver:forKeyPath:context:",  self,  @"state",  off_80068);
    -[AXTVBluetoothDevice removeObserver:forKeyPath:context:]( *p_bluetoothDevice,  "removeObserver:forKeyPath:context:",  self,  @"batteryLevel",  off_80070);
    -[AXTVBluetoothDevice removeObserver:forKeyPath:context:]( *p_bluetoothDevice,  "removeObserver:forKeyPath:context:",  self,  @"charging",  off_80078);
    objc_storeStrong((id *)&self->_bluetoothDevice, a3);
    -[AXTVBluetoothDevice addObserver:forKeyPath:options:context:]( *p_bluetoothDevice,  "addObserver:forKeyPath:options:context:",  self,  @"state",  0LL,  off_80068);
    -[AXTVBluetoothDevice addObserver:forKeyPath:options:context:]( *p_bluetoothDevice,  "addObserver:forKeyPath:options:context:",  self,  @"batteryLevel",  0LL,  off_80070);
    -[AXTVBluetoothDevice addObserver:forKeyPath:options:context:]( *p_bluetoothDevice,  "addObserver:forKeyPath:options:context:",  self,  @"charging",  0LL,  off_80078);
    -[AXTVBluetoothRecognizer setMatchingPhysicalDevice:]( self->_touchGesture,  "setMatchingPhysicalDevice:",  *p_bluetoothDevice);
    -[AXTVBluetoothCell _enableTouchGestureIfPossible](self, "_enableTouchGestureIfPossible");
  }

  -[AXTVBluetoothCell _updateBatteryImage](self, "_updateBatteryImage");
}

- (void)layoutSubviews
{
  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___AXTVBluetoothCell;
  -[AXTVBluetoothCell layoutSubviews](&v46, "layoutSubviews");
  if ((-[UIImageView isHidden](self->_batteryIconView, "isHidden") & 1) == 0)
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothCell detailTextLabel](self, "detailTextLabel"));
    [v3 frame];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;

    CGFloat y = CGRectZero.origin.y;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_batteryIconView, "image"));
    [v13 size];
    double v15 = v14 + 12.0;

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_batteryIconView, "image"));
    [v16 size];
    double v18 = v17 + 12.0;

    if (-[AXTVBluetoothCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"))
    {
      v47.origin.x = v5;
      v47.origin.CGFloat y = v7;
      v47.size.width = v9;
      v47.size.height = v11;
      double v19 = CGRectGetMaxX(v47) + 12.0;
    }

    else
    {
      v48.origin.x = v5;
      v48.origin.CGFloat y = v7;
      v48.size.width = v9;
      v48.size.height = v11;
      double MinX = CGRectGetMinX(v48);
      v49.origin.x = CGRectZero.origin.x;
      v49.origin.CGFloat y = y;
      v49.size.width = v15;
      v49.size.height = v18;
      double v19 = MinX - CGRectGetWidth(v49) + -12.0;
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothCell contentView](self, "contentView"));
    [v21 bounds];
    double Height = CGRectGetHeight(v50);
    v51.origin.x = v19;
    v51.origin.CGFloat y = y;
    v51.size.width = v15;
    v51.size.height = v18;
    double v23 = floor((Height - CGRectGetHeight(v51)) * 0.5);

    -[UIImageView setFrame:](self->_batteryIconView, "setFrame:", v19, v23, v15, v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothCell textLabel](self, "textLabel"));
    [v24 frame];
    double v26 = v25;
    double v28 = v27;
    CGFloat v29 = v18;
    CGFloat v30 = v15;
    double v32 = v31;
    double v34 = v33;

    id v35 = -[AXTVBluetoothCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    double v36 = v26;
    double v37 = v28;
    double v38 = v32;
    double v39 = v34;
    if (v35)
    {
      CGFloat v40 = CGRectGetMinX(*(CGRect *)&v36);
      v52.size.height = v29;
      double v41 = v40;
      v52.origin.x = v19;
      v52.origin.CGFloat y = v23;
      v52.size.width = v30;
      double v42 = v41 + CGRectGetMaxX(v52) + 18.0;
      if (v42 > 0.0) {
        double v42 = 0.0;
      }
    }

    else
    {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v36);
      v53.origin.x = v19;
      v53.origin.CGFloat y = v23;
      v53.size.width = v30;
      v53.size.height = v29;
      double v42 = fmax(MaxX - (CGRectGetMinX(v53) + -18.0), 0.0);
    }

    double v43 = v32 - v42;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothCell textLabel](self, "textLabel"));
    objc_msgSend(v44, "setFrame:", v26, v28, v43, v34);
  }

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AXTVBluetoothCell;
  id v6 = a4;
  -[AXTVBluetoothCell didUpdateFocusInContext:withAnimationCoordinator:]( &v8,  "didUpdateFocusInContext:withAnimationCoordinator:",  a3,  v6);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_AF24;
  v7[3] = &unk_65530;
  v7[4] = self;
  [v6 addCoordinatedAnimations:v7 completion:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AXTVBluetoothCell;
  id v4 = a3;
  -[AXTVBluetoothCell traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  CGFloat v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothCell traitCollection](self, "traitCollection", v8.receiver, v8.super_class));
  id v6 = [v5 userInterfaceStyle];

  id v7 = [v4 userInterfaceStyle];
  if (v6)
  {
    if (v7 != v6) {
      -[AXTVBluetoothCell _updateAccessoryTintColor](self, "_updateAccessoryTintColor");
    }
  }

- (void)willMoveToWindow:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AXTVBluetoothCell;
  -[AXTVBluetoothCell willMoveToWindow:](&v6, "willMoveToWindow:", v4);
  CGFloat v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothCell window](self, "window"));
  [v5 removeGestureRecognizer:self->_touchGesture];

  -[AXTVBluetoothRecognizer setEnabled:](self->_touchGesture, "setEnabled:", 0LL);
  if (v4)
  {
    [v4 addGestureRecognizer:self->_touchGesture];
    -[AXTVBluetoothCell _enableTouchGestureIfPossible](self, "_enableTouchGestureIfPossible");
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_80068 == a6 || off_80078 == a6 || off_80070 == a6)
  {
    -[AXTVBluetoothCell _updateBatteryImage](self, "_updateBatteryImage", a3, a4, a5);
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___AXTVBluetoothCell;
    -[AXTVBluetoothCell observeValueForKeyPath:ofObject:change:context:]( &v8,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)_updateAccessoryTintColor
{
  if (qword_80500 != -1) {
    dispatch_once(&qword_80500, &stru_65570);
  }
  unsigned int v3 = -[AXTVBluetoothCell isFocused](self, "isFocused");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothCell traitCollection](self, "traitCollection"));
  CGFloat v5 = (char *)[v4 userInterfaceStyle];

  objc_super v6 = &qword_804F0;
  if (v5 == (_BYTE *)&dword_0 + 2) {
    int v7 = v3;
  }
  else {
    int v7 = 1;
  }
  if (v7) {
    objc_super v6 = &qword_804F8;
  }
  -[UIImageView setTintColor:](self->_batteryIconView, "setTintColor:", *v6);
}

- (void)_enableTouchGestureIfPossible
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothRecognizer matchingPhysicalDevice](self->_touchGesture, "matchingPhysicalDevice"));

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothRecognizer view](self->_touchGesture, "view"));
  if (v3) {
    BOOL v5 = v4 == 0LL;
  }
  else {
    BOOL v5 = 1;
  }
  uint64_t v6 = !v5;
  -[AXTVBluetoothRecognizer setEnabled:](self->_touchGesture, "setEnabled:", v6);
}

- (void)_updateBatteryImage
{
  int64_t v3 = -[AXTVBluetoothDevice batteryLevel](self->_bluetoothDevice, "batteryLevel");
  if (v3 < 0
    || (unint64_t v4 = v3, (char *)-[AXTVBluetoothDevice state](self->_bluetoothDevice, "state") != (char *)&dword_0 + 2))
  {
    -[UIImageView setImage:](self->_batteryIconView, "setImage:", 0LL);
    -[UIImageView setHidden:](self->_batteryIconView, "setHidden:", 1LL);
  }

  else
  {
    if (-[AXTVBluetoothDevice isCharging](self->_bluetoothDevice, "isCharging"))
    {
      if (v4 > 0x5A) {
        BOOL v5 = @"Settings-Battery-Charged";
      }
      else {
        BOOL v5 = @"Settings-Battery-Charging";
      }
    }

    else
    {
      unint64_t v6 = -[AXTVBluetoothDevice batteryLevel](self->_bluetoothDevice, "batteryLevel");
      if ((uint64_t)v6 > 5)
      {
        if (v6 > 0x14)
        {
          if (v6 > 0x28)
          {
            if (v6 > 0x3C)
            {
              if (v6 > 0x50) {
                BOOL v5 = @"Settings-Battery-Full";
              }
              else {
                BOOL v5 = @"Settings-Battery-80";
              }
            }

            else
            {
              BOOL v5 = @"Settings-Battery-60";
            }
          }

          else
          {
            BOOL v5 = @"Settings-Battery-40";
          }
        }

        else
        {
          BOOL v5 = @"Settings-Battery-20";
        }
      }

      else
      {
        BOOL v5 = @"Settings-Battery-VeryLow";
      }
    }

    int v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", v5));
    -[UIImageView setImage:](self->_batteryIconView, "setImage:", v7);
    -[UIImageView setHidden:](self->_batteryIconView, "setHidden:", 0LL);
  }

  -[AXTVBluetoothCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)_touchGesture:(id)a3
{
  unint64_t v4 = (char *)[a3 state];
  if (v4 != (_BYTE *)&dword_0 + 2)
  {
    if (v4 == (_BYTE *)&dword_0 + 1)
    {
      BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothCell textLabel](self, "textLabel"));
      unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 text]);
      int v7 = (NSString *)[v6 copy];
      originalText = self->_originalText;
      self->_originalText = v7;

      +[AXTVBluetoothFacade numberOfConnectedRemotes](&OBJC_CLASS___AXTVBluetoothFacade, "numberOfConnectedRemotes");
      -[AXTVBluetoothDevice type](self->_bluetoothDevice, "type");
    }

    else
    {
      id v9 = (id)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothCell textLabel](self, "textLabel"));
      [v9 setText:self->_originalText];
    }
  }

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (AXTVBluetoothDevice)bluetoothDevice
{
  return self->_bluetoothDevice;
}

- (void).cxx_destruct
{
}

@end