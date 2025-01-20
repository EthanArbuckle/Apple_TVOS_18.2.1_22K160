@interface SCATModernMenuEditingSheet
+ (BOOL)isValidForElement:(id)a3;
- (BOOL)_adjustSelectionForTextElement:(id)a3 direction:(unint64_t)a4 unit:(unint64_t)a5 selectedRange:(_NSRange)a6 startingRangeForSelection:(_NSRange)a7;
- (BOOL)selectionModeOn;
- (BOOL)shouldIncludeBackItem;
- (BOOL)shouldUpdateMenuItem:(id)a3;
- (SCATModernMenuEditingSheet)initWithMenu:(id)a3;
- (SCATModernMenuItem)selectWordOrNoneItem;
- (SCATModernMenuItem)selectionModeToggleItem;
- (_NSRange)startingRangeForSelection;
- (id)_identifierForTextMovementDirection:(unint64_t)a3 unit:(unint64_t)a4;
- (id)alternateTipElement;
- (id)makeMenuItemsIfNeeded;
- (int64_t)preferredTipObject;
- (void)_handleCompletedCutCopyPasteOperationForTextElement:(id)a3;
- (void)_moveCursorForTextElement:(id)a3 direction:(unint64_t)a4 unit:(unint64_t)a5;
- (void)_selectNoneForTextElement:(id)a3;
- (void)_selectWordForTextElement:(id)a3;
- (void)menuItemWasActivated:(id)a3;
- (void)setSelectWordOrNoneItem:(id)a3;
- (void)setSelectionModeOn:(BOOL)a3;
- (void)setSelectionModeToggleItem:(id)a3;
- (void)setStartingRangeForSelection:(_NSRange)a3;
@end

@implementation SCATModernMenuEditingSheet

+ (BOOL)isValidForElement:(id)a3
{
  return 1;
}

- (SCATModernMenuEditingSheet)initWithMenu:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SCATModernMenuEditingSheet;
  v5 = -[SCATModernMenuSheet initWithMenu:](&v7, "initWithMenu:", v4);
  if (v5) {
    [v4 slidePopoverToPosition:6];
  }

  return v5;
}

- (BOOL)shouldIncludeBackItem
{
  return 0;
}

- (id)makeMenuItemsIfNeeded
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 textElement]);

  unint64_t v6 = (unint64_t)[v5 traits];
  unint64_t v7 = kAXIsEditingTrait & v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 textElement]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 textOperations]);

  if (([v10 containsObject:kAXTextOperationActionSelectAll] & 1) != 0
    || ([v5 selectedTextRange], v11))
  {
    id v12 = sub_10002B014(@"EDIT-SELECT-ALL");
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"edit_selectAll",  self,  v13,  0LL,  3LL));
    [v3 addObject:v14];

    id v15 = sub_10002B014(@"EDIT_SELECT_WORD");
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"select_word_or_none",  self,  v16,  0LL,  3LL));

    [v3 addObject:v17];
    -[SCATModernMenuEditingSheet setSelectWordOrNoneItem:](self, "setSelectWordOrNoneItem:", v17);

    char v18 = 1;
  }

  else
  {
    char v18 = 0;
  }

  if (v7) {
    uint64_t v19 = 3LL;
  }
  else {
    uint64_t v19 = 1LL;
  }
  if (v7 || [v10 containsObject:kAXTextOperationActionCut])
  {
    id v20 = sub_10002B014(@"EDIT-CUT");
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"edit_cut",  self,  v21,  0LL,  v19));
    [v3 addObject:v22];
  }

  if ((v18 & 1) != 0 || [v10 containsObject:kAXTextOperationActionCopy])
  {
    id v23 = sub_10002B014(@"EDIT-COPY");
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"edit_copy",  self,  v24,  0LL,  v19));
    [v3 addObject:v25];
  }

  if (v7 || [v10 containsObject:kAXTextOperationActionPaste])
  {
    id v26 = sub_10002B014(@"EDIT-PASTE");
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"edit_paste",  self,  v27,  0LL,  v19));
    [v3 addObject:v28];

    char v29 = v18 ^ 1;
    if (!v7) {
      char v29 = 1;
    }
    if ((v29 & 1) == 0)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"selection_mode_toggle",  self,  0LL,  0LL,  3LL));
      [v3 addObject:v30];
      -[SCATModernMenuEditingSheet setSelectionModeToggleItem:](self, "setSelectionModeToggleItem:", v30);

