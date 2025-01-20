@interface IDSDMessageStoreMigrator
+ (id)sharedInstance;
- (IDSDMessageStoreMigrator)init;
- (void)_checkAndUpdateDBIfRequiredForClass:(unsigned int)a3;
- (void)migrateClassA;
- (void)migrateClassC;
- (void)migrateClassD;
@end

@implementation IDSDMessageStoreMigrator

+ (id)sharedInstance
{
  if (qword_1009C0860 != -1) {
    dispatch_once(&qword_1009C0860, &stru_1008FF490);
  }
  return (id)qword_1009C0868;
}

- (IDSDMessageStoreMigrator)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IDSDMessageStoreMigrator;
  v2 = -[IDSDMessageStoreMigrator init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[IDSDMessageStoreMigrator _checkAndUpdateDBIfRequiredForClass:](v2, "_checkAndUpdateDBIfRequiredForClass:", 2LL);
    -[IDSDMessageStoreMigrator _checkAndUpdateDBIfRequiredForClass:](v3, "_checkAndUpdateDBIfRequiredForClass:", 1LL);
    -[IDSDMessageStoreMigrator _checkAndUpdateDBIfRequiredForClass:](v3, "_checkAndUpdateDBIfRequiredForClass:", 0LL);
  }

  return v3;
}

- (void)migrateClassA
{
}

- (void)migrateClassC
{
}

- (void)migrateClassD
{
}

- (void)_checkAndUpdateDBIfRequiredForClass:(unsigned int)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDMessageStore sharedInstanceForDataProtectionClass:]( &OBJC_CLASS___IDSDMessageStore,  "sharedInstanceForDataProtectionClass:",  *(void *)&a3));
  int v4 = [v3 internalMigrationVersionOnDatabase];
  if (v4 == 100)
  {
    objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog liveMigration](&OBJC_CLASS___IMRGLog, "liveMigration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DB version up to date", buf, 2u);
    }

@end