@interface VOTOutputAction
- (BOOL)hasBeenDispatched;
- (BOOL)hasSameOutputAs:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVoiceOverGeneratedContent;
- (NSArray)outputEvents;
- (NSString)soundPath;
- (VOTOutputAction)initWithAXAction:(id)a3;
- (VOTOutputAction)initWithSoundPath:(id)a3;
- (VOTOutputAction)initWithString:(id)a3;
- (VOTOutputAction)initWithString:(id)a3 brailleString:(id)a4;
- (VOTOutputAction)initWithTextDisplay:(id)a3;
- (VOTOutputRequest)outputRequest;
- (id)_initWithComponent:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)component;
- (int)synchronization;
- (void)addOutputEvent:(id)a3;
- (void)setComponent:(int)a3;
- (void)setHasBeenDispatched:(BOOL)a3;
- (void)setIsVoiceOverGeneratedContent:(BOOL)a3;
- (void)setOutputRequest:(id)a3;
- (void)setSynchronization:(int)a3;
@end

@implementation VOTOutputAction

- (VOTOutputAction)initWithAXAction:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___VOTOutputAction;
  result = -[VOTOutputAction initWithAXAction:](&v4, "initWithAXAction:", a3);
  if (result) {
    result->_component = 0;
  }
  return result;
}

- (VOTOutputAction)initWithString:(id)a3
{
  return -[VOTOutputAction initWithString:brailleString:](self, "initWithString:brailleString:", a3, 0LL);
}

- (VOTOutputAction)initWithString:(id)a3 brailleString:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___VOTOutputAction;
  objc_super v4 = -[VOTOutputAction initWithString:brailleString:](&v7, "initWithString:brailleString:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_component = 0;
    -[VOTOutputAction setSynchronization:](v4, "setSynchronization:", 2LL);
  }

  return v5;
}

- (VOTOutputAction)initWithSoundPath:(id)a3
{
  id v4 = a3;
  v5 = -[VOTOutputAction _initWithComponent:](self, "_initWithComponent:", 1LL);
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    soundPath = v5->_soundPath;
    v5->_soundPath = v6;
  }

  return v5;
}

- (VOTOutputAction)initWithTextDisplay:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___VOTOutputAction;
  result = -[VOTOutputAction initWithString:](&v4, "initWithString:", a3);
  if (result) {
    result->_component = 2;
  }
  return result;
}

- (id)_initWithComponent:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___VOTOutputAction;
  id result = -[VOTOutputAction init](&v5, "init");
  if (result) {
    *((_DWORD *)result + 6) = a3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___VOTOutputAction;
  objc_super v4 = -[VOTOutputAction copyWithZone:](&v10, "copyWithZone:", a3);
  id v5 = -[NSString copy](self->_soundPath, "copy");
  v6 = (void *)v4[4];
  v4[4] = v5;

  *((_DWORD *)v4 + 5) = self->_synchronization;
  objc_msgSend( v4,  "setIsVoiceOverGeneratedContent:",  -[VOTOutputAction isVoiceOverGeneratedContent](self, "isVoiceOverGeneratedContent"));
  id v7 = -[NSMutableArray copy](self->_outputEvents, "copy");
  v8 = (void *)v4[1];
  v4[1] = v7;

  return v4;
}

- (BOOL)hasSameOutputAs:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputAction string](self, "string"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 string]);

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___VOTOutputAction;
  id v3 = -[VOTOutputAction description](&v7, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Component: %d Sound: %@",  v4,  self->_component,  self->_soundPath));

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___VOTOutputAction, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = [v4 outputActionID];
    BOOL v8 = v7 == -[VOTOutputAction outputActionID](self, "outputActionID");
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (NSArray)outputEvents
{
  return (NSArray *)self->_outputEvents;
}

- (void)addOutputEvent:(id)a3
{
  id v4 = a3;
  outputEvents = self->_outputEvents;
  id v8 = v4;
  if (!outputEvents)
  {
    uint64_t v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v7 = self->_outputEvents;
    self->_outputEvents = v6;

    id v4 = v8;
    outputEvents = self->_outputEvents;
  }

  -[NSMutableArray addObject:](outputEvents, "addObject:", v4);
}

- (NSString)soundPath
{
  return self->_soundPath;
}

- (BOOL)isVoiceOverGeneratedContent
{
  return self->_isVoiceOverGeneratedContent;
}

- (void)setIsVoiceOverGeneratedContent:(BOOL)a3
{
  self->_isVoiceOverGeneratedContent = a3;
}

- (BOOL)hasBeenDispatched
{
  return self->_hasBeenDispatched;
}

- (void)setHasBeenDispatched:(BOOL)a3
{
  self->_hasBeenDispatched = a3;
}

- (int)synchronization
{
  return self->_synchronization;
}

- (void)setSynchronization:(int)a3
{
  self->_synchronization = a3;
}

- (int)component
{
  return self->_component;
}

- (void)setComponent:(int)a3
{
  self->_component = a3;
}

- (VOTOutputRequest)outputRequest
{
  return (VOTOutputRequest *)objc_loadWeakRetained((id *)&self->_outputRequest);
}

- (void)setOutputRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end