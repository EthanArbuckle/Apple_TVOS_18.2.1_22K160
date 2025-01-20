@interface _NSPersonNameComponentsStyleFormatter
- (BOOL)fullComponentsAreValid:(id)a3;
- (BOOL)isEnabled;
- (BOOL)shouldFallBack;
- (BOOL)shouldIgnoreComponentsContainingSpecialCharacters;
- (NSArray)fallbackDescriptor;
- (NSArray)orderedKeysOfInterest;
- (NSArray)orderedTemplate;
- (NSPersonNameComponentsFormatter)masterFormatter;
- (NSSet)abbreviatedKeys;
- (NSSet)keysOfInterest;
- (_NSPersonNameComponentsStyleFormatter)fallbackStyleFormatter;
- (_NSPersonNameComponentsStyleFormatter)initWithMasterFormatter:(id)a3;
- (id)_delimiterBetweenString:(id)a3 andString:(id)a4 isPhonetic:(BOOL)a5;
- (id)_formattedStringFromOrderedKeys:(id)a3 components:(id)a4 attributesByRange:(id)a5;
- (id)_orderedNonEmptyKeysFromComponents:(id)a3;
- (id)annotatedStringFromPersonNameComponents:(id)a3;
- (id)stringFromComponents:(id)a3 attributesByRange:(id)a4;
- (int64_t)ordering;
- (void)_releaseIvars;
- (void)dealloc;
- (void)setFallbackStyleFormatter:(id)a3;
- (void)setOrdering:(int64_t)a3;
@end

@implementation _NSPersonNameComponentsStyleFormatter

- (_NSPersonNameComponentsStyleFormatter)initWithMasterFormatter:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS____NSPersonNameComponentsStyleFormatter;
  v5 = -[_NSPersonNameComponentsStyleFormatter init](&v7, sel_init);
  if (v5)
  {
    if (!a3) {
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  v5,  @"NSPersonNameComponentsFormatter.m",  746LL,  @"We should never have a nil master formatter");
    }
    v5->_masterFormatter = (NSPersonNameComponentsFormatter *)[a3 copy];
  }

  return v5;
}

- (NSSet)abbreviatedKeys
{
  return 0LL;
}

- (NSSet)keysOfInterest
{
  return 0LL;
}

- (BOOL)shouldFallBack
{
  return 1;
}

- (BOOL)shouldIgnoreComponentsContainingSpecialCharacters
{
  return 0;
}

- (BOOL)isEnabled
{
  return !-[NSPersonNameComponentsFormatter __localizedRestrictionExistsForStyle:]( -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter"),  "__localizedRestrictionExistsForStyle:",  -[NSPersonNameComponentsFormatter style]( -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter"),  "style"));
}

