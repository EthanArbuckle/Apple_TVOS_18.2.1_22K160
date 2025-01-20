@interface PBKeyCommand
+ (id)presentSiriAccessibilityUI;
+ (id)toggleSystemApperance;
- (BOOL)isEqual:(id)a3;
- (PBKeyCommand)initWithKeyCode:(int64_t)a3 modifiers:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)keyCode;
- (int64_t)modifiers;
- (unint64_t)hash;
@end

@implementation PBKeyCommand

+ (id)toggleSystemApperance
{
  return [objc_alloc((Class)a1) initWithKeyCode:7 modifiers:1179648];
}

+ (id)presentSiriAccessibilityUI
{
  return [objc_alloc((Class)a1) initWithKeyCode:44 modifiers:0x100000];
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder"));
  id v4 = [v3 appendInteger:self->_keyCode];
  id v5 = [v3 appendInteger:self->_modifiers];
  id v6 = [v3 hash];

  return (unint64_t)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v4,  objc_opt_class(&OBJC_CLASS___PBKeyCommand));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  int64_t keyCode = self->_keyCode;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1001CE2EC;
  v19[3] = &unk_1003D4148;
  id v8 = v4;
  id v20 = v8;
  id v9 = [v6 appendInteger:keyCode counterpart:v19];
  int64_t modifiers = self->_modifiers;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  v16 = sub_1001CE304;
  v17 = &unk_1003D4148;
  id v18 = v8;
  id v11 = v8;
  id v12 = [v6 appendInteger:modifiers counterpart:&v14];
  LOBYTE(modifiers) = objc_msgSend(v6, "isEqual", v14, v15, v16, v17);

  return modifiers;
}

- (PBKeyCommand)initWithKeyCode:(int64_t)a3 modifiers:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBKeyCommand;
  result = -[PBKeyCommand init](&v7, "init");
  if (result)
  {
    result->_int64_t keyCode = a3;
    result->_int64_t modifiers = a4;
  }

  return result;
}

- (int64_t)keyCode
{
  return self->_keyCode;
}

- (int64_t)modifiers
{
  return self->_modifiers;
}

@end