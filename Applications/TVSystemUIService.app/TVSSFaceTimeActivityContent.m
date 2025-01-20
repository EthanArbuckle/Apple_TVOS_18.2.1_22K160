@interface TVSSFaceTimeActivityContent
- (TUConversationActivity)activity;
- (TVSSFaceTimeActivityContent)initWithActivity:(id)a3;
- (id)contentImage1;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation TVSSFaceTimeActivityContent

- (TVSSFaceTimeActivityContent)initWithActivity:(id)a3
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v13 = [location[0] metadata];
  id v12 = [v13 imageData];
  id v11 = 0LL;
  if (v12)
  {
    v3 = +[UIImage imageWithData:](&OBJC_CLASS___UIImage, "imageWithData:", v12);
    id v4 = v11;
    id v11 = v3;
  }

  v7 = v15;
  id v9 = [v13 title];
  id v8 = [v13 subTitle];
  v15 = 0LL;
  v10.receiver = v7;
  v10.super_class = (Class)&OBJC_CLASS___TVSSFaceTimeActivityContent;
  v15 = -[TVSSFaceTimeActivityContent initWithTitle:image:text1:](&v10, "initWithTitle:image:text1:", v9, v11);
  objc_storeStrong((id *)&v15, v15);

  if (v15) {
    objc_storeStrong((id *)&v15->_activity, location[0]);
  }
  v6 = v15;
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v15, 0LL);
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TVSSFaceTimeActivityContent initWithActivity:]( +[TVSSFaceTimeActivityContent allocWithZone:]( &OBJC_CLASS___TVSSFaceTimeActivityContent,  "allocWithZone:",  a3),  "initWithActivity:",  self->_activity);
}

- (id)contentImage1
{
  v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = 0LL;
  id v3 = 0LL;
  objc_storeStrong(v4, 0LL);
  return v3;
}

- (TUConversationActivity)activity
{
  return self->_activity;
}

- (void).cxx_destruct
{
}

@end