LABEL_23:
      v32 = (void *)objc_claimAutoreleasedReturnValue( -[SCATModernMenuEditingSheet _identifierForTextMovementDirection:unit:]( self,  "_identifierForTextMovementDirection:unit:",  1LL,  0LL));
      id v33 = sub_10002B014(@"EDIT_BACKWARD_CHAR");
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  v32,  self,  v34,  @"SCATIcon_edit_previousCharacter",  3LL));
      [v3 addObject:v35];

      v36 = (void *)objc_claimAutoreleasedReturnValue( -[SCATModernMenuEditingSheet _identifierForTextMovementDirection:unit:]( self,  "_identifierForTextMovementDirection:unit:",  0LL,  0LL));
      id v37 = sub_10002B014(@"EDIT_FORWARD_CHAR");
      v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  v36,  self,  v38,  @"SCATIcon_edit_nextCharacter",  3LL));
      [v3 addObject:v39];

      v40 = (void *)objc_claimAutoreleasedReturnValue( -[SCATModernMenuEditingSheet _identifierForTextMovementDirection:unit:]( self,  "_identifierForTextMovementDirection:unit:",  1LL,  1LL));
      id v41 = sub_10002B014(@"EDIT_BACKWARD_WORD");
      v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
      v43 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  v40,  self,  v42,  @"SCATIcon_edit_previousWord",  3LL));
      [v3 addObject:v43];

      v44 = (void *)objc_claimAutoreleasedReturnValue( -[SCATModernMenuEditingSheet _identifierForTextMovementDirection:unit:]( self,  "_identifierForTextMovementDirection:unit:",  0LL,  1LL));
      id v45 = sub_10002B014(@"EDIT_FORWARD_WORD");
      v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
      v47 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  v44,  self,  v46,  @"SCATIcon_edit_nextWord",  3LL));
      [v3 addObject:v47];

      v48 = (void *)objc_claimAutoreleasedReturnValue( -[SCATModernMenuEditingSheet _identifierForTextMovementDirection:unit:]( self,  "_identifierForTextMovementDirection:unit:",  1LL,  2LL));
      id v49 = sub_10002B014(@"EDIT_BACKWARD_LINE");
      v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
      v51 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  v48,  self,  v50,  @"SCATIcon_edit_previousLine",  3LL));
      [v3 addObject:v51];

      v52 = (void *)objc_claimAutoreleasedReturnValue( -[SCATModernMenuEditingSheet _identifierForTextMovementDirection:unit:]( self,  "_identifierForTextMovementDirection:unit:",  0LL,  2LL));
      id v53 = sub_10002B014(@"EDIT_FORWARD_LINE");
      v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
      v55 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  v52,  self,  v54,  @"SCATIcon_edit_nextLine",  3LL));
      [v3 addObject:v55];

      if (!v7)
      {
        -[SCATModernMenuEditingSheet setSelectionModeOn:](self, "setSelectionModeOn:", 1LL);
        -[SCATModernMenuEditingSheet setStartingRangeForSelection:](self, "setStartingRangeForSelection:", 0LL, 0LL);
      }

      goto LABEL_25;
    }
  }

  char v31 = v18 ^ 1;
  if (v7) {
    char v31 = 0;
  }
  if ((v31 & 1) == 0) {
    goto LABEL_23;
  }
LABEL_25:

  return v3;
}

- (int64_t)preferredTipObject
{
  return 2LL;
}

- (id)alternateTipElement
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 textElement]);

  return v3;
}

- (BOOL)shouldUpdateMenuItem:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  if ([v5 isEqualToString:@"selection_mode_toggle"])
  {
    unsigned int v6 = -[SCATModernMenuEditingSheet selectionModeOn](self, "selectionModeOn");
    BOOL v7 = v6 == 0;
    if (v6) {
      v8 = @"EDIT_DISABLE_SELECT";
    }
    else {
      v8 = @"EDIT_ENABLE_SELECT";
    }
    if (v7) {
      v9 = @"SCATIcon_edit_startSelection";
    }
    else {
      v9 = @"SCATIcon_edit_endSelection";
    }
LABEL_15:
    id v14 = sub_10002B014(v8);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    [v4 setTitle:v15];
    [v4 setImageName:v9];

    goto LABEL_16;
  }

  if ([v5 isEqualToString:@"select_word_or_none"])
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 textElement]);
    [v11 selectedTextRange];
    uint64_t v13 = v12;

    if (v13) {
      v8 = @"EDIT_SELECT_NONE";
    }
    else {
      v8 = @"EDIT_SELECT_WORD";
    }
    if (v13) {
      v9 = @"SCATIcon_edit_deselect";
    }
    else {
      v9 = @"SCATIcon_edit_selectWord";
    }
    goto LABEL_15;
  }

