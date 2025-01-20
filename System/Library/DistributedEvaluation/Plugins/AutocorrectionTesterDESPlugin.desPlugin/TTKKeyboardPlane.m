@interface TTKKeyboardPlane
- (CGRect)frame;
- (TTKKeyboardPlane)initWithUIKBTree:(id)a3 layoutUtils:(id)a4;
- (TTKKeyboardPlane)initWithUIKBTree:(id)a3 locale:(id)a4;
- (id)findKey:(id)a3;
- (id)jsonFrameArrayForWord:(id)a3;
@end

@implementation TTKKeyboardPlane

- (TTKKeyboardPlane)initWithUIKBTree:(id)a3 layoutUtils:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TTKKeyboardPlane;
  v9 = -[TTKKeyboardPlane init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keyplane, a3);
    objc_storeStrong((id *)&v10->_layoutUtils, a4);
  }

  return v10;
}

- (TTKKeyboardPlane)initWithUIKBTree:(id)a3 locale:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TTKKeyboardPlane;
  v9 = -[TTKKeyboardPlane init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keyplane, a3);
    v11 = -[ACTKeyboardLayoutUtils initWithLocale:]( objc_alloc(&OBJC_CLASS___ACTKeyboardLayoutUtils),  "initWithLocale:",  v8);
    layoutUtils = v10->_layoutUtils;
    v10->_layoutUtils = v11;
  }

  return v10;
}

- (id)findKey:(id)a3
{
  LOBYTE(v7) = 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[ACTKeyboardLayoutUtils anyKeyForString:keyplane:wantSecondaryString:isRetyping:preferBaseKeyVariants:preferManualShift:substituteUpperCaseForLowerCase:]( self->_layoutUtils,  "anyKeyForString:keyplane:wantSecondaryString:isRetyping:preferBaseKeyVariants:preferManualShift:subst ituteUpperCaseForLowerCase:",  a3,  self->_keyplane,  0LL,  0LL,  1LL,  0LL,  v7));
  if (v4) {
    v5 = -[TTKKey initWithUIKBTree:layoutUtils:]( objc_alloc(&OBJC_CLASS___TTKKey),  "initWithUIKBTree:layoutUtils:",  v4,  self->_layoutUtils);
  }
  else {
    v5 = 0LL;
  }

  return v5;
}

- (id)jsonFrameArrayForWord:(id)a3
{
  id v3 = a3;
  id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if ([v3 length])
  {
    unint64_t v4 = 0LL;
    do
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringWithRange:", v4, 1));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[TTKKeyboardPlane findKey:](self, "findKey:", v5));
      uint64_t v7 = v6;
      if (v6)
      {
        v21[0] = v5;
        v20[0] = @"k";
        v20[1] = @"x";
        [v6 frame];
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", (uint64_t)v8));
        v21[1] = v9;
        v20[2] = @"y";
        [v7 frame];
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", (uint64_t)v10));
        v21[2] = v11;
        v20[3] = @"w";
        [v7 frame];
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", (uint64_t)v12));
        v21[3] = v13;
        v20[4] = @"h";
        [v7 frame];
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", (uint64_t)v14));
        v21[4] = v15;
        v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  5LL));
        [v18 addObject:v16];
      }

      ++v4;
    }

    while ((unint64_t)[v3 length] > v4);
  }

  return v18;
}

- (CGRect)frame
{
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void).cxx_destruct
{
}

@end