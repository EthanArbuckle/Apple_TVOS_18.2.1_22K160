@interface ESUserDataContactWord
- (BOOL)isEqual:(id)a3;
- (ESUserDataContactWord)initWithComponents:(id)a3 frequency:(int)a4;
- (NSDictionary)components;
- (int)frequency;
- (unint64_t)hash;
@end

@implementation ESUserDataContactWord

- (ESUserDataContactWord)initWithComponents:(id)a3 frequency:(int)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ESUserDataContactWord;
  id v5 = a3;
  v6 = -[ESUserDataContactWord init](&v10, "init");
  v7 = (NSDictionary *)objc_msgSend(v5, "copy", v10.receiver, v10.super_class);

  components = v6->_components;
  v6->_components = v7;

  v6->_frequency = a4;
  return v6;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ESUserDataContactWord components](self, "components"));
  unint64_t v4 = (unint64_t)[v3 hash];
  unint64_t v5 = v4 ^ -[ESUserDataContactWord frequency](self, "frequency");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (ESUserDataContactWord *)a3;
  if (v4 == self)
  {
    unsigned __int8 v10 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ESUserDataContactWord);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      unsigned int v7 = -[ESUserDataContactWord frequency](self, "frequency");
      if (v7 == -[ESUserDataContactWord frequency](v6, "frequency"))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[ESUserDataContactWord components](self, "components"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[ESUserDataContactWord components](v6, "components"));
        unsigned __int8 v10 = [v8 isEqual:v9];
      }

      else
      {
        unsigned __int8 v10 = 0;
      }
    }

    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  return v10;
}

- (NSDictionary)components
{
  return self->_components;
}

- (int)frequency
{
  return self->_frequency;
}

- (void).cxx_destruct
{
}

@end