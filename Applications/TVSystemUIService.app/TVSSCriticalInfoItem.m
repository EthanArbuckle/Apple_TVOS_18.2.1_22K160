@interface TVSSCriticalInfoItem
- (BOOL)usedRecently;
- (NSString)contentText1;
- (NSString)contentTitle;
- (NSString)title;
- (TVSSCriticalInfoItem)initWithImage:(id)a3 title:(id)a4 kind:(unint64_t)a5 usedRecently:(BOOL)a6;
- (UIColor)imageTintColor;
- (UIImage)contentImage;
- (UIImage)image;
- (unint64_t)kind;
@end

@implementation TVSSCriticalInfoItem

- (TVSSCriticalInfoItem)initWithImage:(id)a3 title:(id)a4 kind:(unint64_t)a5 usedRecently:(BOOL)a6
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v15 = 0LL;
  objc_storeStrong(&v15, a4);
  unint64_t v14 = a5;
  BOOL v13 = a6;
  v6 = v17;
  v17 = 0LL;
  v12.receiver = v6;
  v12.super_class = (Class)&OBJC_CLASS___TVSSCriticalInfoItem;
  v17 = -[TVSSCriticalInfoItem init](&v12, "init");
  objc_storeStrong((id *)&v17, v17);
  if (v17)
  {
    objc_storeStrong((id *)&v17->_image, location[0]);
    objc_storeStrong((id *)&v17->_title, v15);
    v17->_kind = v14;
    v17->_usedRecently = v13;
  }

  v8 = v17;
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v17, 0LL);
  return v8;
}

- (UIColor)imageTintColor
{
  return (UIColor *)+[TVSSCriticalInfo _tintColorForKind:]( &OBJC_CLASS___TVSSCriticalInfo,  "_tintColorForKind:",  -[TVSSCriticalInfoItem kind](self, "kind"));
}

- (UIImage)contentImage
{
  return self->_image;
}

- (NSString)contentTitle
{
  return self->_title;
}

- (NSString)contentText1
{
  char v6 = 0;
  char v4 = 0;
  if (-[TVSSCriticalInfoItem usedRecently](self, "usedRecently"))
  {
    v7 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
    char v6 = 1;
    v5 =  -[NSBundle localizedStringForKey:value:table:]( v7,  "localizedStringForKey:value:table:",  @"TVSSPrivacyRecently",  &stru_1001BDAC8,  0LL);
    char v4 = 1;
    v2 = v5;
  }

  else
  {
    v2 = (NSString *)0LL;
  }

  v8 = v2;
  if ((v4 & 1) != 0) {

  }
  if ((v6 & 1) != 0) {
  return v8;
  }
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)kind
{
  return self->_kind;
}

- (BOOL)usedRecently
{
  return self->_usedRecently;
}

- (void).cxx_destruct
{
}

@end