@interface TVSBInformationalBulletinItem
+ (TVSBInformationalBulletinItem)itemWithTitleText:(id)a3 subtitleText:(id)a4 atrributedFooterText:(id)a5;
+ (TVSBInformationalBulletinItem)itemWithTitleText:(id)a3 subtitleText:(id)a4 atrributedFooterText:(id)a5 customView:(id)a6;
+ (TVSBInformationalBulletinItem)itemWithTitleText:(id)a3 subtitleText:(id)a4 atrributedFooterText:(id)a5 image:(id)a6;
+ (TVSBInformationalBulletinItem)itemWithTitleText:(id)a3 subtitleText:(id)a4 atrributedFooterText:(id)a5 imageURL:(id)a6;
+ (TVSBInformationalBulletinItem)itemWithTitleText:(id)a3 subtitleText:(id)a4 footerText:(id)a5;
+ (TVSBInformationalBulletinItem)itemWithTitleText:(id)a3 subtitleText:(id)a4 footerText:(id)a5 customView:(id)a6;
+ (TVSBInformationalBulletinItem)itemWithTitleText:(id)a3 subtitleText:(id)a4 footerText:(id)a5 image:(id)a6;
+ (TVSBInformationalBulletinItem)itemWithTitleText:(id)a3 subtitleText:(id)a4 footerText:(id)a5 imageURL:(id)a6;
- (BOOL)isEqual:(id)a3;
- (NSAttributedString)attributedFooterText;
- (NSString)footerText;
- (NSString)subtitleText;
- (NSString)titleText;
- (NSURL)imageURL;
- (TVSBInformationalBulletinItem)init;
- (UIImage)image;
- (UIView)customView;
- (id)_init;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation TVSBInformationalBulletinItem

- (TVSBInformationalBulletinItem)init
{
  id location = self;
  objc_storeStrong(&location, 0LL);
  return 0LL;
}

- (id)_init
{
  SEL v5 = a2;
  v6 = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSBInformationalBulletinItem;
  v6 = -[TVSBInformationalBulletinItem init](&v4, "init");
  objc_storeStrong((id *)&v6, v6);
  v3 = v6;
  objc_storeStrong((id *)&v6, 0LL);
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (BOOL)isEqual:(id)a3
{
  v70 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (location[0] == v70)
  {
    char v71 = 1;
    int v68 = 1;
  }

  else
  {
    v67 =  +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  location[0],  objc_opt_class(&OBJC_CLASS___TVSBInformationalBulletinItem));
    v12 = v67;
    titleText = v70->_titleText;
    v61 = _NSConcreteStackBlock;
    int v62 = -1073741824;
    int v63 = 0;
    v64 = sub_10001D6F4;
    v65 = &unk_10002D270;
    id v66 = location[0];
    id v3 = -[BSEqualsBuilder appendString:counterpart:](v12, "appendString:counterpart:", titleText, &v61);
    v14 = v67;
    subtitleText = v70->_subtitleText;
    v55 = _NSConcreteStackBlock;
    int v56 = -1073741824;
    int v57 = 0;
    v58 = sub_10001D724;
    v59 = &unk_10002D270;
    id v60 = location[0];
    id v4 = -[BSEqualsBuilder appendString:counterpart:](v14, "appendString:counterpart:", subtitleText, &v55);
    v16 = v67;
    footerText = v70->_footerText;
    v49 = _NSConcreteStackBlock;
    int v50 = -1073741824;
    int v51 = 0;
    v52 = sub_10001D754;
    v53 = &unk_10002D270;
    id v54 = location[0];
    id v5 = -[BSEqualsBuilder appendString:counterpart:](v16, "appendString:counterpart:", footerText, &v49);
    v18 = v67;
    attributedFooterText = v70->_attributedFooterText;
    v43 = _NSConcreteStackBlock;
    int v44 = -1073741824;
    int v45 = 0;
    v46 = sub_10001D784;
    v47 = &unk_10002D298;
    id v48 = location[0];
    id v6 = -[BSEqualsBuilder appendObject:counterpart:](v18, "appendObject:counterpart:", attributedFooterText, &v43);
    v20 = v67;
    image = v70->_image;
    v37 = _NSConcreteStackBlock;
    int v38 = -1073741824;
    int v39 = 0;
    v40 = sub_10001D7B4;
    v41 = &unk_10002D298;
    id v42 = location[0];
    id v7 = -[BSEqualsBuilder appendObject:counterpart:](v20, "appendObject:counterpart:", image, &v37);
    v22 = v67;
    imageURL = v70->_imageURL;
    v31 = _NSConcreteStackBlock;
    int v32 = -1073741824;
    int v33 = 0;
    v34 = sub_10001D7E4;
    v35 = &unk_10002D298;
    id v36 = location[0];
    id v8 = -[BSEqualsBuilder appendObject:counterpart:](v22, "appendObject:counterpart:", imageURL, &v31);
    v24 = v67;
    customView = v70->_customView;
    v25 = _NSConcreteStackBlock;
    int v26 = -1073741824;
    int v27 = 0;
    v28 = sub_10001D814;
    v29 = &unk_10002D298;
    id v30 = location[0];
    id v9 = -[BSEqualsBuilder appendObject:counterpart:](v24, "appendObject:counterpart:", customView, &v25);
    char v71 = -[BSEqualsBuilder isEqual](v67, "isEqual") & 1;
    int v68 = 1;
    objc_storeStrong(&v30, 0LL);
    objc_storeStrong(&v36, 0LL);
    objc_storeStrong(&v42, 0LL);
    objc_storeStrong(&v48, 0LL);
    objc_storeStrong(&v54, 0LL);
    objc_storeStrong(&v60, 0LL);
    objc_storeStrong(&v66, 0LL);
    objc_storeStrong((id *)&v67, 0LL);
  }

  objc_storeStrong(location, 0LL);
  return v71 & 1;
}

