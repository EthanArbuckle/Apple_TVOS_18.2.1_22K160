@interface SQLiteTableColumn
- (NSString)name;
- (NSString)qualifiers;
- (id)SQL;
- (id)description;
- (void)setName:(id)a3;
- (void)setQualifiers:(id)a3;
@end

@implementation SQLiteTableColumn

- (id)SQL
{
  if (self->_qualifiers)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\"%@\"",  self->_name));
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  v3,  self->_qualifiers));
  }

  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\"%@\"",  self->_name));
  }

  return v4;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%@][%@]",  self->_name,  self->_qualifiers);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)qualifiers
{
  return self->_qualifiers;
}

- (void)setQualifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end