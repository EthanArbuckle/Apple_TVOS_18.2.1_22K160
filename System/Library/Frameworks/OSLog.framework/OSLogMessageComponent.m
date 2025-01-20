@interface OSLogMessageComponent
+ (BOOL)supportsSecureCoding;
- (NSData)argumentDataValue;
- (NSNumber)argumentNumberValue;
- (NSString)argumentStringValue;
- (NSString)formatSubstring;
- (NSString)placeholder;
- (OSLogMessageComponent)initWithCoder:(id)a3;
- (OSLogMessageComponent)initWithDecomposedMessage:(id)a3 atIndex:(unint64_t)a4;
- (OSLogMessageComponentArgumentCategory)argumentCategory;
- (double)argumentDoubleValue;
- (int64_t)argumentInt64Value;
- (uint64_t)argumentUInt64Value;
- (void)encodeWithCoder:(id)a3;
- (void)fillWithData:(id)a3;
- (void)fillWithScalar:(id)a3;
- (void)fillWithString:(id)a3;
- (void)setArgumentDataValue:(id)a3;
- (void)setArgumentNumberValue:(id)a3;
- (void)setArgumentStringValue:(id)a3;
- (void)setFormatSubstring:(id)a3;
- (void)setPlaceholder:(id)a3;
@end

@implementation OSLogMessageComponent

- (OSLogMessageComponent)initWithDecomposedMessage:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___OSLogMessageComponent;
  v7 = -[OSLogMessageComponent init](&v20, sel_init);
  if (v7)
  {
    uint64_t v8 = [v6 literalPrefixAtIndex:a4];
    v9 = (void *)v8;
    if (v8) {
      v10 = (const __CFString *)v8;
    }
    else {
      v10 = &stru_189F1E320;
    }
    -[OSLogMessageComponent setFormatSubstring:](v7, "setFormatSubstring:", v10);

    [v6 placeholderAtIndex:a4];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 rawString];
    v13 = (void *)v12;
    if (v12) {
      v14 = (const __CFString *)v12;
    }
    else {
      v14 = &stru_189F1E320;
    }
    -[OSLogMessageComponent setPlaceholder:](v7, "setPlaceholder:", v14);

    if (v11)
    {
      [v6 argumentAtIndex:a4];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15 && ![v15 availability])
      {
        uint64_t v19 = [v16 category];
        switch(v19)
        {
          case 3LL:
            -[OSLogMessageComponent fillWithData:](v7, "fillWithData:", v16);
            break;
          case 2LL:
            -[OSLogMessageComponent fillWithString:](v7, "fillWithString:", v16);
            break;
          case 1LL:
            -[OSLogMessageComponent fillWithScalar:](v7, "fillWithScalar:", v16);
            break;
        }
      }
    }

    v17 = v7;
  }

  return v7;
}

- (void)fillWithScalar:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [v8 scalarCategory];
  if (v4 == 3)
  {
    self->_argumentCategory = 2LL;
    [v8 doubleValue];
    v5 = v8;
    self->_argumentDoubleValue = v6;
  }

  else
  {
    if (v4 == 2)
    {
      self->_argumentCategory = 3LL;
      self->_argumentInt64Value = [v8 int64Value];
    }

    else if (v4 == 1)
    {
      self->_argumentCategory = 5LL;
      self->_argumentUInt64Value = [v8 unsignedInt64Value];
    }

    else
    {
      self->_argumentCategory = 0LL;
    }

    v5 = v8;
  }

  [v5 objectRepresentation];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[OSLogMessageComponent setArgumentNumberValue:](self, "setArgumentNumberValue:", v7);
}

- (void)fillWithString:(id)a3
{
  self->_argumentCategory = 4LL;
  [a3 objectRepresentation];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[OSLogMessageComponent setArgumentStringValue:](self, "setArgumentStringValue:", v4);
}

