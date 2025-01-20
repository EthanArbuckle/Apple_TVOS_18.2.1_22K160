@interface CPLHelpCommand
+ (BOOL)ignoreInCPLStore;
+ (id)commandName;
+ (id)help;
+ (id)parameters;
+ (id)shortDescription;
- (BOOL)isStandaloneTool;
- (BOOL)parseCommandOptionsWithArgc:(int)a3 argv:(char *)a4;
- (NSString)helpCommandName;
- (int)execute;
- (void)_printUsageWithFirstLine:(id)a3 mainCommandName:(id)a4 secondLine:(id)a5;
- (void)executeWithCommandClass:(Class)a3 mainCommandName:(id)a4;
- (void)executeWithCommandClasses:(id)a3 mainCommandName:(id)a4;
- (void)setHelpCommandName:(id)a3;
- (void)setStandaloneTool:(BOOL)a3;
@end

@implementation CPLHelpCommand

+ (id)commandName
{
  return @"help";
}

+ (id)shortDescription
{
  return @"get some help.";
}

+ (id)parameters
{
  return @"[<command>]";
}

+ (id)help
{
  return @"[<command>]\tget help on a specific command.";
}

+ (BOOL)ignoreInCPLStore
{
  return 1;
}

- (BOOL)parseCommandOptionsWithArgc:(int)a3 argv:(char *)a4
{
  if (a3 == 1) {
    return 1;
  }
  if (a3 == 2)
  {
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a4[1]));
    helpCommandName = self->_helpCommandName;
    self->_helpCommandName = v5;
    BOOL v7 = 1;
  }

  else
  {
    id v8 = [(id)objc_opt_class(self) commandName];
    helpCommandName = (NSString *)objc_claimAutoreleasedReturnValue(v8);
    -[CPLCTLCommand printFormat:](self, "printFormat:", @"%@ can only take one argument", helpCommandName);
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_printUsageWithFirstLine:(id)a3 mainCommandName:(id)a4 secondLine:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(id)objc_opt_class(self) toolName];
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if (v8) {
    -[CPLCTLCommand printFormat:](self, "printFormat:", @"Usage: %@ %@ %@", v11, v8, v13);
  }
  else {
    -[CPLCTLCommand printFormat:](self, "printFormat:", @"Usage: %@ %@", v11, v13, v12);
  }

  if (v9) {
    -[CPLCTLCommand printFormat:](self, "printFormat:", @"\n%@", v9);
  }
}

- (void)executeWithCommandClass:(Class)a3 mainCommandName:(id)a4
{
  id v20 = a4;
  v6 = (NSString *)objc_claimAutoreleasedReturnValue(-[objc_class parameters](a3, "parameters"));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class shortDescription](a3, "shortDescription"));
  BOOL standaloneTool = self->_standaloneTool;
  id v9 = objc_alloc(&OBJC_CLASS___NSString);
  if (standaloneTool)
  {
    if (!v6)
    {
      id v10 = -[NSString initWithFormat:](v9, "initWithFormat:", @"\n\t%@", v7, v17, v19);
      goto LABEL_9;
    }

    helpCommandName = v6;
    v18 = v7;
  }

  else
  {
    if (v6)
    {
      id v10 = -[NSString initWithFormat:](v9, "initWithFormat:", @"%@ %@\n\t%@", self->_helpCommandName, v6, v7);
      goto LABEL_9;
    }

    helpCommandName = self->_helpCommandName;
    v18 = v7;
  }

  id v10 = -[NSString initWithFormat:](v9, "initWithFormat:", @"%@\n\t%@", helpCommandName, v18, v19);
LABEL_9:
  v11 = v10;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class help](a3, "help"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 componentsSeparatedByString:@"\n"]);

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 componentsJoinedByString:@"\n\t"]);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"\t%@", v14));
  }

  else
  {
    v15 = 0LL;
  }

  -[CPLHelpCommand _printUsageWithFirstLine:mainCommandName:secondLine:]( self,  "_printUsageWithFirstLine:mainCommandName:secondLine:",  v11,  v20,  v15);
}

