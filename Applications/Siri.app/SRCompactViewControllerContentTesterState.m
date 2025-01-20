@interface SRCompactViewControllerContentTesterState
- (BOOL)compactViewHasContent;
- (BOOL)contextMenuIsPresented;
- (BOOL)deviceIsPad;
- (BOOL)editableUtteranceViewHasContent;
- (BOOL)keyboardHasContent;
- (BOOL)multiLevelViewHasContent;
- (BOOL)navigationBarHasContent;
- (BOOL)navigationStackIsPopping;
- (BOOL)siriViewControllerIsEditing;
- (SRCompactViewControllerContentTesterState)initWithDeviceIsPad:(BOOL)a3 navigationStackIsPopping:(BOOL)a4 navigationStackSize:(int64_t)a5 navigationBarHasContent:(BOOL)a6 multiLevelViewHasContent:(BOOL)a7 editableUtteranceViewHasContent:(BOOL)a8 compactViewHasContent:(BOOL)a9 siriViewControllerIsEditing:(BOOL)a10 keyboardHasContent:(BOOL)a11 contextMenuIsPresented:(BOOL)a12;
- (id)_debugDescriptionForProperty:(id)a3 BOOLValue:(BOOL)a4;
- (id)_debugDescriptionForProperty:(id)a3 formattedValue:(id)a4;
- (id)_debugDescriptionForProperty:(id)a3 integerValue:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (int64_t)navigationStackSize;
@end

@implementation SRCompactViewControllerContentTesterState

- (SRCompactViewControllerContentTesterState)initWithDeviceIsPad:(BOOL)a3 navigationStackIsPopping:(BOOL)a4 navigationStackSize:(int64_t)a5 navigationBarHasContent:(BOOL)a6 multiLevelViewHasContent:(BOOL)a7 editableUtteranceViewHasContent:(BOOL)a8 compactViewHasContent:(BOOL)a9 siriViewControllerIsEditing:(BOOL)a10 keyboardHasContent:(BOOL)a11 contextMenuIsPresented:(BOOL)a12
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___SRCompactViewControllerContentTesterState;
  result = -[SRCompactViewControllerContentTesterState init](&v19, "init");
  if (result)
  {
    result->_deviceIsPad = a3;
    result->_navigationStackIsPopping = a4;
    result->_navigationStackSize = a5;
    result->_navigationBarHasContent = a6;
    result->_multiLevelViewHasContent = a7;
    result->_editableUtteranceViewHasContent = a8;
    result->_compactViewHasContent = a9;
    result->_siriViewControllerIsEditing = a10;
    result->_keyboardHasContent = a11;
    result->_contextMenuIsPresented = a12;
  }

  return result;
}

- (id)_debugDescriptionForProperty:(id)a3 formattedValue:(id)a4
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@=%@", a3, a4);
}

- (id)_debugDescriptionForProperty:(id)a3 BOOLValue:(BOOL)a4
{
  if (a4) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  return -[SRCompactViewControllerContentTesterState _debugDescriptionForProperty:formattedValue:]( self,  "_debugDescriptionForProperty:formattedValue:",  a3,  v4);
}

- (id)_debugDescriptionForProperty:(id)a3 integerValue:(int64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%zd", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[SRCompactViewControllerContentTesterState _debugDescriptionForProperty:formattedValue:]( self,  "_debugDescriptionForProperty:formattedValue:",  v6,  v7));

  return v8;
}

