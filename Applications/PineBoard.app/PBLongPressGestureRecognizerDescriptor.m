@interface PBLongPressGestureRecognizerDescriptor
- (BOOL)hasCustomMinimumPressDuration;
- (BOOL)hasCustomNumberOfTapsRequired;
- (BOOL)isEqual:(id)a3;
- (PBLongPressGestureRecognizerDescriptor)initWithAllowedPressTypes:(id)a3 numberOfTapsRequired:(id)a4;
- (PBLongPressGestureRecognizerDescriptor)initWithAllowedPressTypes:(id)a3 numberOfTapsRequired:(id)a4 minimumPressDuration:(id)a5;
- (double)_minimumPressDuration;
- (double)minimumPressDuration;
- (id)hashBuilder;
- (unint64_t)_numberOfPressBeganRequired;
- (unint64_t)type;
- (void)appendDescriptionToBuilder:(id)a3;
- (void)applySettingsToGestureRecognizer:(id)a3;
@end

@implementation PBLongPressGestureRecognizerDescriptor

- (PBLongPressGestureRecognizerDescriptor)initWithAllowedPressTypes:(id)a3 numberOfTapsRequired:(id)a4 minimumPressDuration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (qword_100470AB8 == -1)
  {
    if (v9) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  dispatch_once(&qword_100470AB8, &stru_1003D66A0);
  if (!v9) {
LABEL_3:
  }
    id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  qword_100470AA8));
LABEL_4:
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PBLongPressGestureRecognizerDescriptor;
  v11 = -[PBPressGestureRecognizerDescriptor initWithAllowedPressTypes:numberOfTapsRequired:]( &v14,  "initWithAllowedPressTypes:numberOfTapsRequired:",  v8,  v9);
  if (v11)
  {
    if (v10) {
      [v10 doubleValue];
    }
    else {
      uint64_t v12 = qword_100470AB0;
    }
    *(void *)&v11->_minimumPressDuration = v12;
  }

  return v11;
}

- (PBLongPressGestureRecognizerDescriptor)initWithAllowedPressTypes:(id)a3 numberOfTapsRequired:(id)a4
{
  return -[PBLongPressGestureRecognizerDescriptor initWithAllowedPressTypes:numberOfTapsRequired:minimumPressDuration:]( self,  "initWithAllowedPressTypes:numberOfTapsRequired:minimumPressDuration:",  a3,  a4,  0LL);
}

- (BOOL)hasCustomMinimumPressDuration
{
  if (qword_100470AB8 != -1) {
    dispatch_once(&qword_100470AB8, &stru_1003D66A0);
  }
  return BSFloatEqualToFloat(*(double *)&qword_100470AB0, self->_minimumPressDuration) ^ 1;
}

- (BOOL)hasCustomNumberOfTapsRequired
{
  if (qword_100470AB8 != -1) {
    dispatch_once(&qword_100470AB8, &stru_1003D66A0);
  }
  uint64_t v3 = qword_100470AA8;
  return v3 != -[PBPressGestureRecognizerDescriptor numberOfTapsRequired](self, "numberOfTapsRequired");
}

- (unint64_t)type
{
  return 6LL;
}

- (id)hashBuilder
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBLongPressGestureRecognizerDescriptor;
  id v3 = -[PBPressGestureRecognizerDescriptor hashBuilder](&v7, "hashBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = [v4 appendDouble:self->_minimumPressDuration];
  return v4;
}

- (void)appendDescriptionToBuilder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBLongPressGestureRecognizerDescriptor;
  -[PBPressGestureRecognizerDescriptor appendDescriptionToBuilder:](&v6, "appendDescriptionToBuilder:", v4);
  if (-[PBLongPressGestureRecognizerDescriptor hasCustomMinimumPressDuration](self, "hasCustomMinimumPressDuration"))
  {
    -[PBLongPressGestureRecognizerDescriptor minimumPressDuration](self, "minimumPressDuration");
    id v5 = objc_msgSend(v4, "appendDouble:withName:decimalPrecision:", @"minimumPressDuration", 1);
  }
}

- (void)applySettingsToGestureRecognizer:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PBLongPressGestureRecognizerDescriptor;
  -[PBPressGestureRecognizerDescriptor applySettingsToGestureRecognizer:](&v10, "applySettingsToGestureRecognizer:", v4);
  if (-[PBLongPressGestureRecognizerDescriptor hasCustomMinimumPressDuration](self, "hasCustomMinimumPressDuration"))
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___UILongPressGestureRecognizer);
    id v6 = v4;
    objc_super v7 = v6;
    if (v5)
    {
      if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0) {
        id v8 = v7;
      }
      else {
        id v8 = 0LL;
      }
    }

    else
    {
      id v8 = 0LL;
    }

    id v9 = v8;

    -[PBLongPressGestureRecognizerDescriptor minimumPressDuration](self, "minimumPressDuration");
    objc_msgSend(v9, "setMinimumPressDuration:");
  }
}

- (unint64_t)_numberOfPressBeganRequired
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBLongPressGestureRecognizerDescriptor;
  return -[PBPressGestureRecognizerDescriptor _numberOfPressBeganRequired](&v3, "_numberOfPressBeganRequired") + 1;
}

- (double)_minimumPressDuration
{
  return self->_minimumPressDuration;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (double *)a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBLongPressGestureRecognizerDescriptor;
  if (-[PBPressGestureRecognizerDescriptor isEqual:](&v7, "isEqual:", v4)) {
    char v5 = BSFloatEqualToFloat(self->_minimumPressDuration, v4[4]);
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (double)minimumPressDuration
{
  return self->_minimumPressDuration;
}

@end