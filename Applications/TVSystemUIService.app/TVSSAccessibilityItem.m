@interface TVSSAccessibilityItem
+ (BOOL)contentIsSelectedWithIdentifier:(id)a3;
+ (id)allAXItems;
+ (id)contentTitleForIdentifier:(id)a3;
+ (id)identifierForPBSAXMenuOptions:(id)a3;
+ (id)itemWithIdentifier:(id)a3;
+ (id)visibleIdentifiersFromOptions:(unint64_t)a3;
+ (void)setSelectionForItemWithIdentifier:(id)a3;
- (BOOL)contentIsSelected;
- (NSString)identifier;
- (TVSSAccessibilityItem)initWithIdentifier:(id)a3;
- (id)contentImage;
@end

@implementation TVSSAccessibilityItem

+ (id)allAXItems
{
  id v13 = [(id)objc_opt_class(a1) itemWithIdentifier:@"voiceover"];
  v15[0] = v13;
  id v12 = [(id)objc_opt_class(a1) itemWithIdentifier:@"zoom"];
  v15[1] = v12;
  id v11 = [(id)objc_opt_class(a1) itemWithIdentifier:@"hovertext"];
  v15[2] = v11;
  id v10 = [(id)objc_opt_class(a1) itemWithIdentifier:@"closedcaption"];
  v15[3] = v10;
  id v9 = [(id)objc_opt_class(a1) itemWithIdentifier:@"audiodecriptions"];
  v15[4] = v9;
  id v8 = [(id)objc_opt_class(a1) itemWithIdentifier:@"switchcontrol"];
  v15[5] = v8;
  id v7 = [(id)objc_opt_class(a1) itemWithIdentifier:@"colorfilters"];
  v15[6] = v7;
  id v6 = [(id)objc_opt_class(a1) itemWithIdentifier:@"lightsensitivity"];
  v15[7] = v6;
  id v5 = [(id)objc_opt_class(a1) itemWithIdentifier:@"reducewhitepoint"];
  v15[8] = v5;
  id v3 = [(id)objc_opt_class(a1) itemWithIdentifier:@"photosensitivemitigation"];
  v15[9] = v3;
  v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 10LL);

  return v4;
}

- (TVSSAccessibilityItem)initWithIdentifier:(id)a3
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = v10;
  id v3 = (void *)objc_opt_class(v10);
  id v7 = [v3 contentTitleForIdentifier:location[0]];
  id v10 = 0LL;
  v8.receiver = v6;
  v8.super_class = (Class)&OBJC_CLASS___TVSSAccessibilityItem;
  id v10 = -[TVSSAccessibilityItem initWithTitle:](&v8, "initWithTitle:");
  objc_storeStrong((id *)&v10, v10);

  if (v10) {
    objc_storeStrong((id *)&v10->_identifier, location[0]);
  }
  id v5 = v10;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v10, 0LL);
  return v5;
}

+ (id)itemWithIdentifier:(id)a3
{
  Class v7 = (Class)a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = objc_alloc(v7);
  id v5 = [v3 initWithIdentifier:location[0]];
  objc_storeStrong(location, 0LL);
  return v5;
}

- (id)contentImage
{
  id v5 = self;
  v4[1] = (id)a2;
  id v10 = (dispatch_once_t *)&unk_1002218A8;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B5DD0);
  if (*v10 != -1) {
    dispatch_once(v10, location);
  }
  objc_storeStrong(&location, 0LL);
  objc_super v8 = (dispatch_once_t *)&unk_1002218B8;
  id v7 = 0LL;
  objc_storeStrong(&v7, &stru_1001B5DF0);
  if (*v8 != -1) {
    dispatch_once(v8, v7);
  }
  objc_storeStrong(&v7, 0LL);
  v4[0] = [(id)qword_1002218A0 objectForKeyedSubscript:v5->_identifier];
  id v3 = [(id)qword_1002218B0 objectForKeyedSubscript:v5->_identifier];
  if (v4[0])
  {
    id v6 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", v4[0]);
  }

  else if (v3)
  {
    id v6 = +[UIImage _systemImageNamed:](&OBJC_CLASS___UIImage, "_systemImageNamed:", v3);
  }

  else
  {
    id v6 = 0LL;
  }

  objc_storeStrong(&v3, 0LL);
  objc_storeStrong(v4, 0LL);
  return v6;
}

- (BOOL)contentIsSelected
{
  return [(id)objc_opt_class(self) contentIsSelectedWithIdentifier:self->_identifier] & 1;
}

