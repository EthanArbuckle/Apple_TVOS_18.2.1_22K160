@interface AKReplyMessage
- (AKReplyMessage)init;
- (BOOL)didSucceed;
- (NSData)returnData;
- (NSError)error;
- (NSString)replyToID;
- (id)description;
- (void)setDidSucceed:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setReplyToID:(id)a3;
- (void)setReturnData:(id)a3;
@end

@implementation AKReplyMessage

- (AKReplyMessage)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AKReplyMessage;
  v2 = -[_AKMessage init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2->super._properties,  "setObject:forKeyedSubscript:",  &off_1001D8CE0,  @"aktyp");
  }
  return v3;
}

- (NSString)replyToID
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:]( self->super._properties,  "objectForKeyedSubscript:",  @"akrid");
}

- (void)setReplyToID:(id)a3
{
}

- (BOOL)didSucceed
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->super._properties,  "objectForKeyedSubscript:",  @"aksuc"));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setDidSucceed:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super._properties,  "setObject:forKeyedSubscript:",  v4,  @"aksuc");
}

- (NSError)error
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->super._properties,  "objectForKeyedSubscript:",  @"akerd"));
  if (v3)
  {
    id v4 = +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", objc_opt_class(&OBJC_CLASS___NSError, v2));
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "_strictlyUnarchivedObjectOfClasses:fromData:error:",  v5,  v3,  0LL));
  }

  else
  {
    v6 = 0LL;
  }

  return (NSError *)v6;
}

- (void)setError:(id)a3
{
  if (a3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "ac_secureCodingError"));
    id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  1LL,  0LL));

    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->super._properties,  "setObject:forKeyedSubscript:",  v5,  @"akerd");
  }

  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->super._properties, "removeObjectForKey:", @"akerd");
  }

- (NSData)returnData
{
  return (NSData *)-[NSMutableDictionary objectForKeyedSubscript:]( self->super._properties,  "objectForKeyedSubscript:",  @"akret");
}

- (void)setReturnData:(id)a3
{
  properties = self->super._properties;
  if (a3) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](properties, "setObject:forKeyedSubscript:", a3, @"akret");
  }
  else {
    -[NSMutableDictionary removeObjectForKey:](properties, "removeObjectForKey:", @"akret");
  }
}

- (id)description
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->super._properties,  "objectForKeyedSubscript:",  @"akret"));
  id v4 = v3;
  if (v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 length]));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSData <%@ bytes>",  v5));
  }

  else
  {
    v6 = @"(none)";
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_AKMessage identifier](self, "identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKReplyMessage replyToID](self, "replyToID"));
  if (-[AKReplyMessage didSucceed](self, "didSucceed")) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AKReplyMessage error](self, "error"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\nAKReplyMessage <%p> {\nInternal ID: %@,\nReply-To: %@,\nSuccess: %@,\nError: %@,\nRD: %@ }",  self,  v7,  v8,  v9,  v10,  v6));

  return v11;
}

@end