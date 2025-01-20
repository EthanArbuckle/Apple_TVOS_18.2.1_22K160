@interface AKCommandMessage
- (AKCommandMessage)init;
- (NSObject)argument;
- (id)description;
- (unint64_t)command;
- (void)setArgument:(id)a3;
- (void)setCommand:(unint64_t)a3;
@end

@implementation AKCommandMessage

- (AKCommandMessage)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AKCommandMessage;
  v2 = -[_AKMessage init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2->super._properties,  "setObject:forKeyedSubscript:",  &off_1001D8CC8,  @"aktyp");
  }
  return v3;
}

- (unint64_t)command
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->super._properties,  "objectForKeyedSubscript:",  @"akcmd"));
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (void)setCommand:(unint64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super._properties,  "setObject:forKeyedSubscript:",  v4,  @"akcmd");
}

- (NSObject)argument
{
  return -[NSMutableDictionary objectForKeyedSubscript:]( self->super._properties,  "objectForKeyedSubscript:",  @"akarg");
}

- (void)setArgument:(id)a3
{
}

- (id)description
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[_AKMessage identifier](self, "identifier"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[AKCommandMessage command](self, "command")));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKCommandMessage argument](self, "argument"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\nAKCommandMessage <%p> {\nInternal ID: %@,\nCommand: %@,\nArgument: %@ }",  self,  v3,  v4,  v5));

  return v6;
}

@end