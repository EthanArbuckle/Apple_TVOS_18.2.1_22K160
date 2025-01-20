@interface TVSettingsBluetoothCell
- (TVSBluetoothDevice)bluetoothDevice;
- (TVSettingsBluetoothCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_updateBatteryImage;
- (void)_updateBatterySymbolConfiguration;
- (void)dealloc;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prepareForReuse;
- (void)setBluetoothDevice:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TVSettingsBluetoothCell

- (TVSettingsBluetoothCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVSettingsBluetoothCell;
  v4 = -[TVSettingsBluetoothCell initWithStyle:reuseIdentifier:](&v12, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    batteryIconView = v4->_batteryIconView;
    v4->_batteryIconView = v5;

    -[UIImageView setContentMode:](v4->_batteryIconView, "setContentMode:", 4LL);
    v7 = v4->_batteryIconView;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothCell detailTextLabel](v4, "detailTextLabel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 textColor]);
    -[UIImageView setTintColor:](v7, "setTintColor:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothCell contentView](v4, "contentView"));
    [v10 addSubview:v4->_batteryIconView];

    -[TVSettingsBluetoothCell _updateBatterySymbolConfiguration](v4, "_updateBatterySymbolConfiguration");
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSettingsBluetoothCell;
  -[TVSettingsBluetoothCell dealloc](&v3, "dealloc");
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSettingsBluetoothCell;
  -[TVSettingsBluetoothCell prepareForReuse](&v3, "prepareForReuse");
  -[TVSettingsBluetoothCell setBluetoothDevice:](self, "setBluetoothDevice:", 0LL);
}

- (void)setBluetoothDevice:(id)a3
{
  v5 = (TVSBluetoothDevice *)a3;
  p_bluetoothDevice = &self->_bluetoothDevice;
  bluetoothDevice = self->_bluetoothDevice;
  v8 = v5;
  if (bluetoothDevice != v5)
  {
    -[TVSBluetoothDevice removeObserver:forKeyPath:context:]( bluetoothDevice,  "removeObserver:forKeyPath:context:",  self,  @"state",  off_1001E0C48);
    -[TVSBluetoothDevice removeObserver:forKeyPath:context:]( *p_bluetoothDevice,  "removeObserver:forKeyPath:context:",  self,  @"batteryLevel",  off_1001E0C50);
    -[TVSBluetoothDevice removeObserver:forKeyPath:context:]( *p_bluetoothDevice,  "removeObserver:forKeyPath:context:",  self,  @"charging",  off_1001E0C58);
    objc_storeStrong((id *)&self->_bluetoothDevice, a3);
    -[TVSBluetoothDevice addObserver:forKeyPath:options:context:]( *p_bluetoothDevice,  "addObserver:forKeyPath:options:context:",  self,  @"state",  0LL,  off_1001E0C48);
    -[TVSBluetoothDevice addObserver:forKeyPath:options:context:]( *p_bluetoothDevice,  "addObserver:forKeyPath:options:context:",  self,  @"batteryLevel",  0LL,  off_1001E0C50);
    -[TVSBluetoothDevice addObserver:forKeyPath:options:context:]( *p_bluetoothDevice,  "addObserver:forKeyPath:options:context:",  self,  @"charging",  0LL,  off_1001E0C58);
  }

  -[TVSettingsBluetoothCell _updateBatteryImage](self, "_updateBatteryImage");
  -[TVSettingsBluetoothCell _updateBatterySymbolConfiguration](self, "_updateBatterySymbolConfiguration");
}

- (void)layoutSubviews
{
  v44.receiver = self;
  v44.super_class = (Class)&OBJC_CLASS___TVSettingsBluetoothCell;
  -[TVSettingsBluetoothCell layoutSubviews](&v44, "layoutSubviews");
  if ((-[UIImageView isHidden](self->_batteryIconView, "isHidden") & 1) == 0)
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothCell detailTextLabel](self, "detailTextLabel"));
    [v3 frame];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;

    CGFloat y = CGRectZero.origin.y;
    -[UIImageView intrinsicContentSize](self->_batteryIconView, "intrinsicContentSize");
    double v14 = v13;
    -[UIImageView intrinsicContentSize](self->_batteryIconView, "intrinsicContentSize");
    double v16 = v15;
    if (-[TVSettingsBluetoothCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"))
    {
      v45.origin.x = v5;
      v45.origin.CGFloat y = v7;
      v45.size.width = v9;
      v45.size.height = v11;
      double MaxX = CGRectGetMaxX(v45);
      double v18 = 12.0;
    }

    else
    {
      v46.origin.x = v5;
      v46.origin.CGFloat y = v7;
      v46.size.width = v9;
      v46.size.height = v11;
      double MinX = CGRectGetMinX(v46);
      v47.origin.x = CGRectZero.origin.x;
      v47.origin.CGFloat y = y;
      v47.size.width = v14;
      v47.size.height = v16;
      double MaxX = MinX - CGRectGetWidth(v47);
      double v18 = -12.0;
    }

    double v20 = MaxX + v18;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothCell contentView](self, "contentView"));
    [v21 bounds];
    double Height = CGRectGetHeight(v48);
    v49.origin.x = v20;
    v49.origin.CGFloat y = y;
    v49.size.width = v14;
    v49.size.height = v16;
    double v23 = floor((Height - CGRectGetHeight(v49)) * 0.5);

    -[UIImageView setFrame:](self->_batteryIconView, "setFrame:", v20, v23, v14, v16);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothCell textLabel](self, "textLabel"));
    [v24 frame];
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;

    id v33 = -[TVSettingsBluetoothCell effectiveUserInterfaceLayoutDirection]( self,  "effectiveUserInterfaceLayoutDirection");
    double v34 = v26;
    double v35 = v28;
    double v36 = v30;
    double v37 = v32;
    if (v33)
    {
      CGFloat v38 = CGRectGetMinX(*(CGRect *)&v34);
      v50.size.width = v14;
      double v39 = v38;
      v50.origin.x = v20;
      v50.origin.CGFloat y = v23;
      v50.size.height = v16;
      double v40 = v39 + CGRectGetMaxX(v50) + 18.0;
      if (v40 > 0.0) {
        double v40 = 0.0;
      }
    }

    else
    {
      double v43 = CGRectGetMaxX(*(CGRect *)&v34);
      v51.origin.x = v20;
      v51.origin.CGFloat y = v23;
      v51.size.width = v14;
      v51.size.height = v16;
      double v40 = fmax(v43 - (CGRectGetMinX(v51) + -18.0), 0.0);
    }

    double v41 = v30 - v40;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothCell textLabel](self, "textLabel"));
    objc_msgSend(v42, "setFrame:", v26, v28, v41, v32);
  }

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSettingsBluetoothCell;
  id v6 = a4;
  -[TVSettingsBluetoothCell didUpdateFocusInContext:withAnimationCoordinator:]( &v8,  "didUpdateFocusInContext:withAnimationCoordinator:",  a3,  v6);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000E3AF4;
  v7[3] = &unk_10018E440;
  v7[4] = self;
  [v6 addCoordinatedAnimations:v7 completion:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSettingsBluetoothCell;
  id v4 = a3;
  -[TVSettingsBluetoothCell traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  CGFloat v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothCell traitCollection](self, "traitCollection", v8.receiver, v8.super_class));
  id v6 = [v5 userInterfaceStyle];

  id v7 = [v4 userInterfaceStyle];
  if (v6)
  {
    if (v7 != v6) {
      -[TVSettingsBluetoothCell _updateBatterySymbolConfiguration](self, "_updateBatterySymbolConfiguration");
    }
  }

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1001E0C48 == a6 || off_1001E0C58 == a6 || off_1001E0C50 == a6)
  {
    -[TVSettingsBluetoothCell _updateBatteryImage](self, "_updateBatteryImage", a3, a4, a5);
    -[TVSettingsBluetoothCell _updateBatterySymbolConfiguration](self, "_updateBatterySymbolConfiguration");
  }

  else
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___TVSettingsBluetoothCell;
    -[TVSettingsBluetoothCell observeValueForKeyPath:ofObject:change:context:]( &v9,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)_updateBatterySymbolConfiguration
{
  if (qword_1001E1C80 != -1) {
    dispatch_once(&qword_1001E1C80, &stru_100194E10);
  }
  unsigned int v3 = -[TVSettingsBluetoothCell isFocused](self, "isFocused");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothCell traitCollection](self, "traitCollection"));
  id v5 = [v4 userInterfaceStyle];

  id v6 = &qword_1001E1C40;
  if (v5 == (id)2) {
    int v7 = v3;
  }
  else {
    int v7 = 1;
  }
  if (v7) {
    id v6 = &qword_1001E1C48;
  }
  objc_super v8 = (void *)*v6;
  if (v7) {
    objc_super v9 = &qword_1001E1C58;
  }
  else {
    objc_super v9 = &qword_1001E1C50;
  }
  if (v7) {
    double v10 = &qword_1001E1C68;
  }
  else {
    double v10 = &qword_1001E1C60;
  }
  if (v7) {
    CGFloat v11 = &qword_1001E1C78;
  }
  else {
    CGFloat v11 = &qword_1001E1C70;
  }
  id v12 = v8;
  id v13 = (id)*v9;
  id v14 = (id)*v10;
  id v15 = (id)*v11;
  double v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithTextStyle:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithTextStyle:scale:",  UIFontTextStyleHeadline,  3LL));
  unsigned int v17 = -[TVSBluetoothDevice isCharging](self->_bluetoothDevice, "isCharging");
  uint64_t v18 = (uint64_t)-[TVSBluetoothDevice batteryLevel](self->_bluetoothDevice, "batteryLevel");
  if (v17 && v18 >= 90)
  {
    batteryIconView = self->_batteryIconView;
    id v30 = v12;
    id v31 = v13;
    id v32 = v14;
    double v20 = &v30;
    uint64_t v21 = 3LL;
LABEL_26:
    double v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v20,  v21,  v28,  v29,  v30,  v31,  v32));
    double v26 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration _configurationWithHierarchicalColors:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "_configurationWithHierarchicalColors:",  v25));
    double v27 = (void *)objc_claimAutoreleasedReturnValue([v16 configurationByApplyingConfiguration:v26]);
    -[UIImageView setSymbolConfiguration:](batteryIconView, "setSymbolConfiguration:", v27);

    goto LABEL_27;
  }

  if (v18 > 5) {
    char v22 = 1;
  }
  else {
    char v22 = v17;
  }
  batteryIconView = self->_batteryIconView;
  if ((v22 & 1) == 0)
  {
    id v28 = v15;
    id v29 = v13;
    double v20 = &v28;
    uint64_t v21 = 2LL;
    goto LABEL_26;
  }

  double v23 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithHierarchicalColor:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithHierarchicalColor:",  v12));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v16 configurationByApplyingConfiguration:v23]);
  -[UIImageView setSymbolConfiguration:](batteryIconView, "setSymbolConfiguration:", v24);

