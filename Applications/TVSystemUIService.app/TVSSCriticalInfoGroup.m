@interface TVSSCriticalInfoGroup
- (NSArray)items;
- (NSString)contentTitle;
- (NSString)groupName;
- (TVSSCriticalInfoGroup)initWithGroupName:(id)a3 image:(id)a4 items:(id)a5;
- (UIImage)contentImage;
- (UIImage)image;
@end

@implementation TVSSCriticalInfoGroup

- (TVSSCriticalInfoGroup)initWithGroupName:(id)a3 image:(id)a4 items:(id)a5
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v14 = 0LL;
  objc_storeStrong(&v14, a4);
  id v13 = 0LL;
  objc_storeStrong(&v13, a5);
  v5 = v16;
  v16 = 0LL;
  v12.receiver = v5;
  v12.super_class = (Class)&OBJC_CLASS___TVSSCriticalInfoGroup;
  v16 = -[TVSSCriticalInfoGroup init](&v12, "init");
  objc_storeStrong((id *)&v16, v16);
  if (v16)
  {
    v6 = (NSString *)[location[0] copy];
    groupName = v16->_groupName;
    v16->_groupName = v6;

    objc_storeStrong((id *)&v16->_image, v14);
    objc_storeStrong((id *)&v16->_items, v13);
  }

  v9 = v16;
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v16, 0LL);
  return v9;
}

- (NSString)contentTitle
{
  return -[TVSSCriticalInfoGroup groupName](self, "groupName", a2, self);
}

- (UIImage)contentImage
{
  return -[TVSSCriticalInfoGroup image](self, "image", a2, self);
}

- (NSString)groupName
{
  return self->_groupName;
}

- (UIImage)image
{
  return self->_image;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
}

@end