- (void)menuItemWasActivated:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 textElement]);

  if ([v5 isEqualToString:@"edit_cut"])
  {
    v8 = &kAXTextOperationActionCut;
LABEL_7:
    [v7 performAction:2012 withValue:*v8];
    -[SCATModernMenuEditingSheet _handleCompletedCutCopyPasteOperationForTextElement:]( self,  "_handleCompletedCutCopyPasteOperationForTextElement:",  v7);
    goto LABEL_8;
  }

  if ([v5 isEqualToString:@"edit_copy"])
  {
    v8 = &kAXTextOperationActionCopy;
    goto LABEL_7;
  }

  if ([v5 isEqualToString:@"edit_paste"])
  {
    v8 = &kAXTextOperationActionPaste;
    goto LABEL_7;
  }

  if ([v5 isEqualToString:@"edit_selectAll"])
  {
    -[SCATModernMenuEditingSheet _selectNoneForTextElement:](self, "_selectNoneForTextElement:", v7);
    [v7 performAction:2012 withValue:kAXTextOperationActionSelectAll];
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuEditingSheet selectWordOrNoneItem](self, "selectWordOrNoneItem"));
    [v9 updateItem];
  }

  else if ([v5 isEqualToString:@"select_word_or_none"])
  {
    [v7 selectedTextRange];
    if (v10) {
      -[SCATModernMenuEditingSheet _selectNoneForTextElement:](self, "_selectNoneForTextElement:", v7);
    }
    else {
      -[SCATModernMenuEditingSheet _selectWordForTextElement:](self, "_selectWordForTextElement:", v7);
    }
  }

  else if ([v5 hasPrefix:@"move_"])
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringWithRange:", objc_msgSend(@"move_", "length"), 1));
    id v12 = [v11 integerValue];

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringWithRange:", (char *)objc_msgSend(@"move_", "length") + 2, 1));
    id v14 = [v13 integerValue];

    -[SCATModernMenuEditingSheet _moveCursorForTextElement:direction:unit:]( self,  "_moveCursorForTextElement:direction:unit:",  v7,  v12,  v14);
  }

  else if ([v5 isEqualToString:@"selection_mode_toggle"])
  {
    -[SCATModernMenuEditingSheet setSelectionModeOn:]( self,  "setSelectionModeOn:",  -[SCATModernMenuEditingSheet selectionModeOn](self, "selectionModeOn") ^ 1);
    if (-[SCATModernMenuEditingSheet selectionModeOn](self, "selectionModeOn"))
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 textElement]);
      id v17 = [v16 selectedTextRange];
      -[SCATModernMenuEditingSheet setStartingRangeForSelection:](self, "setStartingRangeForSelection:", v17, v18);

      if (-[SCATModernMenuEditingSheet startingRangeForSelection](self, "startingRangeForSelection") == (id)0x7FFFFFFF) {
        -[SCATModernMenuEditingSheet setStartingRangeForSelection:](self, "setStartingRangeForSelection:", 0LL, 0LL);
      }
    }
  }

  else
  {
    v19.receiver = self;
    v19.super_class = (Class)&OBJC_CLASS___SCATModernMenuEditingSheet;
    -[SCATModernMenuSheet menuItemWasActivated:](&v19, "menuItemWasActivated:", v4);
  }

- (BOOL)_adjustSelectionForTextElement:(id)a3 direction:(unint64_t)a4 unit:(unint64_t)a5 selectedRange:(_NSRange)a6 startingRangeForSelection:(_NSRange)a7
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v11 = a3;
  if (a7.location == 0x7FFFFFFF) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATModernMenuEditingSheet.m",  267LL,  "-[SCATModernMenuEditingSheet _adjustSelectionForTextElement:direction:unit:selectedRange:startingRangeForSelection:]",  @"We should have guaranteed a starting location for the selection region.");
  }
  if (location + length > a7.location) {
    location += length;
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 uiElement]);
  id v13 = objc_msgSend(v12, "nextCursorRangeInDirection:unit:outputRange:currentCursorRange:", a4, a5, 0, location, 0);
  uint64_t v15 = v14;

  if (v13 != (id)0x7FFFFFFF)
  {
    NSUInteger v16 = (NSUInteger)v13 + v15 - a7.location;
    else {
      NSUInteger v17 = (NSUInteger)v13;
    }
    else {
      NSUInteger v18 = a7.location + a7.length - (void)v13;
    }
    [v11 performAction:2012 withValue:kAXTextOperationActionSelect];
    objc_msgSend(v11, "setSelectedTextRange:", v17, v18);
  }

  return v13 != (id)0x7FFFFFFF;
}