- (void)executeWithCommandClasses:(id)a3 mainCommandName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = @"<subcommand> [subcommand-options and arguments]";
  id v32 = v6;
  if (!v6) {
    BOOL v7 = @"<command> [command-options and arguments]";
  }
  v30 = v7;
  v34 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id obj = v5;
  id v8 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
        id v13 = objc_alloc(&OBJC_CLASS___NSString);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v12 commandName]);
        uint64_t v15 = objc_claimAutoreleasedReturnValue([v12 parameters]);
        v16 = (void *)v15;
        if (v15) {
          uint64_t v17 = (const __CFString *)v15;
        }
        else {
          uint64_t v17 = &stru_1000319D0;
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue([v12 shortDescription]);
        uint64_t v19 = -[NSString initWithFormat:](v13, "initWithFormat:", @"\t%@ %@\n\t\t%@", v14, v17, v18);

        -[NSMutableArray addObject:](v34, "addObject:", v19);
      }

      id v9 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }

    while (v9);
  }

  id v20 = objc_alloc(&OBJC_CLASS___NSString);
  if (v32) {
    v21 = "subcommands";
  }
  else {
    v21 = "commands";
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v34, "componentsJoinedByString:", @"\n"));
  v23 = -[NSString initWithFormat:](v20, "initWithFormat:", @"Available %s:\n%@", v21, v22);

  -[CPLHelpCommand _printUsageWithFirstLine:mainCommandName:secondLine:]( self,  "_printUsageWithFirstLine:mainCommandName:secondLine:",  v30,  v32,  v23);
  id v24 = [(id)objc_opt_class(self) toolName];
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  id v26 = [(id)objc_opt_class(self) commandName];
  uint64_t v27 = objc_claimAutoreleasedReturnValue(v26);
  v28 = (void *)v27;
  if (v32) {
    -[CPLCTLCommand printFormat:]( self,  "printFormat:",  @"\nTry %@ %@ %@ <subcommand> to get help on a specific subcommand.",  v25,  v32,  v27);
  }
  else {
    -[CPLCTLCommand printFormat:]( self,  "printFormat:",  @"\nTry %@ %@ <command> to get help on a specific command.",  v25,  v27,  v29);
  }
}

- (int)execute
{
  helpCommandName = self->_helpCommandName;
  v4 = (void *)objc_opt_class(self);
  if (!helpCommandName)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 allCommandNames]);
    BOOL v7 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v6 count]);
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0LL;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          -[NSMutableArray addObject:]( v7,  "addObject:",  [(id)objc_opt_class(self) commandClassWithName:*(void *)(*((void *)&v15 + 1) + 8 * (void)v12)]);
          uint64_t v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v10);
    }

    -[CPLHelpCommand executeWithCommandClasses:mainCommandName:]( self,  "executeWithCommandClasses:mainCommandName:",  v7,  0LL);
    return 0;
  }

  id v5 = [v4 commandClassWithName:self->_helpCommandName];
  if (v5)
  {
    -[CPLHelpCommand executeWithCommandClass:mainCommandName:]( self,  "executeWithCommandClass:mainCommandName:",  v5,  0LL);
    return 0;
  }

  -[CPLCTLCommand printFormat:](self, "printFormat:", @"Unknown command '%@'", self->_helpCommandName);
  v14 = self->_helpCommandName;
  self->_helpCommandName = 0LL;

  -[CPLHelpCommand execute](self, "execute");
  return 1;
}

- (NSString)helpCommandName
{
  return self->_helpCommandName;
}

- (void)setHelpCommandName:(id)a3
{
}

- (BOOL)isStandaloneTool
{
  return self->_standaloneTool;
}

- (void)setStandaloneTool:(BOOL)a3
{
  self->_BOOL standaloneTool = a3;
}

- (void).cxx_destruct
{
}

@end