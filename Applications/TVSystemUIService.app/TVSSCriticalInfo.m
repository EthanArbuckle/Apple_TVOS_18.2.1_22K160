@interface TVSSCriticalInfo
+ (id)_tintColorForKind:(unint64_t)a3;
+ (id)_titleFromGroups:(id)a3;
- (NSArray)groups;
- (NSString)contentTitle;
- (NSString)title;
- (TVSSCriticalInfo)init;
- (TVSSCriticalInfo)initWithGroups:(id)a3;
- (UIColor)image1TintColor;
- (UIColor)image2TintColor;
- (UIColor)image3TintColor;
- (UIColor)imageTintColor;
- (UIImage)contentImage;
- (UIImage)contentImage1;
- (UIImage)contentImage2;
- (UIImage)contentImage3;
- (UIImage)i;
- (UIImage)i1;
- (UIImage)i2;
- (UIImage)i3;
- (void)_configureDataProviding;
- (void)setI1:(id)a3;
- (void)setI2:(id)a3;
- (void)setI3:(id)a3;
- (void)setI:(id)a3;
- (void)setImage1TintColor:(id)a3;
- (void)setImage2TintColor:(id)a3;
- (void)setImage3TintColor:(id)a3;
- (void)setImageTintColor:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation TVSSCriticalInfo

- (TVSSCriticalInfo)init
{
  v4 = 0LL;
  v4 = -[TVSSCriticalInfo initWithGroups:](self, "initWithGroups:", &__NSArray0__struct);
  v3 = v4;
  objc_storeStrong((id *)&v4, 0LL);
  return v3;
}

- (TVSSCriticalInfo)initWithGroups:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0LL;
  v6.receiver = v3;
  v6.super_class = (Class)&OBJC_CLASS___TVSSCriticalInfo;
  v8 = -[TVSSCriticalInfo init](&v6, "init");
  objc_storeStrong((id *)&v8, v8);
  if (v8)
  {
    objc_storeStrong((id *)&v8->_groups, location[0]);
    -[TVSSCriticalInfo _configureDataProviding](v8, "_configureDataProviding");
  }

  v5 = v8;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v8, 0LL);
  return v5;
}

- (void)_configureDataProviding
{
  v45 = self;
  v44[1] = (id)a2;
  v44[0] = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v37 = _NSConcreteStackBlock;
  int v38 = -1073741824;
  int v39 = 0;
  v40 = sub_1000E6A78;
  v41 = &unk_1001BA8A0;
  id v42 = v44[0];
  id v43 = objc_retainBlock(&v37);
  memset(__b, 0, sizeof(__b));
  obj = -[TVSSCriticalInfo groups](v45, "groups");
  id v23 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v48,  16LL);
  if (v23)
  {
    uint64_t v19 = *(void *)__b[2];
    uint64_t v20 = 0LL;
    id v21 = v23;
    while (1)
    {
      uint64_t v18 = v20;
      if (*(void *)__b[2] != v19) {
        objc_enumerationMutation(obj);
      }
      id v36 = *(id *)(__b[1] + 8 * v20);
      memset(v33, 0, sizeof(v33));
      id v16 = [v36 items];
      id v17 = [v16 countByEnumeratingWithState:v33 objects:v47 count:16];
      if (v17)
      {
        uint64_t v13 = *(void *)v33[2];
        uint64_t v14 = 0LL;
        id v15 = v17;
        while (1)
        {
          uint64_t v12 = v14;
          if (*(void *)v33[2] != v13) {
            objc_enumerationMutation(v16);
          }
          id v34 = *(id *)(v33[1] + 8 * v14);
          ++v14;
          if (v12 + 1 >= (unint64_t)v15)
          {
            uint64_t v14 = 0LL;
            id v15 = [v16 countByEnumeratingWithState:v33 objects:v47 count:16];
            if (!v15) {
              break;
            }
          }
        }
      }

      ++v20;
      if (v18 + 1 >= (unint64_t)v21)
      {
        uint64_t v20 = 0LL;
        id v21 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v48,  16LL);
        if (!v21) {
          break;
        }
      }
    }
  }

  id v32 = [&off_1001C8780 mutableCopy];
  id v31 = [&off_1001C8798 mutableCopy];
  memset(v29, 0, sizeof(v29));
  id v10 = v44[0];
  id v11 = [v10 countByEnumeratingWithState:v29 objects:v46 count:16];
  if (v11)
  {
    uint64_t v7 = *(void *)v29[2];
    uint64_t v8 = 0LL;
    id v9 = v11;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)v29[2] != v7) {
        objc_enumerationMutation(v10);
      }
      id v30 = *(id *)(v29[1] + 8 * v8);
      if (![v32 count]) {
        break;
      }
      id v27 = [v30 image];
      if (v27)
      {
        id v26 = [v32 firstObject];
        -[TVSSCriticalInfo setValue:forKey:](v45, "setValue:forKey:", v27, v26);
        [v32 removeObjectAtIndex:0];
        v5 = (void *)objc_opt_class(v45);
        id v25 = objc_msgSend(v5, "_tintColorForKind:", objc_msgSend(v30, "kind"));
        id location = [v31 firstObject];
        if (v25) {
          -[TVSSCriticalInfo setValue:forKey:](v45, "setValue:forKey:", v25, location);
        }
        [v31 removeObjectAtIndex:0];
        objc_storeStrong(&location, 0LL);
        objc_storeStrong(&v25, 0LL);
        objc_storeStrong(&v26, 0LL);
      }

      objc_storeStrong(&v27, 0LL);
      ++v8;
      if (v6 + 1 >= (unint64_t)v9)
      {
        uint64_t v8 = 0LL;
        id v9 = [v10 countByEnumeratingWithState:v29 objects:v46 count:16];
        if (!v9) {
          goto LABEL_27;
        }
      }
    }

    int v28 = 6;
  }

  else
  {
LABEL_27:
    int v28 = 0;
  }

  v2 = (void *)objc_opt_class(v45);
  v4 = -[TVSSCriticalInfo groups](v45, "groups");
  id v3 = objc_msgSend(v2, "_titleFromGroups:");
  -[TVSSCriticalInfo setTitle:](v45, "setTitle:");

  objc_storeStrong(&v31, 0LL);
  objc_storeStrong(&v32, 0LL);
  objc_storeStrong(&v43, 0LL);
  objc_storeStrong(&v42, 0LL);
  objc_storeStrong(v44, 0LL);
}

