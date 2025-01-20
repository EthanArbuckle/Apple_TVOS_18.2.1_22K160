@interface VOTKeyInfo
- (AXEventRepresentation)eventRecord;
- (BOOL)isAppleVendorKey;
- (BOOL)isArrowKey;
- (BOOL)isBrightnessKey;
- (BOOL)isCapsLockKeyDown;
- (BOOL)isCapsLockKeyToggledOn;
- (BOOL)isCapsLockKeyUp;
- (BOOL)isCommandKeyPressed;
- (BOOL)isControlKeyPressed;
- (BOOL)isEscapeKey;
- (BOOL)isFNKey;
- (BOOL)isFNKeyPressed;
- (BOOL)isKeyboardSelectKey;
- (BOOL)isMediaKey;
- (BOOL)isOptionKeyPressed;
- (BOOL)isShiftKeyPressed;
- (BOOL)keyDown;
- (BOOL)keyUp;
- (BOOL)modifiersChanged;
- (NSString)characters;
- (NSString)originalCharacters;
- (VOTKeyInfo)initWithEventRepresentation:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)mediaKeyCode;
- (int64_t)eventOrigin;
- (unsigned)changedModifiers;
- (unsigned)keyCode;
- (unsigned)modifierState;
- (void)_setCommandKeyPressed:(BOOL)a3;
- (void)setChangedModifiers:(unsigned int)a3;
- (void)setCharacters:(id)a3;
- (void)setEventOrigin:(int64_t)a3;
- (void)setEventRecord:(id)a3;
- (void)setKeyCode:(unsigned __int16)a3;
- (void)setKeyDown:(BOOL)a3;
- (void)setKeyUp:(BOOL)a3;
- (void)setModifiersChanged:(BOOL)a3;
- (void)setOriginalCharacters:(id)a3;
@end

@implementation VOTKeyInfo

- (VOTKeyInfo)initWithEventRepresentation:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___VOTKeyInfo;
  v5 = -[VOTKeyInfo init](&v13, "init");
  v6 = v5;
  v7 = 0LL;
  if (v4 && v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 keyInfo]);
    v9 = v8;
    if (v8)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v8 modifiedInput]);
      if (v10)
      {
      }

      else if ([v9 keyCode])
      {
        [(id)VOTSharedWorkspace loadUIKit];
        [v9 translateKeycode];
      }
    }

    -[VOTKeyInfo setEventRecord:](v6, "setEventRecord:", v4);
    *(_BYTE *)&v6->_flags = *(_BYTE *)&v6->_flags & 0xFE | [v9 keyDown];
    else {
      char v11 = 2;
    }
    *(_BYTE *)&v6->_flags = *(_BYTE *)&v6->_flags & 0xFD | v11;
    v7 = v6;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTKeyInfo eventRecord](self, "eventRecord"));
  id v6 = [v5 copyWithZone:a3];

  v7 = objc_alloc_init(&OBJC_CLASS___VOTKeyInfo);
  -[VOTKeyInfo setEventRecord:](v7, "setEventRecord:", v6);
  -[VOTKeyInfo setKeyDown:](v7, "setKeyDown:", -[VOTKeyInfo keyDown](self, "keyDown"));
  -[VOTKeyInfo setKeyUp:](v7, "setKeyUp:", -[VOTKeyInfo keyUp](self, "keyUp"));
  -[VOTKeyInfo setChangedModifiers:]( v7,  "setChangedModifiers:",  -[VOTKeyInfo changedModifiers](self, "changedModifiers"));

  return v7;
}

- (unsigned)modifierState
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AXEventRepresentation keyInfo](self->_eventRecord, "keyInfo"));
  unsigned int v3 = [v2 modifierState];

  return v3;
}

- (NSString)characters
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AXEventRepresentation keyInfo](self->_eventRecord, "keyInfo"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 modifiedInput]);

  return (NSString *)v3;
}

- (NSString)originalCharacters
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AXEventRepresentation keyInfo](self->_eventRecord, "keyInfo"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 unmodifiedInput]);

  return (NSString *)v3;
}

- (BOOL)modifiersChanged
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (void)setModifiersChanged:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)keyDown
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)setKeyDown:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)keyUp
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)setKeyUp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (unsigned)keyCode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTKeyInfo eventRecord](self, "eventRecord"));
  char v3 = (void *)objc_claimAutoreleasedReturnValue([v2 keyInfo]);
  unsigned __int16 v4 = (unsigned __int16)[v3 keyCode];

  return v4;
}

- (void)setKeyCode:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[VOTKeyInfo eventRecord](self, "eventRecord"));
  unsigned __int16 v4 = (void *)objc_claimAutoreleasedReturnValue([v5 keyInfo]);
  [v4 setKeyCode:v3];
}

- (BOOL)isFNKey
{
  return -[VOTKeyInfo keyCode](self, "keyCode") == 48
      || -[AXEventRepresentation type](self->_eventRecord, "type") == 4500
      || -[AXEventRepresentation type](self->_eventRecord, "type") == 4501;
}

- (BOOL)isFNKeyPressed
{
  return (-[VOTKeyInfo modifierState](self, "modifierState") >> 6) & 1;
}

