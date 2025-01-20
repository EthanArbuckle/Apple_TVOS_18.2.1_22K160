@interface MRDAutoConnectionControllerReason
+ (id)reasonWithType:(unint64_t)a3 string:(id)a4;
- (NSString)string;
- (id)description;
- (unint64_t)type;
- (void)setString:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation MRDAutoConnectionControllerReason

+ (id)reasonWithType:(unint64_t)a3 string:(id)a4
{
  id v5 = a4;
  v6 = objc_alloc_init(&OBJC_CLASS___MRDAutoConnectionControllerReason);
  -[MRDAutoConnectionControllerReason setType:](v6, "setType:", a3);
  -[MRDAutoConnectionControllerReason setString:](v6, "setString:", v5);

  return v6;
}

- (id)description
{
  unint64_t type = self->_type;
  if (type > 4) {
    v3 = @"endpointChanged";
  }
  else {
    v3 = off_1003A0590[type];
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<MRDAutoConnectionControllerReason %@ - %@>",  v3,  self->_string);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end