@interface MBException
- (MBException)initWithCode:(int)a3 format:(id)a4;
- (MBException)initWithCode:(int)a3 format:(id)a4 args:(char *)a5;
- (id)error;
- (int)errorCode;
@end

@implementation MBException

- (MBException)initWithCode:(int)a3 format:(id)a4
{
  return -[MBException initWithCode:format:args:](self, "initWithCode:format:args:", *(void *)&a3, a4, &v5);
}

- (MBException)initWithCode:(int)a3 format:(id)a4 args:(char *)a5
{
  uint64_t v5 = *(void *)&a3;
  v7 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", a4, a5);
  v10 = @"MBErrorCode";
  v11 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MBException;
  return -[MBException initWithName:reason:userInfo:]( &v9,  "initWithName:reason:userInfo:",  @"MBException",  v7,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
}

- (int)errorCode
{
  return objc_msgSend( objc_msgSend( -[MBException userInfo](self, "userInfo"),  "objectForKeyedSubscript:",  @"MBErrorCode"),  "intValue");
}

- (id)error
{
  return +[MBError errorWithCode:format:]( &OBJC_CLASS___MBError,  "errorWithCode:format:",  -[MBException errorCode](self, "errorCode"),  @"%@",  -[MBException reason](self, "reason"));
}

@end