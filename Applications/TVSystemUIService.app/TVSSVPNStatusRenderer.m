@interface TVSSVPNStatusRenderer
- (id)overrideStylingForIdentifier:(id)a3;
@end

@implementation TVSSVPNStatusRenderer

- (id)overrideStylingForIdentifier:(id)a3
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v16 = 0LL;
  id v11 = location[0];
  id v12 = +[TVSPIdentifiers text1ID](&OBJC_CLASS___TVSPIdentifiers, "text1ID");
  char v14 = 0;
  unsigned __int8 v13 = 0;
  if (objc_msgSend(v11, "isEqualToString:"))
  {
    id v15 = -[TVSSVPNStatusRenderer content](v18, "content");
    char v14 = 1;
    unsigned __int8 v13 = [v15 contentIsSelected];
  }

  if ((v14 & 1) != 0) {

  }
  if ((v13 & 1) != 0)
  {
    id v7 = location[0];
    id v10 = +[UIColor systemBlueColor](&OBJC_CLASS___UIColor, "systemBlueColor");
    id v9 = +[TVSPLabelAttribute textColor:](&OBJC_CLASS___TVSPLabelAttribute, "textColor:");
    id v19 = v9;
    v8 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL);
    v3 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v7);
    v4 = v16;
    v16 = v3;
  }

  v6 = v16;
  objc_storeStrong((id *)&v16, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

@end