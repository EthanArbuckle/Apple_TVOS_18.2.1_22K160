@interface EscrowRecordMO
- (EscrowRecordMO)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
@end

@implementation EscrowRecordMO

- (EscrowRecordMO)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for EscrowRecordMO();
  return -[EscrowRecordMO initWithEntity:insertIntoManagedObjectContext:]( &v7,  "initWithEntity:insertIntoManagedObjectContext:",  a3,  a4);
}

@end