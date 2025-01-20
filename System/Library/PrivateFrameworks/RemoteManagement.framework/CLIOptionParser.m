@interface CLIOptionParser
+ (CLIOptionParser)optionParserWithArguments:(id)a3 forCommand:(id)a4;
- (BOOL)enumerateOptionsWithBlock:(id)a3;
- (BOOL)preserveMultipleArguments;
- (CLICommand)command;
- (NSArray)arguments;
- (NSString)commandName;
- (id)dictionaryWithOptionsAndValues;
- (id)nextArgument;
- (void)finishArguments;
- (void)setArguments:(id)a3;
- (void)setCommand:(id)a3;
- (void)setCommandName:(id)a3;
- (void)setPreserveMultipleArguments:(BOOL)a3;
- (void)validateArguments;
@end

@implementation CLIOptionParser

+ (CLIOptionParser)optionParserWithArguments:(id)a3 forCommand:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = sub_10000FF64((id *)objc_alloc(&OBJC_CLASS___CLIOptionParser), v6, v5);

  return (CLIOptionParser *)v7;
}

- (BOOL)enumerateOptionsWithBlock:(id)a3
{
  id v5 = (void (**)(id, void *, void *, void *))a3;
  if (self->_optind >= 2)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v17 handleFailureInMethod:a2 object:self file:@"CLIOptionParsing.m" lineNumber:442 description:@"enumerateOptionsWithBlock: must be not be called after nextArgument"];
  }

  while (1)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CLIOptionParser nextArgument](self, "nextArgument"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 substringFromIndex:2]);
    v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_optionSet->_longAliasToOptionDict,  "objectForKeyedSubscript:",  v7));
    id v9 = [v8 parameterCount];
    if (!v8)
    {
LABEL_19:
      sub_1000100E0(self, v6);
LABEL_20:
      sub_10001012C(self, v6);
      sub_1000103D8(v18, v19);
      return result;
    }

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CLIOptionParser nextArgument](self, "nextArgument"));
      if (!v10) {
        goto LABEL_20;
      }
    }

    else
    {
      v10 = 0LL;
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue([v8 shortName]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v8 longName]);
    v5[2](v5, v14, v15, v10);

LABEL_14:
  }

  if ([v6 hasPrefix:@"-"])
  {
    v11 = (char *)[v6 length];
    v12 = v11 - 1;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000103D8;
    v20[3] = &unk_10001C7C8;
    v20[4] = self;
    id v13 = v6;
    id v21 = v13;
    v22 = v5;
    objc_msgSend(v13, "enumerateSubstringsInRange:options:usingBlock:", 1, v12, 2, v20);

    goto LABEL_14;
  }

- (id)dictionaryWithOptionsAndValues
{
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472LL;
  v8 = sub_100010548;
  id v9 = &unk_10001C7F0;
  v10 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v11 = self;
  v3 = v10;
  -[CLIOptionParser enumerateOptionsWithBlock:](self, "enumerateOptionsWithBlock:", &v6);
  id v4 = -[NSMutableDictionary copy](v3, "copy", v6, v7, v8, v9);

  return v4;
}

- (id)nextArgument
{
  unint64_t optind = self->_optind;
  if (optind >= -[NSArray count](self->_arguments, "count"))
  {
    id v5 = 0LL;
  }

  else
  {
    ++qword_100025440;
    arguments = self->_arguments;
    ++self->_optind;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](arguments, "objectAtIndex:"));
  }

  return v5;
}

- (void)finishArguments
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CLIOptionParser nextArgument](self, "nextArgument"));
  if (v3)
  {
    sub_1000100E0(self, v3);
    -[CLIOptionParser validateArguments](v4, v5);
  }

- (void)validateArguments
{
  uint64_t v3 = qword_100025440;
  -[CLIOptionParser enumerateOptionsWithBlock:](self, "enumerateOptionsWithBlock:", &stru_10001C830);
  qword_100025440 = v3;
  self->_unint64_t optind = 1LL;
}

- (NSString)commandName
{
  return self->_commandName;
}

- (void)setCommandName:(id)a3
{
}

- (CLICommand)command
{
  return self->_command;
}

- (void)setCommand:(id)a3
{
}

- (BOOL)preserveMultipleArguments
{
  return self->_preserveMultipleArguments;
}

- (void)setPreserveMultipleArguments:(BOOL)a3
{
  self->_preserveMultipleArguments = a3;
}

- (NSArray)arguments
{
  return self->_arguments;
}

- (void)setArguments:(id)a3
{
}

- (void).cxx_destruct
{
}

@end