+ (id)visibleIdentifiersFromOptions:(unint64_t)a3
{
  id v26 = a1;
  SEL v25 = a2;
  unint64_t v24 = a3;
  objc_super v8 = +[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance");
  id location = -[AXSettings tripleClickOrderedOptions](v8, "tripleClickOrderedOptions");

  if (location && [location count])
  {
    v22 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    id v7 = location;
    v16 = _NSConcreteStackBlock;
    int v17 = -1073741824;
    int v18 = 0;
    v19 = sub_100008B08;
    v20 = &unk_1001B5E18;
    v21[1] = v26;
    v21[0] = v22;
    [v7 enumerateObjectsUsingBlock:&v16];
    objc_storeStrong(&location, v22);
    objc_storeStrong(v21, 0LL);
    objc_storeStrong((id *)&v22, 0LL);
  }

  else
  {
    objc_storeStrong(&location, &off_1001C8510);
  }

  id v4 = location;
  id v9 = _NSConcreteStackBlock;
  int v10 = -1073741824;
  int v11 = 0;
  id v12 = sub_100008BC0;
  id v13 = &unk_1001B5E38;
  unint64_t v14 = v24;
  id v5 = [location indexesOfObjectsPassingTest:&v9];
  id v15 = objc_msgSend(v4, "objectsAtIndexes:");

  id v6 = v15;
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&location, 0LL);
  return v6;
}

+ (id)identifierForPBSAXMenuOptions:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = (dispatch_once_t *)&unk_1002218C8;
  id v6 = 0LL;
  objc_storeStrong(&v6, &stru_1001B5E58);
  if (*v7 != -1) {
    dispatch_once(v7, v6);
  }
  objc_storeStrong(&v6, 0LL);
  id v4 = [(id)qword_1002218C0 objectForKeyedSubscript:location[0]];
  objc_storeStrong(location, 0LL);
  return v4;
}

+ (id)contentTitleForIdentifier:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = (dispatch_once_t *)&unk_1002218D8;
  id v6 = 0LL;
  objc_storeStrong(&v6, &stru_1001B5E78);
  if (*v7 != -1) {
    dispatch_once(v7, v6);
  }
  objc_storeStrong(&v6, 0LL);
  id v4 = [(id)qword_1002218D0 objectForKeyedSubscript:location[0]];
  objc_storeStrong(location, 0LL);
  return v4;
}

+ (BOOL)contentIsSelectedWithIdentifier:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_super v8 = (dispatch_once_t *)&unk_1002218E8;
  id v7 = 0LL;
  objc_storeStrong(&v7, &stru_1001B5E98);
  if (*v8 != -1) {
    dispatch_once(v8, v7);
  }
  objc_storeStrong(&v7, 0LL);
  id v4 = [(id)qword_1002218E0 objectForKeyedSubscript:location[0]];
  if (v4) {
    char v6 = (*((uint64_t (**)(void))v4 + 2))() & 1;
  }
  else {
    char v6 = 0;
  }
  objc_storeStrong(&v4, 0LL);
  objc_storeStrong(location, 0LL);
  return v6 & 1;
}

+ (void)setSelectionForItemWithIdentifier:(id)a3
{
  id v6 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  unsigned __int8 v4 = [v6 contentIsSelectedWithIdentifier:location[0]] & 1;
  if ([location[0] isEqualToString:@"voiceover"])
  {
    _AXSVoiceOverTouchSetEnabled((v4 ^ 1) & 1);
  }

  else if ([location[0] isEqualToString:@"zoom"])
  {
    _AXSZoomTouchSetEnabled((v4 ^ 1) & 1);
  }

  else if ([location[0] isEqualToString:@"hovertext"])
  {
    _AXSHoverTextSetEnabled((v4 ^ 1) & 1);
  }

  else if ([location[0] isEqualToString:@"closedcaption"])
  {
    _AXSClosedCaptionsSetEnabled((v4 ^ 1) & 1);
  }

  else if ([location[0] isEqualToString:@"audiodecriptions"])
  {
    MAAudibleMediaPrefSetPreferDescriptiveVideo(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", (v4 ^ 1) & 1));
  }

  else if ([location[0] isEqualToString:@"switchcontrol"])
  {
    uint64_t v3 = _AXSAssistiveTouchScannerSetEnabled((v4 ^ 1) & 1);
  }

  else if ([location[0] isEqualToString:@"colorfilters"])
  {
    MADisplayFilterPrefSetCategoryEnabled(1LL, (v4 ^ 1) & 1);
  }

  else if ([location[0] isEqualToString:@"lightsensitivity"])
  {
    MADisplayFilterPrefSetCategoryEnabled(2LL, (v4 ^ 1) & 1);
  }

  else if ([location[0] isEqualToString:@"reducewhitepoint"])
  {
    MADisplayFilterPrefSetCategoryEnabled(3LL, (v4 ^ 1) & 1);
  }

  else if ([location[0] isEqualToString:@"photosensitivemitigation"])
  {
    _AXSPhotosensitiveMitigationSetEnabled((v4 ^ 1) & 1);
  }

  objc_storeStrong(location, 0LL);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end