- (NSArray)orderedKeysOfInterest
{
  v10[5] = *MEMORY[0x1895F89C0];
  if (!-[_NSPersonNameComponentsStyleFormatter keysOfInterest](self, "keysOfInterest")) {
    return 0LL;
  }
  v3 = -[_NSPersonNameComponentsStyleFormatter orderedTemplate](self, "orderedTemplate");
  uint64_t v4 = MEMORY[0x1895F87A8];
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __62___NSPersonNameComponentsStyleFormatter_orderedKeysOfInterest__block_invoke;
  v10[3] = &unk_189CA5D28;
  v10[4] = self;
  v5 = -[NSArray indexesOfObjectsPassingTest:](v3, "indexesOfObjectsPassingTest:", v10);
  v6 = (NSArray *)[MEMORY[0x189603FA8] array];
  v8[0] = v4;
  v8[1] = 3221225472LL;
  v8[2] = __62___NSPersonNameComponentsStyleFormatter_orderedKeysOfInterest__block_invoke_2;
  v8[3] = &unk_189CA5D50;
  BOOL v9 = -[NSPersonNameComponentsFormatter isPhonetic]( -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter"),  "isPhonetic");
  v8[4] = self;
  v8[5] = v6;
  -[NSIndexSet enumerateIndexesUsingBlock:](v5, "enumerateIndexesUsingBlock:", v8);
  return v6;
}

- (BOOL)fullComponentsAreValid:(id)a3
{
  return 1;
}

- (int64_t)ordering
{
  return self->_ordering;
}

- (void)setOrdering:(int64_t)a3
{
  self->_ordering = a3;
}

- (NSArray)orderedTemplate
{
  result = self->_orderedTemplate;
  if (!result)
  {
    if (-[_NSPersonNameComponentsStyleFormatter ordering](self, "ordering") == 2) {
      id v4 = +[NSPersonNameComponentsFormatter __familyNameFirstOrdering]( &OBJC_CLASS___NSPersonNameComponentsFormatter,  "__familyNameFirstOrdering");
    }
    else {
      id v4 = +[NSPersonNameComponentsFormatter __givenNameFirstOrdering]( &OBJC_CLASS___NSPersonNameComponentsFormatter,  "__givenNameFirstOrdering");
    }
    result = (NSArray *)(id)[v4 copy];
    self->_orderedTemplate = result;
  }

  return result;
}

- (id)stringFromComponents:(id)a3 attributesByRange:(id)a4
{
  id v7 = -[_NSPersonNameComponentsStyleFormatter _orderedNonEmptyKeysFromComponents:]( self,  "_orderedNonEmptyKeysFromComponents:");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && +[NSPersonNameComponentsFormatter __shortStyleRestrictionExistsForComponents:shortStyle:]( &OBJC_CLASS___NSPersonNameComponentsFormatter,  "__shortStyleRestrictionExistsForComponents:shortStyle:",  a3,  -[_NSPersonNameComponentsStyleFormatter shortNameFormat](self, "shortNameFormat"))
    || !-[_NSPersonNameComponentsStyleFormatter fullComponentsAreValid:](self, "fullComponentsAreValid:", a3)
    || !-[_NSPersonNameComponentsStyleFormatter isEnabled](self, "isEnabled")
    || -[NSPersonNameComponentsFormatter __localizedRestrictionExistsForComponents:ignoreUndeterminedComponents:]( -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter"),  "__localizedRestrictionExistsForComponents:ignoreUndeterminedComponents:",  a3,  -[_NSPersonNameComponentsStyleFormatter shouldIgnoreComponentsContainingSpecialCharacters]( self,  "shouldIgnoreComponentsContainingSpecialCharacters")))
  {
    id v8 = 0LL;
  }

  else
  {
    id v8 = -[_NSPersonNameComponentsStyleFormatter _formattedStringFromOrderedKeys:components:attributesByRange:]( self,  "_formattedStringFromOrderedKeys:components:attributesByRange:",  v7,  a3,  a4);
  }

  if (![v8 length])
  {
    if (-[_NSPersonNameComponentsStyleFormatter shouldFallBack](self, "shouldFallBack")
      && !-[NSPersonNameComponentsFormatter _ignoresFallbacks]( -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter"),  "_ignoresFallbacks")
      && -[_NSPersonNameComponentsStyleFormatter fallbackStyleFormatter](self, "fallbackStyleFormatter"))
    {
      return -[_NSPersonNameComponentsStyleFormatter stringFromComponents:attributesByRange:]( -[_NSPersonNameComponentsStyleFormatter fallbackStyleFormatter](self, "fallbackStyleFormatter"),  "stringFromComponents:attributesByRange:",  a3,  a4);
    }

    return 0LL;
  }

  return v8;
}

- (id)_orderedNonEmptyKeysFromComponents:(id)a3
{
  v7[5] = *MEMORY[0x1895F89C0];
  -[_NSPersonNameComponentsStyleFormatter setOrdering:]( self,  "setOrdering:",  -[NSPersonNameComponentsFormatter __computedNameOrderForComponents:]( -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter"),  "__computedNameOrderForComponents:",  a3));
  v5 = -[_NSPersonNameComponentsStyleFormatter orderedKeysOfInterest](self, "orderedKeysOfInterest");
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __76___NSPersonNameComponentsStyleFormatter__orderedNonEmptyKeysFromComponents___block_invoke;
  v7[3] = &unk_189CA5D28;
  v7[4] = a3;
  return -[NSArray objectsAtIndexes:]( -[_NSPersonNameComponentsStyleFormatter orderedKeysOfInterest](self, "orderedKeysOfInterest"),  "objectsAtIndexes:",  -[NSArray indexesOfObjectsPassingTest:](v5, "indexesOfObjectsPassingTest:", v7));
}

- (id)_delimiterBetweenString:(id)a3 andString:(id)a4 isPhonetic:(BOOL)a5
{
  if (a5) {
    goto LABEL_9;
  }
  unint64_t v7 = +[NSPersonNameComponentsFormatter __inferredScriptIndexFromString:]( &OBJC_CLASS___NSPersonNameComponentsFormatter,  "__inferredScriptIndexFromString:");
  unint64_t v8 = +[NSPersonNameComponentsFormatter __inferredScriptIndexFromString:]( &OBJC_CLASS___NSPersonNameComponentsFormatter,  "__inferredScriptIndexFromString:",  a4);
  if (v7 - 2 > 3) {
    goto LABEL_9;
  }
  if (v8 - 3 < 3) {
    goto LABEL_4;
  }
  if (v8 != 2)
  {
LABEL_9:
    BOOL v9 = @" ";
    return (id)-[__CFString copy](v9, "copy");
  }

  if (+[NSPersonNameComponentsFormatter isKatakana:](&OBJC_CLASS___NSPersonNameComponentsFormatter, "isKatakana:", a3)
    && +[NSPersonNameComponentsFormatter isKatakana:](&OBJC_CLASS___NSPersonNameComponentsFormatter, "isKatakana:", a4))
  {
    BOOL v9 = @"・";
    return (id)-[__CFString copy](v9, "copy");
  }

- (id)_formattedStringFromOrderedKeys:(id)a3 components:(id)a4 attributesByRange:(id)a5
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3052000000LL;
  v15 = __Block_byref_object_copy__33;
  v16 = __Block_byref_object_dispose__33;
  v17 = +[NSString string](&OBJC_CLASS___NSMutableString, "string");
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __102___NSPersonNameComponentsStyleFormatter__formattedStringFromOrderedKeys_components_attributesByRange___block_invoke;
  v11[3] = &unk_189CA5D78;
  v11[4] = a4;
  v11[5] = self;
  v11[7] = a5;
  v11[8] = &v12;
  v11[6] = a3;
  [a3 enumerateObjectsUsingBlock:v11];
  BOOL v9 = (void *)v13[5];
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (id)annotatedStringFromPersonNameComponents:(id)a3
{
  v10[5] = *MEMORY[0x1895F89C0];
  v5 = (void *)[MEMORY[0x189603FC8] dictionary];
  v6 = -[_NSPersonNameComponentsStyleFormatter stringFromComponents:attributesByRange:]( self,  "stringFromComponents:attributesByRange:",  a3,  v5);
  if (!v6)
  {
    if (qword_18C4964C0 != -1) {
      dispatch_once(&qword_18C4964C0, &__block_literal_global_1108);
    }
    if (byte_18C496421) {
      v6 = &stru_189CA6A28;
    }
    else {
      v6 = 0LL;
    }
  }

  unint64_t v7 = objc_alloc(&OBJC_CLASS___NSMutableAttributedString);
  unint64_t v8 =  -[NSMutableAttributedString initWithString:attributes:]( v7,  "initWithString:attributes:",  v6,  MEMORY[0x189604A60]);
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __81___NSPersonNameComponentsStyleFormatter_annotatedStringFromPersonNameComponents___block_invoke;
  v10[3] = &unk_189C9A768;
  v10[4] = v8;
  [v5 enumerateKeysAndObjectsUsingBlock:v10];
  return (id)-[NSMutableAttributedString copy](v8, "copy");
}

- (void)_releaseIvars
{
}

- (NSArray)fallbackDescriptor
{
  result = self->_fallbackDescriptor;
  if (!result)
  {
    id v4 = (void *)[MEMORY[0x189603FA8] array];
    uint64_t v5 = objc_msgSend( MEMORY[0x189604010],  "setWithArray:",  -[_NSPersonNameComponentsStyleFormatter orderedKeysOfInterest](self, "orderedKeysOfInterest"));
    if (v5) {
      [v4 addObject:v5];
    }
    v6 = -[_NSPersonNameComponentsStyleFormatter fallbackStyleFormatter](self, "fallbackStyleFormatter");
    if (v6)
    {
      unint64_t v7 = v6;
      do
      {
        unint64_t v8 = (void *)objc_msgSend( MEMORY[0x189604010],  "setWithArray:",  -[_NSPersonNameComponentsStyleFormatter orderedKeysOfInterest](v7, "orderedKeysOfInterest"));
        if (v8)
        {
          BOOL v9 = v8;
          if ([v8 count])
          {
            if (([v4 containsObject:v9] & 1) == 0) {
              [v4 addObject:v9];
            }
          }
        }

        unint64_t v7 = -[_NSPersonNameComponentsStyleFormatter fallbackStyleFormatter](v7, "fallbackStyleFormatter");
      }

      while (v7);
    }

    result = v4;
    self->_fallbackDescriptor = result;
  }

  return result;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  -[_NSPersonNameComponentsStyleFormatter _releaseIvars](self, "_releaseIvars");
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSPersonNameComponentsStyleFormatter;
  -[_NSPersonNameComponentsStyleFormatter dealloc](&v3, sel_dealloc);
}

- (NSPersonNameComponentsFormatter)masterFormatter
{
  return (NSPersonNameComponentsFormatter *)objc_getProperty(self, a2, 72LL, 1);
}

- (_NSPersonNameComponentsStyleFormatter)fallbackStyleFormatter
{
  return (_NSPersonNameComponentsStyleFormatter *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setFallbackStyleFormatter:(id)a3
{
}

@end