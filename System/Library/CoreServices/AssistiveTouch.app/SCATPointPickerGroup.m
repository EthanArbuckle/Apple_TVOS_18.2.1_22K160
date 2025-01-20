@interface SCATPointPickerGroup
- (BOOL)isEqual:(id)a3;
- (BOOL)scatIsValid;
- (CGRect)scatFrame;
- (NSIndexPath)selectionPath;
- (SCATPointPickerGroup)initWithSelectionPath:(id)a3 generatorDelegate:(id)a4;
- (SCATPointPickerGroupDelegate)delegate;
- (unint64_t)hash;
- (void)setDelegate:(id)a3;
@end

@implementation SCATPointPickerGroup

- (SCATPointPickerGroup)initWithSelectionPath:(id)a3 generatorDelegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SCATPointPickerGroup;
  v9 = -[SCATPointPickerGroup initWithGenerator:](&v12, "initWithGenerator:", v8);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_selectionPath, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = v4;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 selectionPath]);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATPointPickerGroup selectionPath](self, "selectionPath"));
    if (v8 == v9)
    {
      unsigned __int8 v12 = 1;
    }

    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v7 selectionPath]);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATPointPickerGroup selectionPath](self, "selectionPath"));
      unsigned __int8 v12 = [v10 isEqual:v11];
    }
  }

  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATPointPickerGroup selectionPath](self, "selectionPath"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (CGRect)scatFrame
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATPointPickerGroup delegate](self, "delegate"));
  [v3 scannerFrameForPointPickerGroup:self];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)scatIsValid
{
  return 1;
}

- (SCATPointPickerGroupDelegate)delegate
{
  return (SCATPointPickerGroupDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSIndexPath)selectionPath
{
  return self->_selectionPath;
}

- (void).cxx_destruct
{
}

@end