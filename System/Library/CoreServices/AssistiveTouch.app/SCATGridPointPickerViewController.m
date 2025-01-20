@interface SCATGridPointPickerViewController
- (BOOL)_isVisible;
- (BOOL)_showsRowsForSelectionPath:(id)a3;
- (BOOL)handleInputAction:(id)a3 withElement:(id)a4;
- (CGPath)scannerPathForPointPickerCenterPoint:(id)a3;
- (CGRect)scannerFrameForPointPickerCenterPoint:(id)a3;
- (CGRect)scannerFrameForPointPickerGroup:(id)a3;
- (CGRect)scannerFrameForPointPickerSquare:(id)a3;
- (Class)classForPointPickerView;
- (NSIndexPath)currentSelectionPath;
- (NSString)description;
- (id)_scannableElements;
- (id)_scannableElementsAtSelectionPath:(id)a3;
- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)firstElementWithOptions:(int *)a3;
- (id)generateElementsForGroup:(id)a3;
- (id)lastElementWithOptions:(int *)a3;
- (void)_resetGrid;
- (void)didGenerateElements:(id)a3;
- (void)driver:(id)a3 didFocusOnContext:(id)a4 oldContext:(id)a5;
- (void)setCurrentSelectionPath:(id)a3;
@end

@implementation SCATGridPointPickerViewController

- (Class)classForPointPickerView
{
  return (Class)objc_opt_class(&OBJC_CLASS___SCATGridPointPickerView, a2);
}

- (NSString)description
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SCATGridPointPickerViewController;
  v3 = -[SCATGridPointPickerViewController description](&v9, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATPointPickerViewController prompt](self, "prompt"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGridPointPickerViewController currentSelectionPath](self, "currentSelectionPath"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingFormat:@" - prompt %@, current selection path %@", v5, v6]);

  return (NSString *)v7;
}

- (BOOL)_isVisible
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGridPointPickerViewController view](self, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 superview]);
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (BOOL)_showsRowsForSelectionPath:(id)a3
{
  return ((unint64_t)[a3 length] & 1) == 0;
}

- (id)_scannableElementsAtSelectionPath:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_scannableElements, "objectForKey:", v6));
  objc_super v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }

  else
  {
    unsigned int v11 = -[SCATGridPointPickerViewController _showsRowsForSelectionPath:](self, "_showsRowsForSelectionPath:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGridPointPickerViewController pointPickerView](self, "pointPickerView"));
    v13 = v12;
    v26 = v7;
    if (v11) {
      v14 = (char *)[v12 numberOfRows];
    }
    else {
      v14 = (char *)[v12 numberOfColumns];
    }
    v15 = v14;

    id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", v15 + 1));
    v16 = -[SCATPointPickerElement initWithSelectionPath:]( objc_alloc(&OBJC_CLASS___SCATPointPickerCenterPoint),  "initWithSelectionPath:",  v5);
    -[SCATPointPickerCenterPoint setDelegate:](v16, "setDelegate:", self);
    v25 = v16;
    [v10 addObject:v16];
    if (v15)
    {
      for (i = 0LL; i != v15; ++i)
      {
        if (v5) {
          v18 = (void *)objc_claimAutoreleasedReturnValue([v5 indexPathByAddingIndex:i]);
        }
        else {
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathWithIndex:](&OBJC_CLASS___NSIndexPath, "indexPathWithIndex:", i));
        }
        v19 = v18;
        if ([v18 length] == (id)8)
        {
          v20 = -[SCATPointPickerElement initWithSelectionPath:]( objc_alloc(&OBJC_CLASS___SCATPointPickerSquare),  "initWithSelectionPath:",  v19);
          -[SCATPointPickerSquare setDelegate:](v20, "setDelegate:", self);
        }

        else
        {
          v20 = -[SCATPointPickerGroup initWithSelectionPath:generatorDelegate:]( objc_alloc(&OBJC_CLASS___SCATPointPickerGroup),  "initWithSelectionPath:generatorDelegate:",  v19,  self);
        }

        [v10 addObject:v20];
      }
    }

    scannableElements = self->_scannableElements;
    if (!scannableElements)
    {
      v22 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  1LL);
      v23 = self->_scannableElements;
      self->_scannableElements = v22;

      scannableElements = self->_scannableElements;
    }

    v7 = v26;
    -[NSMutableDictionary setObject:forKey:](scannableElements, "setObject:forKey:", v10, v26);
  }

  return v10;
}

- (id)_scannableElements
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGridPointPickerViewController currentSelectionPath](self, "currentSelectionPath"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[SCATGridPointPickerViewController _scannableElementsAtSelectionPath:]( self,  "_scannableElementsAtSelectionPath:",  v3));

  return v4;
}

- (void)_resetGrid
{
}

- (NSIndexPath)currentSelectionPath
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGridPointPickerViewController pointPickerView](self, "pointPickerView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentSelectionPath]);

  return (NSIndexPath *)v3;
}

- (void)setCurrentSelectionPath:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SCATGridPointPickerViewController pointPickerView](self, "pointPickerView"));
  [v5 setCurrentSelectionPath:v4];
}

