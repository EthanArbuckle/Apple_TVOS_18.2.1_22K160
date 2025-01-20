@interface VOTElementGesturedTextInputAttributes
- (BOOL)acceptsContractedBraille;
- (BOOL)acceptsRawInput;
- (BOOL)canDeleteCharacter;
- (BOOL)isActiveResponder;
- (BOOL)shouldEchoCharacter;
- (BOOL)shouldPlayKeyboardSecureClickSound;
- (NSString)language;
- (VOTElementGesturedTextInputAttributes)initWithAttributes:(id)a3;
- (id)_descriptionForBool:(BOOL)a3;
- (id)_descriptionForCharacterSets:(unint64_t)a3;
- (id)description;
- (unint64_t)allowedCharacterSets;
- (unint64_t)preferredCharacterSet;
- (void)setAcceptsContractedBraille:(BOOL)a3;
- (void)setAcceptsRawInput:(BOOL)a3;
- (void)setAllowedCharacterSets:(unint64_t)a3;
- (void)setCanDeleteCharacter:(BOOL)a3;
- (void)setIsActiveResponder:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setPreferredCharacterSet:(unint64_t)a3;
- (void)setShouldEchoCharacter:(BOOL)a3;
- (void)setShouldPlayKeyboardSecureClickSound:(BOOL)a3;
@end

@implementation VOTElementGesturedTextInputAttributes

- (VOTElementGesturedTextInputAttributes)initWithAttributes:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___VOTElementGesturedTextInputAttributes;
  v5 = -[VOTElementGesturedTextInputAttributes init](&v30, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:AXVoiceOverHandwritingAttributePreferredCharacterSet]);
    v7 = v6;
    if (v6) {
      uint64_t v8 = (uint64_t)[v6 unsignedIntegerValue];
    }
    else {
      uint64_t v8 = 1LL;
    }
    -[VOTElementGesturedTextInputAttributes setPreferredCharacterSet:](v5, "setPreferredCharacterSet:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:AXVoiceOverHandwritingAttributeAllowedCharacterSets]);
    v10 = v9;
    if (v9) {
      uint64_t v11 = (uint64_t)[v9 unsignedIntegerValue];
    }
    else {
      uint64_t v11 = 15LL;
    }
    -[VOTElementGesturedTextInputAttributes setAllowedCharacterSets:](v5, "setAllowedCharacterSets:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:AXVoiceOverHandwritingAttributeCanDeleteCharacter]);
    v13 = v12;
    if (v12) {
      uint64_t v14 = (uint64_t)[v12 BOOLValue];
    }
    else {
      uint64_t v14 = 1LL;
    }
    -[VOTElementGesturedTextInputAttributes setCanDeleteCharacter:](v5, "setCanDeleteCharacter:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:AXVoiceOverHandwritingAttributeShouldEchoCharacter]);
    v16 = v15;
    if (v15) {
      uint64_t v17 = (uint64_t)[v15 BOOLValue];
    }
    else {
      uint64_t v17 = 1LL;
    }
    -[VOTElementGesturedTextInputAttributes setShouldEchoCharacter:](v5, "setShouldEchoCharacter:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:AXVoiceOverHandwritingAttributeShouldPlayKeyboardSecureClickSound]);
    v19 = v18;
    if (v18) {
      id v20 = [v18 BOOLValue];
    }
    else {
      id v20 = 0LL;
    }
    -[VOTElementGesturedTextInputAttributes setShouldPlayKeyboardSecureClickSound:]( v5,  "setShouldPlayKeyboardSecureClickSound:",  v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:AXVoiceOverHandwritingAttributeAcceptsRawInput]);
    v22 = v21;
    if (v21) {
      id v23 = [v21 BOOLValue];
    }
    else {
      id v23 = 0LL;
    }
    -[VOTElementGesturedTextInputAttributes setAcceptsRawInput:](v5, "setAcceptsRawInput:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:AXVoiceOverHandwritingAttributeAcceptsContractedBraille]);
    v25 = v24;
    if (v24) {
      id v26 = [v24 BOOLValue];
    }
    else {
      id v26 = 0LL;
    }
    -[VOTElementGesturedTextInputAttributes setAcceptsContractedBraille:](v5, "setAcceptsContractedBraille:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:AXVoiceOverHandwritingAttributeLanguage]);
    -[VOTElementGesturedTextInputAttributes setLanguage:](v5, "setLanguage:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"AXIsActiveResponder"]);
    -[VOTElementGesturedTextInputAttributes setIsActiveResponder:]( v5,  "setIsActiveResponder:",  [v28 BOOLValue]);
  }

  return v5;
}

- (id)_descriptionForCharacterSets:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  v5 = v4;
  if (a3 != 15)
  {
    if ((a3 & 1) != 0)
    {
      [v4 appendStringWithComma:@"lowercase"];
      if ((a3 & 2) == 0)
      {
LABEL_5:
        if ((a3 & 4) == 0) {
          goto LABEL_6;
        }
        goto LABEL_11;
      }
    }

    else if ((a3 & 2) == 0)
    {
      goto LABEL_5;
    }

    [v5 appendStringWithComma:@"uppercase"];
    if ((a3 & 4) == 0)
    {
LABEL_6:
      if ((a3 & 8) == 0) {
        return v5;
      }
LABEL_7:
      [v5 appendStringWithComma:@"punctuation"];
      return v5;
    }

- (id)_descriptionForBool:(BOOL)a3
{
  if (a3) {
    return @"YES";
  }
  else {
    return @"NO";
  }
}

- (id)description
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___VOTElementGesturedTextInputAttributes;
  id v3 = -[VOTElementGesturedTextInputAttributes description](&v15, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElementGesturedTextInputAttributes _descriptionForCharacterSets:]( self,  "_descriptionForCharacterSets:",  -[VOTElementGesturedTextInputAttributes preferredCharacterSet](self, "preferredCharacterSet")));
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElementGesturedTextInputAttributes _descriptionForCharacterSets:]( self,  "_descriptionForCharacterSets:",  -[VOTElementGesturedTextInputAttributes allowedCharacterSets](self, "allowedCharacterSets")));
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElementGesturedTextInputAttributes _descriptionForBool:]( self,  "_descriptionForBool:",  -[VOTElementGesturedTextInputAttributes canDeleteCharacter](self, "canDeleteCharacter")));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElementGesturedTextInputAttributes _descriptionForBool:]( self,  "_descriptionForBool:",  -[VOTElementGesturedTextInputAttributes shouldEchoCharacter](self, "shouldEchoCharacter")));
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElementGesturedTextInputAttributes _descriptionForBool:]( self,  "_descriptionForBool:",  -[VOTElementGesturedTextInputAttributes shouldPlayKeyboardSecureClickSound]( self,  "shouldPlayKeyboardSecureClickSound")));
  v10 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElementGesturedTextInputAttributes _descriptionForBool:]( self,  "_descriptionForBool:",  -[VOTElementGesturedTextInputAttributes acceptsRawInput](self, "acceptsRawInput")));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElementGesturedTextInputAttributes _descriptionForBool:]( self,  "_descriptionForBool:",  -[VOTElementGesturedTextInputAttributes acceptsContractedBraille](self, "acceptsContractedBraille")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElementGesturedTextInputAttributes language](self, "language"));
  v13 = (void *)objc_claimAutoreleasedReturnValue( [v4 stringByAppendingFormat:@"- preferred character set %@, allowed character sets %@, can delete character %@, should echo character %@, should play secure click %@, accepts raw input %@, accepts contracted braille %@, language %@", v5, v6, v7, v8, v9, v10, v11, v12]);

  return v13;
}

