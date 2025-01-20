@interface VOTBrailleGestureSpellingSuggestionHandler
- (id)_generateSpellingSuggestionsForResponder:(id)a3 languageCode:(id)a4;
- (id)_spellingSuggestionsForWord:(id)a3 languageCode:(id)a4;
- (id)_updateRangeToReplaceInContext:(id)a3 selectedRange:(_NSRange)a4;
- (id)applySpellingSuggestionForResponder:(id)a3 languageCode:(id)a4;
- (id)currentSpellingSuggestion;
- (void)clearSpellingSuggestions;
- (void)selectNextSpellingSuggestionInDirection:(int64_t)a3 responder:(id)a4 languageCode:(id)a5;
@end

@implementation VOTBrailleGestureSpellingSuggestionHandler

- (id)_updateRangeToReplaceInContext:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  v14 = sub_10003A2FC;
  v15 = sub_10003A30C;
  id v16 = 0LL;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10003A314;
  v10[3] = &unk_100177710;
  v10[6] = location;
  v10[7] = length;
  v10[4] = self;
  v10[5] = &v11;
  objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", 0, objc_msgSend(v7, "length"), 1027, v10);
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (id)_spellingSuggestionsForWord:(id)a3 languageCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    textChecker = self->_textChecker;
    if (!textChecker)
    {
      uint64_t v16 = 0LL;
      v17 = &v16;
      uint64_t v18 = 0x2050000000LL;
      v9 = (void *)qword_1001ACE18;
      uint64_t v19 = qword_1001ACE18;
      if (!qword_1001ACE18)
      {
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472LL;
        v15[2] = sub_10003A95C;
        v15[3] = &unk_100177738;
        v15[4] = &v16;
        sub_10003A95C((uint64_t)v15);
        v9 = (void *)v17[3];
      }

      v10 = v9;
      _Block_object_dispose(&v16, 8);
      uint64_t v11 = (UITextChecker *)objc_alloc_init(v10);
      v12 = self->_textChecker;
      self->_textChecker = v11;

      textChecker = self->_textChecker;
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[UITextChecker guessesForWordRange:inString:language:]( textChecker,  "guessesForWordRange:inString:language:",  0,  [v6 length],  v6,  v7));
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  return v13;
}

- (id)_generateSpellingSuggestionsForResponder:(id)a3 languageCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 value]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSAttributedString, v9);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 string]);

    id v8 = (void *)v11;
  }

  id v12 = [v6 selectedTextRange];
  v14 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureSpellingSuggestionHandler _updateRangeToReplaceInContext:selectedRange:]( self,  "_updateRangeToReplaceInContext:selectedRange:",  v8,  v12,  v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureSpellingSuggestionHandler _spellingSuggestionsForWord:languageCode:]( self,  "_spellingSuggestionsForWord:languageCode:",  v14,  v7));

  if (v14)
  {
    if (v15)
    {
      uint64_t v19 = v14;
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 arrayByAddingObjectsFromArray:v15]);
    }

    else
    {
      v20 = v14;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
    }
  }

  else
  {

    v17 = &__NSArray0__struct;
  }

  return v17;
}

- (void)selectNextSpellingSuggestionInDirection:(int64_t)a3 responder:(id)a4 languageCode:(id)a5
{
  id v16 = a4;
  id v8 = a5;
  spellingSuggestions = self->_spellingSuggestions;
  if (!spellingSuggestions)
  {
    uint64_t v10 = (NSArray *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureSpellingSuggestionHandler _generateSpellingSuggestionsForResponder:languageCode:]( self,  "_generateSpellingSuggestionsForResponder:languageCode:",  v16,  v8));
    uint64_t v11 = self->_spellingSuggestions;
    self->_spellingSuggestions = v10;

    self->_spellingSuggestionIndex = 0LL;
    spellingSuggestions = self->_spellingSuggestions;
  }

  if (-[NSArray count](spellingSuggestions, "count"))
  {
    if (a3 == 1) {
      uint64_t v12 = 1LL;
    }
    else {
      uint64_t v12 = -1LL;
    }
    unint64_t v13 = self->_spellingSuggestionIndex + v12;
    self->_spellingSuggestionIndex = v13;
    NSUInteger v14 = -[NSArray count](self->_spellingSuggestions, "count");
    if ((v13 & 0x8000000000000000LL) != 0)
    {
      int64_t v15 = v14 - 1;
      goto LABEL_11;
    }

    if (v13 >= v14)
    {
      int64_t v15 = 0LL;
LABEL_11:
      self->_spellingSuggestionIndex = v15;
    }
  }
}

- (id)currentSpellingSuggestion
{
  unint64_t spellingSuggestionIndex = self->_spellingSuggestionIndex;
  if ((spellingSuggestionIndex & 0x8000000000000000LL) != 0
    || spellingSuggestionIndex >= -[NSArray count](self->_spellingSuggestions, "count"))
  {
    v4 = 0LL;
  }

  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray objectAtIndexedSubscript:]( self->_spellingSuggestions,  "objectAtIndexedSubscript:",  self->_spellingSuggestionIndex));
  }

  return v4;
}

- (id)applySpellingSuggestionForResponder:(id)a3 languageCode:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureSpellingSuggestionHandler currentSpellingSuggestion]( self,  "currentSpellingSuggestion"));
  if (v6)
  {
    objc_msgSend( v5,  "setSelectedTextRange:refreshBraille:",  self->_rangeToReplace.location,  self->_rangeToReplace.length,  1);
    id v7 = [v5 performTextOperation:kAXTextOperationActionDelete];
    uint64_t v9 = VOTLogBrailleGestures(v7, v8);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      NSUInteger v14 = NSStringFromRange(self->_rangeToReplace);
      int64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      int v16 = 138478083;
      v17 = v15;
      __int16 v18 = 2113;
      uint64_t v19 = v6;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "Replaced word at range %{private}@ with \"%{private}@\"",  (uint8_t *)&v16,  0x16u);
    }

    [v5 insertText:v6 source:3];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray objectAtIndexedSubscript:]( self->_spellingSuggestions,  "objectAtIndexedSubscript:",  self->_spellingSuggestionIndex));
    self->_rangeToReplace.NSUInteger length = (NSUInteger)[v11 length];

    id v12 = v6;
  }

  return v6;
}

- (void)clearSpellingSuggestions
{
  spellingSuggestions = self->_spellingSuggestions;
  self->_spellingSuggestions = 0LL;

  self->_unint64_t spellingSuggestionIndex = 0x7FFFFFFFFFFFFFFFLL;
  self->_rangeToReplace = (_NSRange)xmmword_1001326B0;
}

- (void).cxx_destruct
{
}

@end