- (void)fillWithData:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self->_argumentCategory = 4LL;
    -[OSLogMessageComponent setArgumentStringValue:](self, "setArgumentStringValue:", v4);
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      self->_argumentCategory = 1LL;
      -[OSLogMessageComponent setArgumentDataValue:](self, "setArgumentDataValue:", v4);
    }

    else
    {
      self->_argumentCategory = 0LL;
    }
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  -[OSLogMessageComponent formatSubstring](self, "formatSubstring");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 encodeObject:v4 forKey:@"formatSubstring"];
  v5 = -[OSLogMessageComponent placeholder](self, "placeholder");
  [v8 encodeObject:v5 forKey:@"placeholder"];

  objc_msgSend( v8,  "encodeInteger:forKey:",  -[OSLogMessageComponent argumentCategory](self, "argumentCategory"),  @"argumentCategory");
  switch(-[OSLogMessageComponent argumentCategory](self, "argumentCategory"))
  {
    case OSLogMessageComponentArgumentCategoryData:
      -[OSLogMessageComponent argumentDataValue](self, "argumentDataValue");
      double v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = @"argumentDataValue";
      goto LABEL_7;
    case OSLogMessageComponentArgumentCategoryDouble:
      -[OSLogMessageComponent argumentDoubleValue](self, "argumentDoubleValue");
      objc_msgSend(v8, "encodeDouble:forKey:", @"argumentDoubleValue");
      break;
    case OSLogMessageComponentArgumentCategoryInt64:
      objc_msgSend( v8,  "encodeInt64:forKey:",  -[OSLogMessageComponent argumentInt64Value](self, "argumentInt64Value"),  @"argumentInt64Value");
      break;
    case OSLogMessageComponentArgumentCategoryString:
      -[OSLogMessageComponent argumentStringValue](self, "argumentStringValue");
      double v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = @"argumentStringValue";
      goto LABEL_7;
    case OSLogMessageComponentArgumentCategoryUInt64:
      objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[OSLogMessageComponent argumentUInt64Value](self, "argumentUInt64Value"));
      double v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = @"argumentUInt64Value";
LABEL_7:
      [v8 encodeObject:v6 forKey:v7];

      break;
    default:
      break;
  }
}

- (OSLogMessageComponent)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"formatSubstring"];
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  formatSubstring = self->_formatSubstring;
  self->_formatSubstring = v5;

  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placeholder"];
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  placeholder = self->_placeholder;
  self->_placeholder = v7;

  int64_t v9 = [v4 decodeIntegerForKey:@"argumentCategory"];
  self->_argumentCategory = v9;
  switch(v9)
  {
    case 1LL:
      [v4 decodeObjectOfClass:objc_opt_class() forKey:@"argumentDataValue"];
      v10 = (NSData *)objc_claimAutoreleasedReturnValue();
      argumentDataValue = self->_argumentDataValue;
      self->_argumentDataValue = v10;
      goto LABEL_8;
    case 2LL:
      [v4 decodeDoubleForKey:@"argumentDoubleValue"];
      self->_argumentDoubleValue = v12;
      objc_msgSend(MEMORY[0x189607968], "numberWithDouble:");
      v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3LL:
      int64_t v14 = [v4 decodeInt64ForKey:@"argumentInt64Value"];
      self->_argumentInt64Value = v14;
      [MEMORY[0x189607968] numberWithLongLong:v14];
      v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 4LL:
      [v4 decodeObjectOfClass:objc_opt_class() forKey:@"argumentStringValue"];
      v15 = (NSString *)objc_claimAutoreleasedReturnValue();
      argumentDataValue = self->_argumentStringValue;
      self->_argumentStringValue = v15;
      goto LABEL_8;
    case 5LL:
      [v4 decodeObjectOfClass:objc_opt_class() forKey:@"argumentUInt64Value"];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      self->_argumentUInt64Value = [v16 unsignedLongLongValue];

      [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_argumentUInt64Value];
      v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      argumentDataValue = self->_argumentNumberValue;
      self->_argumentNumberValue = v13;
LABEL_8:

      break;
    default:
      break;
  }

  return self;
}

- (NSString)formatSubstring
{
  return self->_formatSubstring;
}

- (void)setFormatSubstring:(id)a3
{
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(id)a3
{
}

- (OSLogMessageComponentArgumentCategory)argumentCategory
{
  return self->_argumentCategory;
}

- (NSData)argumentDataValue
{
  return self->_argumentDataValue;
}

- (void)setArgumentDataValue:(id)a3
{
}

- (double)argumentDoubleValue
{
  return self->_argumentDoubleValue;
}

- (int64_t)argumentInt64Value
{
  return self->_argumentInt64Value;
}

- (NSNumber)argumentNumberValue
{
  return self->_argumentNumberValue;
}

- (void)setArgumentNumberValue:(id)a3
{
}

- (NSString)argumentStringValue
{
  return self->_argumentStringValue;
}

- (void)setArgumentStringValue:(id)a3
{
}

- (uint64_t)argumentUInt64Value
{
  return self->_argumentUInt64Value;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end