@interface TVSSUserImageContentView
- (CGSize)intrinsicContentSize;
- (TVSSUserImageContentView)initWithFrame:(CGRect)a3;
- (TVSSVisualContent)content;
- (id)_userImageContent;
- (void)_updateContent;
- (void)setContent:(id)a3;
@end

@implementation TVSSUserImageContentView

- (TVSSUserImageContentView)initWithFrame:(CGRect)a3
{
  CGRect v23 = a3;
  SEL v21 = a2;
  v22 = 0LL;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___TVSSUserImageContentView;
  v22 = -[TVSSUserImageContentView initWithFrame:]( &v20,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  objc_storeStrong((id *)&v22, v22);
  if (v22)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___TVSUIProfilePictureView);
    profilePictureView = v22->_profilePictureView;
    v22->_profilePictureView = v3;

    -[TVSUIProfilePictureView setTranslatesAutoresizingMaskIntoConstraints:]( v22->_profilePictureView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVSSUserImageContentView addSubview:](v22, "addSubview:", v22->_profilePictureView);
    id v19 = -[TVSSUserImageContentView leadingAnchor](v22, "leadingAnchor");
    id v18 = -[TVSUIProfilePictureView leadingAnchor](v22->_profilePictureView, "leadingAnchor");
    id v17 = objc_msgSend(v19, "constraintEqualToAnchor:");
    v24[0] = v17;
    id v16 = -[TVSSUserImageContentView trailingAnchor](v22, "trailingAnchor");
    id v15 = -[TVSUIProfilePictureView trailingAnchor](v22->_profilePictureView, "trailingAnchor");
    id v14 = objc_msgSend(v16, "constraintEqualToAnchor:");
    v24[1] = v14;
    id v13 = -[TVSSUserImageContentView topAnchor](v22, "topAnchor");
    id v12 = -[TVSUIProfilePictureView topAnchor](v22->_profilePictureView, "topAnchor");
    id v11 = objc_msgSend(v13, "constraintEqualToAnchor:");
    v24[2] = v11;
    id v10 = -[TVSSUserImageContentView bottomAnchor](v22, "bottomAnchor");
    id v9 = -[TVSUIProfilePictureView bottomAnchor](v22->_profilePictureView, "bottomAnchor");
    id v8 = objc_msgSend(v10, "constraintEqualToAnchor:");
    v24[3] = v8;
    v7 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 4LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");
  }

  v6 = v22;
  objc_storeStrong((id *)&v22, 0LL);
  return v6;
}

- (CGSize)intrinsicContentSize
{
  result.height = v3;
  result.width = v2;
  return result;
}

  ;
}

- (void)setContent:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v4->_content != location[0])
  {
    objc_storeStrong((id *)&v4->_content, location[0]);
    -[TVSSUserImageContentView _updateContent](v4, "_updateContent");
  }

  objc_storeStrong(location, 0LL);
}

- (id)_userImageContent
{
  content = self->_content;
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___TVSSUserImageContent);
  return sub_1000BB330(content, v2);
}

- (void)_updateContent
{
  v5 = self;
  v4[1] = (id)a2;
  v4[0] = -[TVSSUserImageContentView _userImageContent](self, "_userImageContent");
  id v3 = [v4[0] userImage];
  id v2 = [v4[0] personNameComponents];
  -[TVSUIProfilePictureView setProfilePictureImage:](v5->_profilePictureView, "setProfilePictureImage:", v3);
  -[TVSUIProfilePictureView setPersonNameComponents:](v5->_profilePictureView, "setPersonNameComponents:", v2);
  objc_storeStrong(&v2, 0LL);
  objc_storeStrong(&v3, 0LL);
  objc_storeStrong(v4, 0LL);
}

- (TVSSVisualContent)content
{
  return self->_content;
}

- (void).cxx_destruct
{
}

@end