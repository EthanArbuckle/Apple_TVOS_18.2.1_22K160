@interface CLIOption
+ (void)registerOptionWithShortName:(id)a3 longName:(id)a4 parameterCount:(unint64_t)a5 shortDescription:(id)a6 longDescription:(id)a7;
- (BOOL)isEqual:(id)a3;
- (NSString)longEnglishDescription;
- (NSString)longName;
- (NSString)shortEnglishDescription;
- (NSString)shortName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)nameSummaryString;
- (unint64_t)hash;
- (unint64_t)parameterCount;
- (void)_finalize;
- (void)register;
- (void)setLongEnglishDescription:(id)a3;
- (void)setLongName:(id)a3;
- (void)setParameterCount:(unint64_t)a3;
- (void)setShortEnglishDescription:(id)a3;
- (void)setShortName:(id)a3;
@end

@implementation CLIOption

- (void)_finalize
{
  v4 = (NSString *)objc_claimAutoreleasedReturnValue(-[CLIOption shortName](self, "shortName"));
  longName = v4;
  if (!v4) {
    longName = self->_longName;
  }
  objc_storeStrong((id *)&self->_canonicalName, longName);

  if (!self->_canonicalName)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v6 handleFailureInMethod:a2 object:self file:@"CLIOptionParsing.m" lineNumber:192 description:@"Argument name is missing."];
  }

- (void)register
{
  if (qword_100025418 != -1) {
    dispatch_once(&qword_100025418, &stru_10001C850);
  }
  [(id)qword_100025408 _registerOption:self];
}

+ (void)registerOptionWithShortName:(id)a3 longName:(id)a4 parameterCount:(unint64_t)a5 shortDescription:(id)a6 longDescription:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = objc_opt_new(&OBJC_CLASS___CLIOption);
  -[CLIOption setShortName:](v15, "setShortName:", v14);

  -[CLIOption setLongName:](v15, "setLongName:", v13);
  -[CLIOption setParameterCount:](v15, "setParameterCount:", a5);
  -[CLIOption setShortEnglishDescription:](v15, "setShortEnglishDescription:", v12);

  -[CLIOption setLongEnglishDescription:](v15, "setLongEnglishDescription:", v11);
  -[CLIOption register](v15, "register");
}

- (BOOL)isEqual:(id)a3
{
  return -[NSString isEqual:](self->_canonicalName, "isEqual:", *((void *)a3 + 1));
}

- (unint64_t)hash
{
  canonicalName = self->_canonicalName;
  if (!canonicalName)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v6 handleFailureInMethod:a2, self, @"CLIOptionParsing.m", 220, @"Invalid parameter not satisfying: %@", @"_canonicalName" object file lineNumber description];

    canonicalName = self->_canonicalName;
  }

  return -[NSString hash](canonicalName, "hash");
}

- (void)setShortName:(id)a3
{
  id v5 = a3;
  id v10 = v5;
  if (v5)
  {
    BOOL v6 = [v5 length] == (id)1;
    id v5 = v10;
    if (!v6)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v9 handleFailureInMethod:a2 object:self file:@"CLIOptionParsing.m" lineNumber:224 description:@"A short name must be 1 character long"];

      id v5 = v10;
    }
  }

  v7 = (NSString *)[v5 copy];
  shortName = self->_shortName;
  self->_shortName = v7;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<Option '%@' argument-type %d descriptions:\nShort: %@\nLong: %@>",  self->_canonicalName,  self->_parameterCount,  self->_shortEnglishDescription,  self->_longEnglishDescription);
}

- (id)nameSummaryString
{
  if (self->_parameterCount == 1) {
    v3 = @" <argument>";
  }
  else {
    v3 = &stru_10001DAB8;
  }
  id result = v3;
  id v5 = result;
  shortName = self->_shortName;
  longName = self->_longName;
  if (shortName)
  {
    if (longName) {
      v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[-%@ | --%@]%@",  shortName,  self->_longName,  result);
    }
    else {
      v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"-%@%@",  self->_shortName,  result,  v10);
    }
    goto LABEL_10;
  }

  if (longName)
  {
    v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"--%@%@",  self->_longName,  result,  v10);
LABEL_10:
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    return v9;
  }

  __break(1u);
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_shortName, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = -[NSString copyWithZone:](self->_longName, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v5[4] = self->_parameterCount;
  id v10 = -[NSString copyWithZone:](self->_shortEnglishDescription, "copyWithZone:", a3);
  id v11 = (void *)v5[5];
  v5[5] = v10;

  id v12 = -[NSString copyWithZone:](self->_longEnglishDescription, "copyWithZone:", a3);
  id v13 = (void *)v5[6];
  v5[6] = v12;

  id v14 = -[NSString copyWithZone:](self->_canonicalName, "copyWithZone:", a3);
  v15 = (void *)v5[1];
  v5[1] = v14;

  return v5;
}

- (NSString)shortName
{
  return self->_shortName;
}

- (NSString)longName
{
  return self->_longName;
}

- (void)setLongName:(id)a3
{
}

- (unint64_t)parameterCount
{
  return self->_parameterCount;
}

- (void)setParameterCount:(unint64_t)a3
{
  self->_parameterCount = a3;
}

- (NSString)shortEnglishDescription
{
  return self->_shortEnglishDescription;
}

- (void)setShortEnglishDescription:(id)a3
{
}

- (NSString)longEnglishDescription
{
  return self->_longEnglishDescription;
}

- (void)setLongEnglishDescription:(id)a3
{
}

- (void).cxx_destruct
{
}

@end