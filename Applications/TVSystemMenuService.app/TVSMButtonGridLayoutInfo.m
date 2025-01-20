@interface TVSMButtonGridLayoutInfo
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (TVSMButtonGridLayoutInfo)initWithIdentifier:(id)a3 style:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)style;
- (unint64_t)hash;
@end

@implementation TVSMButtonGridLayoutInfo

- (TVSMButtonGridLayoutInfo)initWithIdentifier:(id)a3 style:(int64_t)a4
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  int64_t v12 = a4;
  v4 = v14;
  v14 = 0LL;
  v11.receiver = v4;
  v11.super_class = (Class)&OBJC_CLASS___TVSMButtonGridLayoutInfo;
  v10 = -[TVSMButtonGridLayoutInfo init](&v11, "init");
  v14 = v10;
  objc_storeStrong((id *)&v14, v10);
  if (v10)
  {
    v5 = (NSString *)[location[0] copy];
    identifier = v14->_identifier;
    v14->_identifier = v5;

    v14->_style = v12;
  }

  v8 = v14;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v14, 0LL);
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class(self));
  v5 = -[TVSMButtonGridLayoutInfo identifier](self, "identifier");
  id v6 = objc_msgSend(v4, "initWithIdentifier:style:", v5, -[TVSMButtonGridLayoutInfo style](self, "style"));

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (location[0] == v13)
  {
    char v14 = 1;
  }

  else
  {
    id v8 = location[0];
    uint64_t v3 = objc_opt_class(v13);
    char v10 = 0;
    unsigned __int8 v9 = 0;
    if ((objc_opt_isKindOfClass(v8, v3) & 1) != 0)
    {
      identifier = v13->_identifier;
      id v11 = [location[0] identifier];
      char v10 = 1;
      unsigned __int8 v9 = -[NSString isEqual:](identifier, "isEqual:");
    }

    if ((v10 & 1) != 0) {

    }
    BOOL v6 = 0;
    if ((v9 & 1) != 0)
    {
      id style = (id)v13->_style;
      BOOL v6 = style == [location[0] style];
    }

    char v14 = v6;
  }

  objc_storeStrong(location, 0LL);
  return v14 & 1;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash", a2) ^ (100 * (self->_style + 5));
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
}

@end