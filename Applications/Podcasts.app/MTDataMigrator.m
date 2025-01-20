@interface MTDataMigrator
+ (BOOL)requiresMigration;
- (MTDataMigrator)init;
@end

@implementation MTDataMigrator

+ (BOOL)requiresMigration
{
  if (qword_1002B4840 != -1) {
    swift_once(&qword_1002B4840, sub_10015FBD8);
  }
  v2 = off_1002B6260;
  swift_bridgeObjectRetain(off_1002B6260);
  char v4 = sub_10015FAB0(v3);
  swift_bridgeObjectRelease(v2);
  return v4 & 1;
}

- (MTDataMigrator)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[MTDataMigrator init](&v3, "init");
}

@end