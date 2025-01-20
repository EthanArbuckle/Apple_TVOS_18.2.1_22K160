@interface VOTCustomAction
- (BOOL)ignoreWhenVoiceOverTouches;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValidForContext:(id)a3;
- (BOOL)performWithContext:(id)a3;
- (BOOL)requiresIconClassificationForLabel;
- (CGPoint)activationPoint;
- (CGRect)iconClassificationFrame;
- (NSString)categoryName;
- (NSString)identifier;
- (NSString)language;
- (NSString)name;
- (VOTCustomAction)initWithWireDictionary:(id)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)sortPriority;
- (void)setCategoryName:(id)a3;
- (void)setSortPriority:(unint64_t)a3;
@end

@implementation VOTCustomAction

- (VOTCustomAction)initWithWireDictionary:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___VOTCustomAction;
  v5 = -[VOTCustomAction init](&v41, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"CustomActionName"]);
    v7 = (NSString *)[v6 copy];
    name = v5->_name;
    v5->_name = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"CustomActionLanguage"]);
    v10 = (NSString *)[v9 copy];
    language = v5->_language;
    v5->_language = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"CustomActionIdentifier"]);
    v13 = (NSString *)[v12 copy];
    identifier = v5->_identifier;
    v5->_identifier = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"CustomActionIgnoreWhenVoiceOverTouches"]);
    v5->_ignoreWhenVoiceOverTouches = [v15 BOOLValue];

    v16 = (const __AXValue *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"CustomActionActivationPoint"]);
    if (v16)
    {
      CFTypeID TypeID = AXValueGetTypeID();
      if (TypeID == CFGetTypeID(v16))
      {
        AXValueGetValue(v16, kAXValueTypeCGPoint, &v5->_activationPoint);
      }

      else
      {
        objc_opt_class(&OBJC_CLASS___NSValue, v18);
        if ((objc_opt_isKindOfClass(v16, v19) & 1) != 0)
        {
          char v40 = 0;
          uint64_t v20 = __UIAccessibilitySafeClass(@"NSValue", v16, 1LL, &v40);
          v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          if (v40) {
            goto LABEL_13;
          }
          v22 = v21;
          [v21 pointValue];
          v5->_activationPoint.x = v23;
          v5->_activationPoint.y = v24;
        }
      }
    }

    char v40 = 0;
    v25 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"CustomActionIconClassificationScreenFrame"]);
    uint64_t v26 = __UIAccessibilitySafeClass(@"NSValue", v25, 1LL, &v40);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

    if (!v40)
    {
      [v27 rectValue];
      v5->_iconClassificationFrame.origin.x = v28;
      v5->_iconClassificationFrame.origin.y = v29;
      v5->_iconClassificationFrame.size.width = v30;
      v5->_iconClassificationFrame.size.height = v31;

      char v40 = 0;
      v32 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"CustomActionRequiresIconClassification"]);
      uint64_t v33 = __UIAccessibilitySafeClass(@"NSNumber", v32, 1LL, &v40);
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);

      if (!v40)
      {
        v5->_requiresIconClassificationForLabel = [v34 BOOLValue];

        v35 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"CustomActionCategoryName"]);
        -[VOTCustomAction setCategoryName:](v5, "setCategoryName:", v35);

        char v40 = 0;
        v36 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"CustomActionSortPriority"]);
        uint64_t v37 = __UIAccessibilitySafeClass(@"NSNumber", v36, 1LL, &v40);
        v38 = (void *)objc_claimAutoreleasedReturnValue(v37);

        if (!v40)
        {
          -[VOTCustomAction setSortPriority:](v5, "setSortPriority:", [v38 unsignedIntegerValue]);

          goto LABEL_12;
        }
      }
    }

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  *(void *)&double v6 = objc_opt_class(&OBJC_CLASS___VOTCustomAction, v5).n128_u64[0];
  BOOL v8 = objc_msgSend(v4, "isMemberOfClass:", v7, v6)
    && -[NSString isEqual:](self->_name, "isEqual:", *((void *)v4 + 1))

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_name, "hash");
  unint64_t v4 = -[NSString hash](self->_identifier, "hash") ^ v3;
  BOOL ignoreWhenVoiceOverTouches = self->_ignoreWhenVoiceOverTouches;
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTCustomAction categoryName](self, "categoryName"));
  unint64_t v7 = v4 ^ ignoreWhenVoiceOverTouches ^ (unint64_t)[v6 hash];

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)ignoreWhenVoiceOverTouches
{
  return self->_ignoreWhenVoiceOverTouches;
}

- (BOOL)performWithContext:(id)a3
{
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 actionElement]);
  LOBYTE(self) = [v4 performCustomActionWithIdentifier:self->_identifier];

  return (char)self;
}

- (BOOL)isValidForContext:(id)a3
{
  return 1;
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___VOTCustomAction;
  id v3 = -[VOTCustomAction description](&v11, "description");
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTCustomAction name](self, "name"));
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[VOTCustomAction categoryName](self, "categoryName"));
  unint64_t v7 = (void *)v6;
  BOOL v8 = &stru_10017A920;
  if (v6) {
    BOOL v8 = (const __CFString *)v6;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@, %@:%@",  v4,  v5,  v8));

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)categoryName
{
  return self->_categoryName;
}

- (void)setCategoryName:(id)a3
{
}

- (CGPoint)activationPoint
{
  double x = self->_activationPoint.x;
  double y = self->_activationPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGRect)iconClassificationFrame
{
  double x = self->_iconClassificationFrame.origin.x;
  double y = self->_iconClassificationFrame.origin.y;
  double width = self->_iconClassificationFrame.size.width;
  double height = self->_iconClassificationFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)requiresIconClassificationForLabel
{
  return self->_requiresIconClassificationForLabel;
}

- (NSString)language
{
  return self->_language;
}

- (unint64_t)sortPriority
{
  return self->_sortPriority;
}

- (void)setSortPriority:(unint64_t)a3
{
  self->_sortPrioritdouble y = a3;
}

- (void).cxx_destruct
{
}

@end