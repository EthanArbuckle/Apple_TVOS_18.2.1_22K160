@interface TVSSExampleMenuItemProvider
- (NSTimer)timer;
- (TVSSExampleMenuItemProvider)init;
- (TVSSImageContent)imageContent1;
- (TVSSImageContent)imageContent2;
- (TVSSImageContent)imageContent3;
- (TVSSMenuItem)countItem;
- (TVSSMenuItem)primaryItem;
- (TVSSMenuItem)secondaryItem;
- (TVSSMenuItem)tertiaryItem;
- (void)_handleTimerTick;
- (void)dealloc;
- (void)setCountItem:(id)a3;
- (void)setImageContent1:(id)a3;
- (void)setImageContent2:(id)a3;
- (void)setImageContent3:(id)a3;
- (void)setPrimaryItem:(id)a3;
- (void)setSecondaryItem:(id)a3;
- (void)setTertiaryItem:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation TVSSExampleMenuItemProvider

- (TVSSExampleMenuItemProvider)init
{
  SEL v34 = a2;
  v35 = 0LL;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___TVSSExampleMenuItemProvider;
  v35 = -[TVSSMenuItemProvider init](&v33, "init");
  objc_storeStrong((id *)&v35, v35);
  if (v35)
  {
    v20 = objc_alloc(&OBJC_CLASS___TVSSImageContent);
    id v21 =  +[UIImage systemImageNamed:]( &OBJC_CLASS___UIImage,  "systemImageNamed:",  @"thermometer.sun.circle.fill");
    v2 = -[TVSSImageContent initWithImage:](v20, "initWithImage:");
    imageContent1 = v35->_imageContent1;
    v35->_imageContent1 = v2;

    v22 = objc_alloc(&OBJC_CLASS___TVSSImageContent);
    id v23 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"cloud.sun.rain.fill");
    v4 = -[TVSSImageContent initWithImage:](v22, "initWithImage:");
    imageContent2 = v35->_imageContent2;
    v35->_imageContent2 = v4;

    v24 = objc_alloc(&OBJC_CLASS___TVSSImageContent);
    id v25 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"sun.max");
    v6 = -[TVSSImageContent initWithImage:](v24, "initWithImage:");
    imageContent3 = v35->_imageContent3;
    v35->_imageContent3 = v6;

    v8 = -[TVSSMenuItem initWithIdentifier:]( objc_alloc(&OBJC_CLASS___TVSSMenuItem),  "initWithIdentifier:",  @"com.apple.example.primary");
    primaryItem = v35->_primaryItem;
    v35->_primaryItem = v8;

    -[TVSSMenuItem setVisualContent:](v35->_primaryItem, "setVisualContent:", v35->_imageContent1);
    v10 = -[TVSSMenuItem initWithIdentifier:]( objc_alloc(&OBJC_CLASS___TVSSMenuItem),  "initWithIdentifier:",  @"com.apple.example.secondary");
    secondaryItem = v35->_secondaryItem;
    v35->_secondaryItem = v10;

    -[TVSSMenuItem setVisualContent:](v35->_secondaryItem, "setVisualContent:", v35->_imageContent2);
    v12 = -[TVSSMenuItem initWithIdentifier:]( objc_alloc(&OBJC_CLASS___TVSSMenuItem),  "initWithIdentifier:",  @"com.apple.example.tertiary");
    tertiaryItem = v35->_tertiaryItem;
    v35->_tertiaryItem = v12;

    -[TVSSMenuItem setVisualContent:](v35->_tertiaryItem, "setVisualContent:", v35->_imageContent3);
    v14 = -[TVSSMenuItem initWithIdentifier:]( objc_alloc(&OBJC_CLASS___TVSSMenuItem),  "initWithIdentifier:",  @"com.apple.example.counter");
    countItem = v35->_countItem;
    v35->_countItem = v14;

    objc_initWeak(&location, v35);
    v26 = _NSConcreteStackBlock;
    int v27 = -1073741824;
    int v28 = 0;
    v29 = sub_10005F4D0;
    v30 = &unk_1001B5AB0;
    objc_copyWeak(&v31, &location);
    v16 =  +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  1LL,  &v26,  2.0);
    timer = v35->_timer;
    v35->_timer = v16;

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }

  v19 = v35;
  objc_storeStrong((id *)&v35, 0LL);
  return v19;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[NSTimer invalidate](self->_timer, "invalidate");
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSExampleMenuItemProvider;
  -[TVSSExampleMenuItemProvider dealloc](&v2, "dealloc");
}

