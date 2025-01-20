@interface CLICommand
+ (BOOL)enabled;
+ (NSArray)registeredCommandNames;
+ (id)registeredCommandWithName:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)runWithOptions:(id)a3;
- (BOOL)startRunLoop;
- (NSArray)aliases;
- (NSArray)options;
- (NSString)longEnglishDescription;
- (NSString)name;
- (NSString)shortEnglishDescription;
- (NSString)usageLine;
- (id)description;
- (id)executionBlock;
- (id)nameSummaryString;
- (unint64_t)hash;
- (void)endRunLoopWithSuccess:(BOOL)a3;
- (void)register;
- (void)setAliases:(id)a3;
- (void)setExecutionBlock:(id)a3;
- (void)setLongEnglishDescription:(id)a3;
- (void)setName:(id)a3;
- (void)setOptions:(id)a3;
- (void)setShortEnglishDescription:(id)a3;
- (void)setUsageLine:(id)a3;
@end

@implementation CLICommand

+ (BOOL)enabled
{
  return 1;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CLICommand name](self, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CLICommand aliases](self, "aliases"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CLICommand options](self, "options"));
  id v6 = [v5 count];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CLICommand shortEnglishDescription](self, "shortEnglishDescription"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CLICommand longEnglishDescription](self, "longEnglishDescription"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CLICommand usageLine](self, "usageLine"));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<Command '%@'>\nAliases: %@\n# Options: %lu\nDescriptions:\nShort: %@\nLong: %@\nUsage: %@>",  v3,  v4,  v6,  v7,  v8,  v9));

  return v10;
}

- (BOOL)runWithOptions:(id)a3
{
  id v5 = a3;
  executionBlock = (uint64_t (**)(id, id))self->_executionBlock;
  if (!executionBlock)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v9 handleFailureInMethod:a2 object:self file:@"CLICommand.m" lineNumber:47 description:@"Nothing to execute"];

    executionBlock = (uint64_t (**)(id, id))self->_executionBlock;
  }

  char v7 = executionBlock[2](executionBlock, v5);

  return v7;
}

- (NSString)name
{
  name = self->_name;
  if (!name)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v6 handleFailureInMethod:a2 object:self file:@"CLICommand.m" lineNumber:53 description:@"Commands must have a name"];

    name = self->_name;
  }

  return name;
}

- (id)nameSummaryString
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CLICommand name](self, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v3));

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CLICommand aliases](self, "aliases"));
  if (v5) {
    [v4 addObjectsFromArray:v5];
  }
  [v4 sortUsingSelector:"compare:"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 componentsJoinedByString:@" | "]);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___CLICommand);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    char v7 = (void *)objc_claimAutoreleasedReturnValue(-[CLICommand name](self, "name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);

    unsigned __int8 v9 = [v7 isEqualToString:v8];
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CLICommand name](self, "name"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)startRunLoop
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CLIProgram sharedProgram](&OBJC_CLASS___CLIProgram, "sharedProgram"));
  unsigned __int8 v3 = [v2 startRunLoop];

  return v3;
}

- (void)endRunLoopWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[CLIProgram sharedProgram](&OBJC_CLASS___CLIProgram, "sharedProgram"));
  [v4 endRunLoopWithSuccess:v3];
}

- (void)setName:(id)a3
{
}

- (NSArray)aliases
{
  return self->_aliases;
}

- (void)setAliases:(id)a3
{
}

- (NSArray)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
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

- (NSString)usageLine
{
  return self->_usageLine;
}

- (void)setUsageLine:(id)a3
{
}

- (id)executionBlock
{
  return self->_executionBlock;
}

- (void)setExecutionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (NSArray)registeredCommandNames
{
  return (NSArray *)[(id)qword_1000253F8 allKeys];
}

+ (id)registeredCommandWithName:(id)a3
{
  return [(id)qword_1000253F8 objectForKeyedSubscript:a3];
}

- (void)register
{
  if (qword_100025418 != -1) {
    dispatch_once(&qword_100025418, &stru_10001C850);
  }
  if ([(id)qword_100025410 containsObject:self])
  {
    uint64_t v4 = objc_opt_class(self);
    id v16 = (id)objc_claimAutoreleasedReturnValue(-[CLICommand name](self, "name"));
    NSLog( @"Command %@ (%@) was already registered. Most likely the 'enabled' class property was YES and the command was also manually registered.",  v4,  v16);
  }

  else
  {
    [(id)qword_100025410 addObject:self];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CLICommand options](self, "options"));
    if (v5)
    {
      id v6 = (void *)qword_100025400;
      char v7 = -[CLIOptionSet initWithOptions:](objc_alloc(&OBJC_CLASS___CLIOptionSet), "initWithOptions:", v5);
      [v6 setObject:v7 forKey:self];
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CLICommand name](self, "name"));
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1000253F8 objectForKeyedSubscript:v8]);

    if (v9)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v15 handleFailureInMethod:a2, self, @"CLIOptionParsing.m", 356, @"Long option '--%@' is duplicated", v8 object file lineNumber description];
    }

    [(id)qword_1000253F8 setObject:self forKeyedSubscript:v8];
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CLICommand aliases](self, "aliases"));
    id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          [(id)qword_1000253F8 setObject:self forKeyedSubscript:*(void *)(*((void *)&v17 + 1) + 8 * (void)i)];
        }

        id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }

      while (v12);
    }
  }

@end