- (id)debugDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", @"<"));
  *(void *)&double v5 = objc_opt_class(self, v4).n128_u64[0];
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description", v5));
  [v3 appendString:v7];

  v26 = (void *)objc_claimAutoreleasedReturnValue( -[SRCompactViewControllerContentTesterState _debugDescriptionForProperty:BOOLValue:]( self,  "_debugDescriptionForProperty:BOOLValue:",  @"deviceIsPad",  -[SRCompactViewControllerContentTesterState deviceIsPad](self, "deviceIsPad")));
  v32[0] = v26;
  v25 = (void *)objc_claimAutoreleasedReturnValue( -[SRCompactViewControllerContentTesterState _debugDescriptionForProperty:BOOLValue:]( self,  "_debugDescriptionForProperty:BOOLValue:",  @"navigationStackIsPopping",  -[SRCompactViewControllerContentTesterState deviceIsPad](self, "deviceIsPad")));
  v32[1] = v25;
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[SRCompactViewControllerContentTesterState _debugDescriptionForProperty:integerValue:]( self,  "_debugDescriptionForProperty:integerValue:",  @"navigationStackSize",  -[SRCompactViewControllerContentTesterState navigationStackSize](self, "navigationStackSize")));
  v32[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[SRCompactViewControllerContentTesterState _debugDescriptionForProperty:BOOLValue:]( self,  "_debugDescriptionForProperty:BOOLValue:",  @"navigationBarHasContent",  -[SRCompactViewControllerContentTesterState navigationBarHasContent](self, "navigationBarHasContent")));
  v32[3] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue( -[SRCompactViewControllerContentTesterState _debugDescriptionForProperty:BOOLValue:]( self,  "_debugDescriptionForProperty:BOOLValue:",  @"multiLevelViewHasContent",  -[SRCompactViewControllerContentTesterState multiLevelViewHasContent]( self,  "multiLevelViewHasContent")));
  v32[4] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue( -[SRCompactViewControllerContentTesterState _debugDescriptionForProperty:BOOLValue:]( self,  "_debugDescriptionForProperty:BOOLValue:",  @"editableUtteranceViewHasContent",  -[SRCompactViewControllerContentTesterState editableUtteranceViewHasContent]( self,  "editableUtteranceViewHasContent")));
  v32[5] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue( -[SRCompactViewControllerContentTesterState _debugDescriptionForProperty:BOOLValue:]( self,  "_debugDescriptionForProperty:BOOLValue:",  @"compactViewHasContent",  -[SRCompactViewControllerContentTesterState compactViewHasContent](self, "compactViewHasContent")));
  v32[6] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue( -[SRCompactViewControllerContentTesterState _debugDescriptionForProperty:BOOLValue:]( self,  "_debugDescriptionForProperty:BOOLValue:",  @"siriViewControllerIsEditing",  -[SRCompactViewControllerContentTesterState siriViewControllerIsEditing]( self,  "siriViewControllerIsEditing")));
  v32[7] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue( -[SRCompactViewControllerContentTesterState _debugDescriptionForProperty:BOOLValue:]( self,  "_debugDescriptionForProperty:BOOLValue:",  @"keyboardHasContent",  -[SRCompactViewControllerContentTesterState keyboardHasContent](self, "keyboardHasContent")));
  v32[8] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue( -[SRCompactViewControllerContentTesterState _debugDescriptionForProperty:BOOLValue:]( self,  "_debugDescriptionForProperty:BOOLValue:",  @"contextMenuIsPresented",  -[SRCompactViewControllerContentTesterState contextMenuIsPresented](self, "contextMenuIsPresented")));
  v32[9] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 10LL));

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v17 = v16;
  id v18 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v28;
    do
    {
      v21 = 0LL;
      do
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)v21);
        [v3 appendString:@"\n\t"];
        [v3 appendString:v22];
        v21 = (char *)v21 + 1;
      }

      while (v19 != v21);
      id v19 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }

    while (v19);
  }

  [v3 appendString:@"\n>"];
  id v23 = [v3 mutableCopy];

  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v15 = objc_alloc(&OBJC_CLASS___SRCompactViewControllerContentTesterState);
  BOOL v4 = -[SRCompactViewControllerContentTesterState deviceIsPad](self, "deviceIsPad");
  BOOL v5 = -[SRCompactViewControllerContentTesterState navigationStackIsPopping](self, "navigationStackIsPopping");
  int64_t v6 = -[SRCompactViewControllerContentTesterState navigationStackSize](self, "navigationStackSize");
  BOOL v7 = -[SRCompactViewControllerContentTesterState navigationBarHasContent](self, "navigationBarHasContent");
  BOOL v8 = -[SRCompactViewControllerContentTesterState multiLevelViewHasContent](self, "multiLevelViewHasContent");
  BOOL v9 = -[SRCompactViewControllerContentTesterState editableUtteranceViewHasContent]( self,  "editableUtteranceViewHasContent");
  unsigned __int8 v10 = -[SRCompactViewControllerContentTesterState compactViewHasContent](self, "compactViewHasContent");
  unsigned __int8 v11 = -[SRCompactViewControllerContentTesterState siriViewControllerIsEditing](self, "siriViewControllerIsEditing");
  unsigned __int8 v12 = -[SRCompactViewControllerContentTesterState keyboardHasContent](self, "keyboardHasContent");
  BYTE3(v14) = -[SRCompactViewControllerContentTesterState contextMenuIsPresented](self, "contextMenuIsPresented");
  BYTE2(v14) = v12;
  BYTE1(v14) = v11;
  LOBYTE(v14) = v10;
  return -[SRCompactViewControllerContentTesterState initWithDeviceIsPad:navigationStackIsPopping:navigationStackSize:navigationBarHasContent:multiLevelViewHasContent:editableUtteranceViewHasContent:compactViewHasContent:siriViewControllerIsEditing:keyboardHasContent:contextMenuIsPresented:]( v15,  "initWithDeviceIsPad:navigationStackIsPopping:navigationStackSize:navigationBarHasContent:multiLevelViewHasCon tent:editableUtteranceViewHasContent:compactViewHasContent:siriViewControllerIsEditing:keyboardHasContent:con textMenuIsPresented:",  v4,  v5,  v6,  v7,  v8,  v9,  v14);
}

- (BOOL)deviceIsPad
{
  return self->_deviceIsPad;
}

- (BOOL)navigationStackIsPopping
{
  return self->_navigationStackIsPopping;
}

- (int64_t)navigationStackSize
{
  return self->_navigationStackSize;
}

- (BOOL)navigationBarHasContent
{
  return self->_navigationBarHasContent;
}

- (BOOL)multiLevelViewHasContent
{
  return self->_multiLevelViewHasContent;
}

- (BOOL)editableUtteranceViewHasContent
{
  return self->_editableUtteranceViewHasContent;
}

- (BOOL)compactViewHasContent
{
  return self->_compactViewHasContent;
}

- (BOOL)siriViewControllerIsEditing
{
  return self->_siriViewControllerIsEditing;
}

- (BOOL)keyboardHasContent
{
  return self->_keyboardHasContent;
}

- (BOOL)contextMenuIsPresented
{
  return self->_contextMenuIsPresented;
}

@end