- (void)_handleTimerTick
{
  id v23 = self;
  SEL v22 = a2;
  int64_t v21 = self->_counter % 4;
  v15 = objc_alloc(&OBJC_CLASS___TVSSTextContent);
  v18 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v21);
  v17 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v18);
  id v16 =  +[UIFont monospacedSystemFontOfSize:weight:]( &OBJC_CLASS___UIFont,  "monospacedSystemFontOfSize:weight:",  20.0,  UIFontWeightRegular);
  id location = -[TVSSTextContent initWithString:font:textEncapsulation:]( v15,  "initWithString:font:textEncapsulation:",  v17);

  v19 = -[TVSSExampleMenuItemProvider countItem](v23, "countItem");
  -[TVSSMenuItem setVisualContent:](v19, "setVisualContent:", location);

  if (v21)
  {
    switch(v21)
    {
      case 1LL:
        v10 = -[TVSSExampleMenuItemProvider primaryItem](v23, "primaryItem");
        v24[0] = v10;
        v9 = -[TVSSExampleMenuItemProvider secondaryItem](v23, "secondaryItem");
        v24[1] = v9;
        v8 = -[TVSSExampleMenuItemProvider countItem](v23, "countItem");
        v24[2] = v8;
        v7 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 3LL);
        v6 = +[NSOrderedSet orderedSetWithArray:](&OBJC_CLASS___NSOrderedSet, "orderedSetWithArray:");
        -[TVSSMenuItemProvider setItems:](v23, "setItems:");

        break;
      case 2LL:
        imageContent2 = v23->_imageContent2;
        v5 = -[TVSSExampleMenuItemProvider primaryItem](v23, "primaryItem");
        -[TVSSMenuItem setVisualContent:](v5, "setVisualContent:", imageContent2);

        break;
      case 3LL:
        imageContent1 = v23->_imageContent1;
        SEL v3 = -[TVSSExampleMenuItemProvider primaryItem](v23, "primaryItem");
        -[TVSSMenuItem setVisualContent:](v3, "setVisualContent:", imageContent1);

        break;
    }
  }

  else
  {
    v14 = -[TVSSExampleMenuItemProvider primaryItem](v23, "primaryItem");
    v25[0] = v14;
    v13 = -[TVSSExampleMenuItemProvider countItem](v23, "countItem");
    v25[1] = v13;
    v12 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 2LL);
    v11 = +[NSOrderedSet orderedSetWithArray:](&OBJC_CLASS___NSOrderedSet, "orderedSetWithArray:");
    -[TVSSMenuItemProvider setItems:](v23, "setItems:");
  }

  ++v23->_counter;
  objc_storeStrong(&location, 0LL);
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (TVSSMenuItem)primaryItem
{
  return self->_primaryItem;
}

- (void)setPrimaryItem:(id)a3
{
}

- (TVSSMenuItem)secondaryItem
{
  return self->_secondaryItem;
}

- (void)setSecondaryItem:(id)a3
{
}

- (TVSSMenuItem)tertiaryItem
{
  return self->_tertiaryItem;
}

- (void)setTertiaryItem:(id)a3
{
}

- (TVSSMenuItem)countItem
{
  return self->_countItem;
}

- (void)setCountItem:(id)a3
{
}

- (TVSSImageContent)imageContent1
{
  return self->_imageContent1;
}

- (void)setImageContent1:(id)a3
{
}

- (TVSSImageContent)imageContent2
{
  return self->_imageContent2;
}

- (void)setImageContent2:(id)a3
{
}

- (TVSSImageContent)imageContent3
{
  return self->_imageContent3;
}

- (void)setImageContent3:(id)a3
{
}

- (void).cxx_destruct
{
}

@end