- (BOOL)isShiftKeyPressed
{
  return (-[VOTKeyInfo modifierState](self, "modifierState") >> 3) & 1;
}

- (BOOL)isCommandKeyPressed
{
  return -[VOTKeyInfo modifierState](self, "modifierState") & 1;
}

- (BOOL)isOptionKeyPressed
{
  return (-[VOTKeyInfo modifierState](self, "modifierState") >> 1) & 1;
}

- (BOOL)isControlKeyPressed
{
  return (-[VOTKeyInfo modifierState](self, "modifierState") >> 2) & 1;
}

- (BOOL)isCapsLockKeyToggledOn
{
  return (-[VOTKeyInfo modifierState](self, "modifierState") >> 4) & 1;
}

- (BOOL)isCapsLockKeyDown
{
  if (-[VOTKeyInfo keyCode](self, "keyCode") == 57) {
    return -[VOTKeyInfo keyDown](self, "keyDown");
  }
  else {
    return 0;
  }
}

- (BOOL)isCapsLockKeyUp
{
  if (-[VOTKeyInfo keyCode](self, "keyCode") == 57) {
    return -[VOTKeyInfo keyUp](self, "keyUp");
  }
  else {
    return 0;
  }
}

- (BOOL)isKeyboardSelectKey
{
  return -[AXEventRepresentation type](self->_eventRecord, "type") == 4501
      || -[AXEventRepresentation type](self->_eventRecord, "type") == 4500;
}

- (int)mediaKeyCode
{
  int result = -[VOTKeyInfo isMediaKey](self, "isMediaKey");
  if (result) {
    return -[AXEventRepresentation subtype](self->_eventRecord, "subtype");
  }
  return result;
}

- (BOOL)isArrowKey
{
  return -[VOTKeyInfo keyCode](self, "keyCode") - 79 < 4;
}

- (BOOL)isMediaKey
{
  return -[AXEventRepresentation type](self->_eventRecord, "type") == 1023;
}

- (BOOL)isAppleVendorKey
{
  return 0;
}

- (BOOL)isBrightnessKey
{
  BOOL v3 = -[VOTKeyInfo isAppleVendorKey](self, "isAppleVendorKey");
  if (v3) {
    LOBYTE(v3) = (-[AXEventRepresentation subtype](self->_eventRecord, "subtype") & 0xFFFFFFFE) == 32;
  }
  return v3;
}

- (BOOL)isEscapeKey
{
  return -[VOTKeyInfo keyCode](self, "keyCode") == 41;
}

- (id)description
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXEventRepresentation keyInfo](self->_eventRecord, "keyInfo"));
  if (-[VOTKeyInfo isAppleVendorKey](self, "isAppleVendorKey"))
  {
    unsigned __int16 v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Apple Vender KeyDown: code: %i",  -[VOTKeyInfo mediaKeyCode](self, "mediaKeyCode")));
  }

  else
  {
    if (-[AXEventRepresentation type](self->_eventRecord, "type") == 10)
    {
      id v5 = @"Key down";
    }

    else
    {
      unsigned int v6 = -[AXEventRepresentation type](self->_eventRecord, "type");
      id v5 = @"Flags changed";
      if (v6 == 11) {
        id v5 = @"Key up";
      }
    }

    char v11 = v5;
    unsigned int v10 = [v3 keyCode];
    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 modifiedInput]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v3 unmodifiedInput]);
    unsigned __int16 v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@: code: %u (MODIFIED: %@ : UNMODIFIED: %@), flags: %d, shift: %d, control: %d, option: %d, command: %d, fn: %d",  v11,  v10,  v7,  v8,  [v3 modifierState],  -[VOTKeyInfo isShiftKeyPressed](self, "isShiftKeyPressed"),  -[VOTKeyInfo isControlKeyPressed](self, "isControlKeyPressed"),  -[VOTKeyInfo isOptionKeyPressed](self, "isOptionKeyPressed"),  -[VOTKeyInfo isCommandKeyPressed](self, "isCommandKeyPressed"),  -[VOTKeyInfo isFNKeyPressed](self, "isFNKeyPressed")));
  }

  return v4;
}

- (AXEventRepresentation)eventRecord
{
  return self->_eventRecord;
}

- (void)setEventRecord:(id)a3
{
}

- (void)setCharacters:(id)a3
{
}

- (void)setOriginalCharacters:(id)a3
{
}

- (int64_t)eventOrigin
{
  return self->_eventOrigin;
}

- (void)setEventOrigin:(int64_t)a3
{
  self->_eventOrigin = a3;
}

- (unsigned)changedModifiers
{
  return self->_changedModifiers;
}

- (void)setChangedModifiers:(unsigned int)a3
{
  self->_changedModifiers = a3;
}

- (void).cxx_destruct
{
}

- (void)_setCommandKeyPressed:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[AXEventRepresentation keyInfo](self->_eventRecord, "keyInfo"));
  objc_msgSend(v4, "setModifierState:", objc_msgSend(v4, "modifierState") & 0xFFFFFFFE | v3);
}

@end