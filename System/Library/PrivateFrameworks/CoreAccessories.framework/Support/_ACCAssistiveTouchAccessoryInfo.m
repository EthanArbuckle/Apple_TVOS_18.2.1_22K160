@interface _ACCAssistiveTouchAccessoryInfo
- (NSString)accessoryUID;
- (_ACCAssistiveTouchAccessoryInfo)initWithUID:(id)a3;
- (id)description;
- (void)dealloc;
@end

@implementation _ACCAssistiveTouchAccessoryInfo

- (_ACCAssistiveTouchAccessoryInfo)initWithUID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____ACCAssistiveTouchAccessoryInfo;
  v5 = -[_ACCAssistiveTouchAccessoryInfo init](&v9, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    accessoryUID = v5->_accessoryUID;
    v5->_accessoryUID = v6;
  }

  return v5;
}

- (void)dealloc
{
  accessoryUID = self->_accessoryUID;
  self->_accessoryUID = 0LL;

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____ACCAssistiveTouchAccessoryInfo;
  -[_ACCAssistiveTouchAccessoryInfo dealloc](&v4, "dealloc");
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<_ACCAssistiveTouchAccessoryInfo>[%@]",  self->_accessoryUID);
}

- (NSString)accessoryUID
{
  return self->_accessoryUID;
}

- (void).cxx_destruct
{
}

@end