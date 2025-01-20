@interface IDSFirewallDatabase
- (IDSFirewallDatabase)init;
- (IDSFirewallDatabase)initWithFilename:(id)a3;
- (NSString)filename;
- (void)deleteDatabase;
- (void)setFilename:(id)a3;
@end

@implementation IDSFirewallDatabase

- (IDSFirewallDatabase)init
{
  return -[IDSFirewallDatabase initWithFilename:](self, "initWithFilename:", 0LL);
}

- (IDSFirewallDatabase)initWithFilename:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IDSFirewallDatabase;
  v5 = -[IDSFirewallDatabase init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[IDSFirewallDatabase setFilename:](v5, "setFilename:", v4);
  }

  return v6;
}

- (void)deleteDatabase
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSFirewallDatabase filename](self, "filename"));

  if (v3)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[IDSFirewallDatabase filename](self, "filename"));
    CSDBSqliteDeleteDatabase();
  }

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
}

- (void).cxx_destruct
{
}

@end