+ (id)_titleFromGroups:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v23 = &stru_1001BDAC8;
  if ([location[0] count] == (id)1)
  {
    id v14 = [location[0] objectAtIndexedSubscript:0];
    id v3 = [v14 groupName];
    id v4 = v23;
    id v23 = v3;
  }

  else if ([location[0] count] == (id)2)
  {
    id v11 = [location[0] objectAtIndexedSubscript:0];
    id v22 = [v11 groupName];

    id v12 = [location[0] objectAtIndexedSubscript:1];
    id v21 = [v12 groupName];

    uint64_t v13 = +[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale");
    id v20 = -[NSLocale languageCode](v13, "languageCode");

    if (([v20 isEqualToString:@"es"] & 1) != 0
      || ([v20 isEqualToString:@"he"] & 1) != 0)
    {
      v25[0] = v22;
      v25[1] = v21;
      id v10 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 2LL);
      uint64_t v19 =  +[NSListFormatter localizedStringByJoiningStrings:]( &OBJC_CLASS___NSListFormatter,  "localizedStringByJoiningStrings:");

      objc_storeStrong(&v23, v19);
      objc_storeStrong((id *)&v19, 0LL);
    }

    else
    {
      id v9 = TVSSLocString(@"TVSSCriticalInfoControlCenterTwoAppsFormat");
      uint64_t v18 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v22, v21);

      objc_storeStrong(&v23, v18);
      objc_storeStrong((id *)&v18, 0LL);
    }

    objc_storeStrong(&v20, 0LL);
    objc_storeStrong(&v21, 0LL);
    objc_storeStrong(&v22, 0LL);
  }

  else if ((unint64_t)[location[0] count] > 2)
  {
    id v7 = [location[0] objectAtIndexedSubscript:0];
    id v17 = [v7 groupName];

    id v16 = (char *)[location[0] count] - 1;
    id v8 = TVSSLocString(@"TVSSCriticalInfoControlCenterOneAppAndManyMoreFormat");
    id v15 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v17, v16);

    objc_storeStrong(&v23, v15);
    objc_storeStrong((id *)&v15, 0LL);
    objc_storeStrong(&v17, 0LL);
  }

  id v6 = v23;
  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

+ (id)_tintColorForKind:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      return +[UIColor systemGreenColor](&OBJC_CLASS___UIColor, "systemGreenColor");
    case 0uLL:
      return +[UIColor systemOrangeColor](&OBJC_CLASS___UIColor, "systemOrangeColor");
    case 2uLL:
      return +[UIColor systemBlueColor](&OBJC_CLASS___UIColor, "systemBlueColor");
  }

  return 0LL;
}

- (NSString)contentTitle
{
  return -[TVSSCriticalInfo title](self, "title", a2, self);
}

- (UIImage)contentImage
{
  return -[TVSSCriticalInfo i](self, "i", a2, self);
}

- (UIImage)contentImage1
{
  return -[TVSSCriticalInfo i1](self, "i1", a2, self);
}

- (UIImage)contentImage2
{
  return -[TVSSCriticalInfo i2](self, "i2", a2, self);
}

- (UIImage)contentImage3
{
  return -[TVSSCriticalInfo i3](self, "i3", a2, self);
}

- (NSArray)groups
{
  return self->_groups;
}

- (UIColor)imageTintColor
{
  return self->_imageTintColor;
}

- (void)setImageTintColor:(id)a3
{
}

- (UIColor)image1TintColor
{
  return self->_image1TintColor;
}

- (void)setImage1TintColor:(id)a3
{
}

- (UIColor)image2TintColor
{
  return self->_image2TintColor;
}

- (void)setImage2TintColor:(id)a3
{
}

- (UIColor)image3TintColor
{
  return self->_image3TintColor;
}

- (void)setImage3TintColor:(id)a3
{
}

- (UIImage)i
{
  return self->_i;
}

- (void)setI:(id)a3
{
}

- (UIImage)i1
{
  return self->_i1;
}

- (void)setI1:(id)a3
{
}

- (UIImage)i2
{
  return self->_i2;
}

- (void)setI2:(id)a3
{
}

- (UIImage)i3
{
  return self->_i3;
}

- (void)setI3:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end