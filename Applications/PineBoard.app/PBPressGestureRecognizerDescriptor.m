@interface PBPressGestureRecognizerDescriptor
- (BOOL)hasAllowedPressTypes;
- (BOOL)hasCustomNumberOfTapsRequired;
- (BOOL)isEqual:(id)a3;
- (NSArray)allowedPressTypes;
- (NSOrderedSet)allowedPressTypesSet;
- (PBPressGestureRecognizerDescriptor)init;
- (PBPressGestureRecognizerDescriptor)initWithAllowedPressTypes:(id)a3 numberOfTapsRequired:(id)a4;
- (id)hashBuilder;
- (unint64_t)_numberOfPressBeganRequired;
- (unint64_t)numberOfTapsRequired;
- (unint64_t)type;
- (void)appendDescriptionToBuilder:(id)a3;
- (void)applySettingsToGestureRecognizer:(id)a3;
@end

@implementation PBPressGestureRecognizerDescriptor

- (PBPressGestureRecognizerDescriptor)initWithAllowedPressTypes:(id)a3 numberOfTapsRequired:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PBPressGestureRecognizerDescriptor;
  v8 = -[PBGestureRecognizerDescriptor init](&v13, "init");
  if (v8)
  {
    if (v6) {
      v9 = -[NSOrderedSet initWithArray:](objc_alloc(&OBJC_CLASS___NSOrderedSet), "initWithArray:", v6);
    }
    else {
      v9 = objc_alloc_init(&OBJC_CLASS___NSOrderedSet);
    }
    v10 = v9;
    objc_storeStrong((id *)&v8->_allowedPressTypesSet, v9);

    if (v7)
    {
      id v11 = [v7 unsignedLongLongValue];
    }

    else
    {
      if (qword_100470AF0 != -1) {
        dispatch_once(&qword_100470AF0, &stru_1003D69B0);
      }
      id v11 = (id)qword_100470AE8;
    }

    v8->_numberOfTapsRequired = (unint64_t)v11;
  }

  return v8;
}

- (PBPressGestureRecognizerDescriptor)init
{
  return -[PBPressGestureRecognizerDescriptor initWithAllowedPressTypes:numberOfTapsRequired:]( self,  "initWithAllowedPressTypes:numberOfTapsRequired:",  0LL,  0LL);
}

- (BOOL)hasCustomNumberOfTapsRequired
{
  if (qword_100470AF0 != -1) {
    dispatch_once(&qword_100470AF0, &stru_1003D69B0);
  }
  return qword_100470AE8 != self->_numberOfTapsRequired;
}

- (BOOL)hasAllowedPressTypes
{
  return -[NSOrderedSet count](self->_allowedPressTypesSet, "count") != 0;
}

- (NSArray)allowedPressTypes
{
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(-[NSOrderedSet array](self->_allowedPressTypesSet, "array"));
}

- (unint64_t)type
{
  return 2LL;
}

- (id)hashBuilder
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PBPressGestureRecognizerDescriptor;
  id v3 = -[PBGestureRecognizerDescriptor hashBuilder](&v17, "hashBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v5 = self->_allowedPressTypesSet;
  id v6 = -[NSOrderedSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v18,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_unsafeClaimAutoreleasedReturnValue(objc_msgSend(v4, "appendObject:", *(void *)(*((void *)&v13 + 1)
                                                                                                  + 8LL * (void)v9), (void)v13));
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSOrderedSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v18,  16LL);
    }

    while (v7);
  }

  id v11 = [v4 appendUnsignedInteger:self->_numberOfTapsRequired];
  return v4;
}

- (void)appendDescriptionToBuilder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBPressGestureRecognizerDescriptor;
  -[PBGestureRecognizerDescriptor appendDescriptionToBuilder:](&v9, "appendDescriptionToBuilder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSOrderedSet array](self->_allowedPressTypesSet, "array"));
  id v6 = sub_1001665A0(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v4 appendString:v7 withName:@"allowedPressTypes"];

  if (-[PBPressGestureRecognizerDescriptor hasCustomNumberOfTapsRequired](self, "hasCustomNumberOfTapsRequired")) {
    id v8 =  objc_msgSend( v4,  "appendUnsignedInteger:withName:",  -[PBPressGestureRecognizerDescriptor numberOfTapsRequired](self, "numberOfTapsRequired"),  @"numberOfTapsRequired");
  }
}

- (void)applySettingsToGestureRecognizer:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PBPressGestureRecognizerDescriptor;
  -[PBGestureRecognizerDescriptor applySettingsToGestureRecognizer:](&v16, "applySettingsToGestureRecognizer:", v4);
  if (-[PBPressGestureRecognizerDescriptor hasAllowedPressTypes](self, "hasAllowedPressTypes"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBPressGestureRecognizerDescriptor allowedPressTypes](self, "allowedPressTypes"));
    [v4 setAllowedPressTypes:v5];
  }

  if (-[PBPressGestureRecognizerDescriptor hasCustomNumberOfTapsRequired](self, "hasCustomNumberOfTapsRequired"))
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___UITapGestureRecognizer);
    id v7 = v4;
    id v8 = v7;
    if (v6)
    {
      if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0) {
        objc_super v9 = v8;
      }
      else {
        objc_super v9 = 0LL;
      }
    }

    else
    {
      objc_super v9 = 0LL;
    }

    id v10 = v9;

    uint64_t v11 = objc_opt_class(&OBJC_CLASS___UILongPressGestureRecognizer);
    id v12 = v8;
    __int128 v13 = v12;
    if (v11)
    {
      if ((objc_opt_isKindOfClass(v12, v11) & 1) != 0) {
        __int128 v14 = v13;
      }
      else {
        __int128 v14 = 0LL;
      }
    }

    else
    {
      __int128 v14 = 0LL;
    }

    id v15 = v14;

    objc_msgSend( v10,  "setNumberOfTapsRequired:",  -[PBPressGestureRecognizerDescriptor numberOfTapsRequired](self, "numberOfTapsRequired"));
    objc_msgSend( v15,  "setNumberOfTapsRequired:",  -[PBPressGestureRecognizerDescriptor numberOfTapsRequired](self, "numberOfTapsRequired"));
  }
}

- (unint64_t)_numberOfPressBeganRequired
{
  return self->_numberOfTapsRequired;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBPressGestureRecognizerDescriptor;
  if (-[PBGestureRecognizerDescriptor isEqual:](&v7, "isEqual:", v4) && self->_numberOfTapsRequired == v4[2]) {
    char v5 = BSEqualObjects(self->_allowedPressTypesSet, v4[3]);
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)numberOfTapsRequired
{
  return self->_numberOfTapsRequired;
}

- (NSOrderedSet)allowedPressTypesSet
{
  return self->_allowedPressTypesSet;
}

- (void).cxx_destruct
{
}

@end