LABEL_27:
}

- (void)_updateBatteryImage
{
  unint64_t v3 = (unint64_t)-[TVSBluetoothDevice batteryLevel](self->_bluetoothDevice, "batteryLevel");
  if ((v3 & 0x8000000000000000LL) != 0
    || (unint64_t v4 = v3, -[TVSBluetoothDevice state](self->_bluetoothDevice, "state") != (id)2))
  {
    -[UIImageView setImage:](self->_batteryIconView, "setImage:", 0LL);
    -[UIImageView setHidden:](self->_batteryIconView, "setHidden:", 1LL);
  }

  else
  {
    if (-[TVSBluetoothDevice isCharging](self->_bluetoothDevice, "isCharging"))
    {
      id v5 = @"battery.100percent.bolt";
    }

    else if (v4 > 0x24)
    {
      if (v4 > 0x3D)
      {
        if (v4 > 0x56) {
          id v5 = @"battery.100percent";
        }
        else {
          id v5 = @"battery.75percent";
        }
      }

      else
      {
        id v5 = @"battery.50percent";
      }
    }

    else
    {
      id v5 = @"battery.25percent";
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", v5));
    -[UIImageView setImage:](self->_batteryIconView, "setImage:", v6);
    -[UIImageView setHidden:](self->_batteryIconView, "setHidden:", 0LL);
  }

  -[TVSettingsBluetoothCell setNeedsLayout](self, "setNeedsLayout");
}

- (TVSBluetoothDevice)bluetoothDevice
{
  return self->_bluetoothDevice;
}

- (void).cxx_destruct
{
}

@end