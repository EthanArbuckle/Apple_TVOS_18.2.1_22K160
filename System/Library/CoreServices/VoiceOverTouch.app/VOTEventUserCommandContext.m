@interface VOTEventUserCommandContext
+ (VOTEventUserCommandContext)contextWithCommand:(id)a3 gesture:(id)a4 keyChord:(id)a5 resolver:(id)a6;
- (AXSSKeyChord)keyChord;
- (VOSCommand)command;
- (VOSCommandResolver)resolver;
- (VOSGesture)gesture;
- (void)setCommand:(id)a3;
- (void)setGesture:(id)a3;
- (void)setKeyChord:(id)a3;
- (void)setResolver:(id)a3;
@end

@implementation VOTEventUserCommandContext

+ (VOTEventUserCommandContext)contextWithCommand:(id)a3 gesture:(id)a4 keyChord:(id)a5 resolver:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_alloc_init(&OBJC_CLASS___VOTEventUserCommandContext);
  -[VOTEventUserCommandContext setCommand:](v13, "setCommand:", v12);

  -[VOTEventUserCommandContext setGesture:](v13, "setGesture:", v11);
  -[VOTEventUserCommandContext setKeyChord:](v13, "setKeyChord:", v10);

  -[VOTEventUserCommandContext setResolver:](v13, "setResolver:", v9);
  return v13;
}

- (VOSCommand)command
{
  return self->_command;
}

- (void)setCommand:(id)a3
{
}

- (VOSGesture)gesture
{
  return self->_gesture;
}

- (void)setGesture:(id)a3
{
}

- (AXSSKeyChord)keyChord
{
  return self->_keyChord;
}

- (void)setKeyChord:(id)a3
{
}

- (VOSCommandResolver)resolver
{
  return self->_resolver;
}

- (void)setResolver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end