+ (TVSBInformationalBulletinItem)itemWithTitleText:(id)a3 subtitleText:(id)a4 footerText:(id)a5
{
  id v19 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v17 = 0LL;
  objc_storeStrong(&v17, a4);
  id v16 = 0LL;
  objc_storeStrong(&v16, a5);
  v15 = [objc_alloc((Class)objc_opt_class(v19)) _init];
  id v5 = [location[0] copy];
  id v6 = (void *)v15[1];
  v15[1] = v5;

  id v7 = [v17 copy];
  id v8 = (void *)v15[2];
  v15[2] = v7;

  id v9 = [v16 copy];
  v10 = (void *)v15[3];
  v15[3] = v9;

  v14 = v15;
  objc_storeStrong((id *)&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(location, 0LL);
  return (TVSBInformationalBulletinItem *)v14;
}

+ (TVSBInformationalBulletinItem)itemWithTitleText:(id)a3 subtitleText:(id)a4 atrributedFooterText:(id)a5
{
  id v19 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v17 = 0LL;
  objc_storeStrong(&v17, a4);
  id v16 = 0LL;
  objc_storeStrong(&v16, a5);
  v15 = [objc_alloc((Class)objc_opt_class(v19)) _init];
  id v5 = [location[0] copy];
  id v6 = (void *)v15[1];
  v15[1] = v5;

  id v7 = [v17 copy];
  id v8 = (void *)v15[2];
  v15[2] = v7;

  id v9 = [v16 copy];
  v10 = (void *)v15[4];
  v15[4] = v9;

  v14 = v15;
  objc_storeStrong((id *)&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(location, 0LL);
  return (TVSBInformationalBulletinItem *)v14;
}

+ (TVSBInformationalBulletinItem)itemWithTitleText:(id)a3 subtitleText:(id)a4 footerText:(id)a5 image:(id)a6
{
  id v22 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v20 = 0LL;
  objc_storeStrong(&v20, a4);
  id v19 = 0LL;
  objc_storeStrong(&v19, a5);
  id v18 = 0LL;
  objc_storeStrong(&v18, a6);
  id v17 = [objc_alloc((Class)objc_opt_class(v22)) _init];
  id v6 = [location[0] copy];
  id v7 = (void *)*((void *)v17 + 1);
  *((void *)v17 + 1) = v6;

  id v8 = [v20 copy];
  id v9 = (void *)*((void *)v17 + 2);
  *((void *)v17 + 2) = v8;

  id v10 = [v19 copy];
  v11 = (void *)*((void *)v17 + 3);
  *((void *)v17 + 3) = v10;

  objc_storeStrong((id *)v17 + 5, v18);
  id v16 = v17;
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(location, 0LL);
  return (TVSBInformationalBulletinItem *)v16;
}

+ (TVSBInformationalBulletinItem)itemWithTitleText:(id)a3 subtitleText:(id)a4 atrributedFooterText:(id)a5 image:(id)a6
{
  id v22 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v20 = 0LL;
  objc_storeStrong(&v20, a4);
  id v19 = 0LL;
  objc_storeStrong(&v19, a5);
  id v18 = 0LL;
  objc_storeStrong(&v18, a6);
  id v17 = [objc_alloc((Class)objc_opt_class(v22)) _init];
  id v6 = [location[0] copy];
  id v7 = (void *)*((void *)v17 + 1);
  *((void *)v17 + 1) = v6;

  id v8 = [v20 copy];
  id v9 = (void *)*((void *)v17 + 2);
  *((void *)v17 + 2) = v8;

  id v10 = [v19 copy];
  v11 = (void *)*((void *)v17 + 4);
  *((void *)v17 + 4) = v10;

  objc_storeStrong((id *)v17 + 5, v18);
  id v16 = v17;
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(location, 0LL);
  return (TVSBInformationalBulletinItem *)v16;
}

+ (TVSBInformationalBulletinItem)itemWithTitleText:(id)a3 subtitleText:(id)a4 footerText:(id)a5 imageURL:(id)a6
{
  id v24 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v22 = 0LL;
  objc_storeStrong(&v22, a4);
  id v21 = 0LL;
  objc_storeStrong(&v21, a5);
  id v20 = 0LL;
  objc_storeStrong(&v20, a6);
  id v19 = [objc_alloc((Class)objc_opt_class(v24)) _init];
  id v6 = [location[0] copy];
  id v7 = (void *)v19[1];
  v19[1] = v6;

  id v8 = [v22 copy];
  id v9 = (void *)v19[2];
  v19[2] = v8;

  id v10 = [v21 copy];
  v11 = (void *)v19[3];
  v19[3] = v10;

  id v12 = [v20 copy];
  v13 = (void *)v19[6];
  v19[6] = v12;

  id v18 = v19;
  objc_storeStrong((id *)&v19, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(location, 0LL);
  return (TVSBInformationalBulletinItem *)v18;
}

+ (TVSBInformationalBulletinItem)itemWithTitleText:(id)a3 subtitleText:(id)a4 atrributedFooterText:(id)a5 imageURL:(id)a6
{
  id v24 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v22 = 0LL;
  objc_storeStrong(&v22, a4);
  id v21 = 0LL;
  objc_storeStrong(&v21, a5);
  id v20 = 0LL;
  objc_storeStrong(&v20, a6);
  id v19 = [objc_alloc((Class)objc_opt_class(v24)) _init];
  id v6 = [location[0] copy];
  id v7 = (void *)v19[1];
  v19[1] = v6;

  id v8 = [v22 copy];
  id v9 = (void *)v19[2];
  v19[2] = v8;

  id v10 = [v21 copy];
  v11 = (void *)v19[4];
  v19[4] = v10;

  id v12 = [v20 copy];
  v13 = (void *)v19[6];
  v19[6] = v12;

  id v18 = v19;
  objc_storeStrong((id *)&v19, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(location, 0LL);
  return (TVSBInformationalBulletinItem *)v18;
}

+ (TVSBInformationalBulletinItem)itemWithTitleText:(id)a3 subtitleText:(id)a4 footerText:(id)a5 customView:(id)a6
{
  id v22 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v20 = 0LL;
  objc_storeStrong(&v20, a4);
  id v19 = 0LL;
  objc_storeStrong(&v19, a5);
  id v18 = 0LL;
  objc_storeStrong(&v18, a6);
  id v17 = [objc_alloc((Class)objc_opt_class(v22)) _init];
  id v6 = [location[0] copy];
  id v7 = (void *)*((void *)v17 + 1);
  *((void *)v17 + 1) = v6;

  id v8 = [v20 copy];
  id v9 = (void *)*((void *)v17 + 2);
  *((void *)v17 + 2) = v8;

  id v10 = [v19 copy];
  v11 = (void *)*((void *)v17 + 3);
  *((void *)v17 + 3) = v10;

  objc_storeStrong((id *)v17 + 7, v18);
  id v16 = v17;
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(location, 0LL);
  return (TVSBInformationalBulletinItem *)v16;
}

+ (TVSBInformationalBulletinItem)itemWithTitleText:(id)a3 subtitleText:(id)a4 atrributedFooterText:(id)a5 customView:(id)a6
{
  id v22 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v20 = 0LL;
  objc_storeStrong(&v20, a4);
  id v19 = 0LL;
  objc_storeStrong(&v19, a5);
  id v18 = 0LL;
  objc_storeStrong(&v18, a6);
  id v17 = [objc_alloc((Class)objc_opt_class(v22)) _init];
  id v6 = [location[0] copy];
  id v7 = (void *)*((void *)v17 + 1);
  *((void *)v17 + 1) = v6;

  id v8 = [v20 copy];
  id v9 = (void *)*((void *)v17 + 2);
  *((void *)v17 + 2) = v8;

  id v10 = [v19 copy];
  v11 = (void *)*((void *)v17 + 4);
  *((void *)v17 + 4) = v10;

  objc_storeStrong((id *)v17 + 7, v18);
  id v16 = v17;
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(location, 0LL);
  return (TVSBInformationalBulletinItem *)v16;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (NSString)footerText
{
  return self->_footerText;
}

- (NSAttributedString)attributedFooterText
{
  return self->_attributedFooterText;
}

- (UIImage)image
{
  return self->_image;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (UIView)customView
{
  return self->_customView;
}

- (void).cxx_destruct
{
}

@end