- (void)_moveCursorForTextElement:(id)a3 direction:(unint64_t)a4 unit:(unint64_t)a5
{
  id v18 = a3;
  if (-[SCATModernMenuEditingSheet selectionModeOn](self, "selectionModeOn"))
  {
    if (-[SCATModernMenuEditingSheet selectionModeOn](self, "selectionModeOn"))
    {
      id v8 = [v18 selectedTextRange];
      uint64_t v10 = v9;
      id v11 = -[SCATModernMenuEditingSheet startingRangeForSelection](self, "startingRangeForSelection");
      -[SCATModernMenuEditingSheet _adjustSelectionForTextElement:direction:unit:selectedRange:startingRangeForSelection:]( self,  "_adjustSelectionForTextElement:direction:unit:selectedRange:startingRangeForSelection:",  v18,  a4,  a5,  v8,  v10,  v11,  v12);
    }
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v18 uiElement]);
    id v14 = [v13 nextCursorRangeInDirection:a4 unit:a5 outputRange:0];
    uint64_t v16 = v15;

    if (v14 != (id)0x7FFFFFFF) {
      objc_msgSend(v18, "setSelectedTextRange:", v14, v16);
    }
  }

  NSUInteger v17 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuEditingSheet selectWordOrNoneItem](self, "selectWordOrNoneItem"));
  [v17 updateItem];
}

- (void)_selectNoneForTextElement:(id)a3
{
  id v7 = a3;
  id v4 = [v7 selectedTextRange];
  if (v5)
  {
    id v6 = v4;
    if (-[SCATModernMenuEditingSheet selectionModeOn](self, "selectionModeOn")) {
      -[SCATModernMenuEditingSheet setStartingRangeForSelection:](self, "setStartingRangeForSelection:", v6, 0LL);
    }
    objc_msgSend(v7, "setSelectedTextRange:", v6, 0);
  }
}

- (void)_selectWordForTextElement:(id)a3
{
  id v6 = a3;
  unint64_t v4 = (unint64_t)[v6 traits];
  if ((kAXIsEditingTrait & v4) != 0) {
    id v5 = [v6 selectedTextRange];
  }
  else {
    id v5 = 0LL;
  }
  if (!-[SCATModernMenuEditingSheet _adjustSelectionForTextElement:direction:unit:selectedRange:startingRangeForSelection:]( self,  "_adjustSelectionForTextElement:direction:unit:selectedRange:startingRangeForSelection:",  v6,  0LL,  1LL,  v5,  0LL,  v5,  0LL)) {
    -[SCATModernMenuEditingSheet _adjustSelectionForTextElement:direction:unit:selectedRange:startingRangeForSelection:]( self,  "_adjustSelectionForTextElement:direction:unit:selectedRange:startingRangeForSelection:",  v6,  1LL,  1LL,  v5,  0LL,  v5,  0LL);
  }
}

- (void)_handleCompletedCutCopyPasteOperationForTextElement:(id)a3
{
  if (-[SCATModernMenuEditingSheet selectionModeOn](self, "selectionModeOn", a3))
  {
    -[SCATModernMenuEditingSheet setSelectionModeOn:](self, "setSelectionModeOn:", 0LL);
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[SCATModernMenuEditingSheet selectionModeToggleItem](self, "selectionModeToggleItem"));
    [v4 updateItem];
  }

- (id)_identifierForTextMovementDirection:(unint64_t)a3 unit:(unint64_t)a4
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"move_%lu_%lu", a3, a4);
}

- (BOOL)selectionModeOn
{
  return self->_selectionModeOn;
}

- (void)setSelectionModeOn:(BOOL)a3
{
  self->_selectionModeOn = a3;
}

- (_NSRange)startingRangeForSelection
{
  p_startingRangeForSelection = &self->_startingRangeForSelection;
  NSUInteger location = self->_startingRangeForSelection.location;
  NSUInteger length = p_startingRangeForSelection->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setStartingRangeForSelection:(_NSRange)a3
{
  self->_startingRangeForSelection = a3;
}

- (SCATModernMenuItem)selectionModeToggleItem
{
  return self->_selectionModeToggleItem;
}

- (void)setSelectionModeToggleItem:(id)a3
{
}

- (SCATModernMenuItem)selectWordOrNoneItem
{
  return self->_selectWordOrNoneItem;
}

- (void)setSelectWordOrNoneItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end