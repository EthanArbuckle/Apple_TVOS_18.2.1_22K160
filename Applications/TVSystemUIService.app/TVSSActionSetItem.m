@interface TVSSActionSetItem
- (HFActionSetItem)actionSetItem;
- (NSError)latestError;
- (NSString)contentText1;
- (NSString)contentTitle;
- (TVSSActionSetItem)initWithHFItem:(id)a3;
- (UIImage)contentImage;
- (void)setLatestError:(id)a3;
- (void)updateWithHFItem:(id)a3;
@end

@implementation TVSSActionSetItem

- (TVSSActionSetItem)initWithHFItem:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0LL;
  v6.receiver = v3;
  v6.super_class = (Class)&OBJC_CLASS___TVSSActionSetItem;
  v8 = -[TVSSActionSetItem init](&v6, "init");
  objc_storeStrong((id *)&v8, v8);
  if (v8) {
    objc_storeStrong((id *)&v8->_actionSetItem, location[0]);
  }
  v5 = v8;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v8, 0LL);
  return v5;
}

- (void)updateWithHFItem:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v4->_actionSetItem, location[0]);
  objc_storeStrong(location, 0LL);
}

- (NSString)contentTitle
{
  v10[2] = self;
  v10[1] = (id)a2;
  v5 = -[TVSSActionSetItem actionSetItem](self, "actionSetItem");
  v10[0] = -[HFActionSetItem latestResults](v5, "latestResults");

  id v6 = [v10[0] objectForKeyedSubscript:HFResultDisplayTitleKey];
  char v7 = 0;
  if (v6)
  {
    id v2 = v6;
  }

  else
  {
    id v8 = [v10[0] objectForKeyedSubscript:HFResultDisplayTitlePlaceholderKey];
    char v7 = 1;
    id v2 = v8;
  }

  id v9 = v2;
  if ((v7 & 1) != 0) {

  }
  id v4 = v9;
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(v10, 0LL);
  return (NSString *)v4;
}

- (UIImage)contentImage
{
  v9[2] = self;
  v9[1] = (id)a2;
  v5 = -[TVSSActionSetItem actionSetItem](self, "actionSetItem");
  v9[0] = -[HFActionSetItem latestResults](v5, "latestResults");

  id v8 = [v9[0] objectForKeyedSubscript:HFResultDisplayIconDescriptorKey];
  id v7 = [v8 identifier];
  if (v7) {
    id v2 = v7;
  }
  else {
    id v2 = HFImageIconIdentifierGeneric;
  }
  id v6 = v2;
  id v4 = +[UIImage _systemImageNamed:](&OBJC_CLASS___UIImage, "_systemImageNamed:", v2);
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(v9, 0LL);
  return (UIImage *)v4;
}

- (NSString)contentText1
{
  id v4 = -[TVSSActionSetItem latestError](self, "latestError");
  char v5 = 0;
  if (v4)
  {
    id v6 = TVSSLocString(@"TVSSHomeKitSceneFailedTitle");
    char v5 = 1;
    id v2 = v6;
  }

  else
  {
    id v2 = 0LL;
  }

  id v7 = v2;
  if ((v5 & 1) != 0) {

  }
  return (NSString *)v7;
}

- (HFActionSetItem)actionSetItem
{
  return self->_actionSetItem;
}

- (NSError)latestError
{
  return self->_latestError;
}

- (void)setLatestError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end