- (unint64_t)preferredCharacterSet
{
  return self->_preferredCharacterSet;
}

- (void)setPreferredCharacterSet:(unint64_t)a3
{
  self->_preferredCharacterSet = a3;
}

- (unint64_t)allowedCharacterSets
{
  return self->_allowedCharacterSets;
}

- (void)setAllowedCharacterSets:(unint64_t)a3
{
  self->_allowedCharacterSets = a3;
}

- (BOOL)canDeleteCharacter
{
  return self->_canDeleteCharacter;
}

- (void)setCanDeleteCharacter:(BOOL)a3
{
  self->_canDeleteCharacter = a3;
}

- (BOOL)shouldEchoCharacter
{
  return self->_shouldEchoCharacter;
}

- (void)setShouldEchoCharacter:(BOOL)a3
{
  self->_shouldEchoCharacter = a3;
}

- (BOOL)acceptsRawInput
{
  return self->_acceptsRawInput;
}

- (void)setAcceptsRawInput:(BOOL)a3
{
  self->_acceptsRawInput = a3;
}

- (BOOL)shouldPlayKeyboardSecureClickSound
{
  return self->_shouldPlayKeyboardSecureClickSound;
}

- (void)setShouldPlayKeyboardSecureClickSound:(BOOL)a3
{
  self->_shouldPlayKeyboardSecureClickSound = a3;
}

- (BOOL)acceptsContractedBraille
{
  return self->_acceptsContractedBraille;
}

- (void)setAcceptsContractedBraille:(BOOL)a3
{
  self->_acceptsContractedBraille = a3;
}

- (BOOL)isActiveResponder
{
  return self->_isActiveResponder;
}

- (void)setIsActiveResponder:(BOOL)a3
{
  self->_isActiveResponder = a3;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

@end