- (CGRect)scannerFrameForPointPickerSquare:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGridPointPickerViewController pointPickerView](self, "pointPickerView"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 selectionPath]);

  [v5 frameForSelectionPath:v6];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGridPointPickerViewController pointPickerView](self, "pointPickerView"));
  +[HNDScreen convertRect:fromView:](&OBJC_CLASS___HNDScreen, "convertRect:fromView:", v15, v8, v10, v12, v14);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGRect)scannerFrameForPointPickerCenterPoint:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGridPointPickerViewController pointPickerView](self, "pointPickerView"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 selectionPath]);

  [v5 frameForCenterPointAtSelectionPath:v6];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGridPointPickerViewController pointPickerView](self, "pointPickerView"));
  +[HNDScreen convertRect:fromView:](&OBJC_CLASS___HNDScreen, "convertRect:fromView:", v15, v8, v10, v12, v14);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGPath)scannerPathForPointPickerCenterPoint:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGridPointPickerViewController pointPickerView](self, "pointPickerView"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 selectionPath]);

  double v7 = (CGPath *)[v5 pathForCenterPointAtSelectionPath:v6];
  return v7;
}

- (CGRect)scannerFrameForPointPickerGroup:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGridPointPickerViewController pointPickerView](self, "pointPickerView"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 selectionPath]);

  [v5 frameForSelectionPath:v6];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGridPointPickerViewController pointPickerView](self, "pointPickerView"));
  +[HNDScreen convertRect:fromView:](&OBJC_CLASS___HNDScreen, "convertRect:fromView:", v15, v8, v10, v12, v14);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (id)generateElementsForGroup:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 selectionPath]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[SCATGridPointPickerViewController _scannableElementsAtSelectionPath:]( self,  "_scannableElementsAtSelectionPath:",  v4));

  return v5;
}

- (void)didGenerateElements:(id)a3
{
}

- (id)firstElementWithOptions:(int *)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGridPointPickerViewController _scannableElements](self, "_scannableElements", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndex:0]);

  return v4;
}

- (id)lastElementWithOptions:(int *)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGridPointPickerViewController _scannableElements](self, "_scannableElements", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lastObject]);

  return v4;
}

- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  id v7 = a3;
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 parentGroup]);

  if (v8)
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v7 parentGroup]);
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 nextSiblingOfChild:v7 didWrap:a4]);

    goto LABEL_11;
  }

  double v9 = (void *)objc_claimAutoreleasedReturnValue( -[SCATGridPointPickerViewController _scannableElementsAtSelectionPath:]( self,  "_scannableElementsAtSelectionPath:",  0LL));
  double v11 = (char *)[v9 indexOfObject:v7];

  if (v11 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v12 = 0;
    double v10 = 0LL;
    if (!a4) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  double v13 = (char *)[v9 count] - 1;
  BOOL v12 = v11 >= v13;
  if (v11 < v13) {
    double v14 = v11 + 1;
  }
  else {
    double v14 = 0LL;
  }
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:v14]);
  if (a4) {
LABEL_10:
  }
    *a4 = v12;
LABEL_11:

  return v10;
}

- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  id v7 = a3;
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 parentGroup]);

  if (!v8)
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue( -[SCATGridPointPickerViewController _scannableElementsAtSelectionPath:]( self,  "_scannableElementsAtSelectionPath:",  0LL));
    double v11 = (char *)[v9 indexOfObject:v7];

    if (v11)
    {
      if (v11 == (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        BOOL v12 = 0;
        double v10 = 0LL;
        if (!a4) {
          goto LABEL_11;
        }
      }

      else
      {
        double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:v11 - 1]);
        BOOL v12 = 0;
        if (!a4) {
          goto LABEL_11;
        }
      }
    }

    else
    {
      double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 lastObject]);
      BOOL v12 = 1;
      if (!a4) {
        goto LABEL_11;
      }
    }

    *a4 = v12;
    goto LABEL_11;
  }

  double v9 = (void *)objc_claimAutoreleasedReturnValue([v7 parentGroup]);
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 previousSiblingOfChild:v7 didWrap:a4]);

LABEL_11:
  return v10;
}

- (void)driver:(id)a3 didFocusOnContext:(id)a4 oldContext:(id)a5
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10009B6F4;
  v7[3] = &unk_100122168;
  id v8 = a4;
  double v9 = self;
  id v6 = v8;
  AXPerformBlockOnMainThread(v7);
}

- (BOOL)handleInputAction:(id)a3 withElement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 isGroup] & 1) == 0
    && ([v6 action] == (id)100
     || [v6 action] == (id)103
     || [v6 action] == (id)109))
  {
    -[SCATGridPointPickerViewController _resetGrid](self, "_resetGrid");
    id v9 = v7;
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGridPointPickerViewController pointPickerView](self, "pointPickerView"));
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v9 selectionPath]);

    double Center = AX_CGRectGetCenter([v10 frameForSelectionPath:v11]);
    double v14 = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATPointPickerViewController pointPicker](self, "pointPicker"));
    BOOL v8 = 1;
    objc_msgSend(v15, "_savePoint:andNotifyDelegate:", 1, Center, v14);
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end