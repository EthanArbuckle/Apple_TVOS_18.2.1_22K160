@interface SCATGridPointPicker
- (BOOL)handleInputAction:(id)a3 withElement:(id)a4;
- (id)_initWithMenu:(id)a3;
- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)firstElementWithOptions:(int *)a3;
- (id)lastElementWithOptions:(int *)a3;
- (int64_t)pickerType;
- (void)driver:(id)a3 didFocusOnContext:(id)a4 oldContext:(id)a5;
- (void)scannerWillMakeManagerActive:(id)a3;
- (void)scannerWillMakeManagerActive:(id)a3 forDisplayID:(unsigned int)a4;
- (void)scannerWillMakeManagerInactive:(id)a3 activeElementManager:(id)a4;
@end

@implementation SCATGridPointPicker

- (id)_initWithMenu:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SCATGridPointPicker;
  id v5 = -[SCATPointPicker _initWithMenu:](&v8, "_initWithMenu:", v4);
  if (v5)
  {
    v6 = -[SCATPointPickerViewController initWithElementManager:menu:]( objc_alloc(&OBJC_CLASS___SCATGridPointPickerViewController),  "initWithElementManager:menu:",  v5,  v4);
    [v5 setVisualProvider:v6];
  }

  return v5;
}

- (int64_t)pickerType
{
  return 0LL;
}

- (id)firstElementWithOptions:(int *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGridPointPicker _gridViewController](self, "_gridViewController"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstElementWithOptions:a3]);

  return v5;
}

- (id)lastElementWithOptions:(int *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGridPointPicker _gridViewController](self, "_gridViewController"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lastElementWithOptions:a3]);

  return v5;
}

- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGridPointPicker _gridViewController](self, "_gridViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 elementAfter:v8 didWrap:a4 options:a5]);

  return v10;
}

- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGridPointPicker _gridViewController](self, "_gridViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 elementBefore:v8 didWrap:a4 options:a5]);

  return v10;
}

- (void)driver:(id)a3 didFocusOnContext:(id)a4 oldContext:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SCATGridPointPicker;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  -[SCATElementManager driver:didFocusOnContext:oldContext:](&v12, "driver:didFocusOnContext:oldContext:", v10, v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGridPointPicker _gridViewController](self, "_gridViewController", v12.receiver, v12.super_class));
  [v11 driver:v10 didFocusOnContext:v9 oldContext:v8];
}

- (void)scannerWillMakeManagerActive:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SCATGridPointPicker;
  id v4 = a3;
  -[SCATElementManager scannerWillMakeManagerActive:](&v6, "scannerWillMakeManagerActive:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGridPointPicker _gridViewController](self, "_gridViewController", v6.receiver, v6.super_class));
  [v5 scannerWillMakeManagerActive:v4];
}

- (void)scannerWillMakeManagerActive:(id)a3 forDisplayID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SCATGridPointPicker;
  id v6 = a3;
  -[SCATElementManager scannerWillMakeManagerActive:](&v8, "scannerWillMakeManagerActive:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGridPointPicker _gridViewController](self, "_gridViewController", v8.receiver, v8.super_class));
  [v7 scannerWillMakeManagerActive:v6 forDisplayID:v4];
}

- (void)scannerWillMakeManagerInactive:(id)a3 activeElementManager:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SCATGridPointPicker;
  id v6 = a4;
  id v7 = a3;
  -[SCATElementManager scannerWillMakeManagerInactive:activeElementManager:]( &v9,  "scannerWillMakeManagerInactive:activeElementManager:",  v7,  v6);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGridPointPicker _gridViewController](self, "_gridViewController", v9.receiver, v9.super_class));
  [v8 scannerWillMakeManagerInactive:v7 activeElementManager:v6];
}

- (BOOL)handleInputAction:(id)a3 withElement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SCATGridPointPicker;
  if (-[SCATElementManager handleInputAction:withElement:](&v11, "handleInputAction:withElement:", v6, v7))
  {
    unsigned __int8 v8 = 1;
  }

  else
  {
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGridPointPicker _gridViewController](self, "_gridViewController"));
    unsigned __int8 v8 = [v9 handleInputAction:v6 withElement:v7];
  }

  return v8;
}

@end