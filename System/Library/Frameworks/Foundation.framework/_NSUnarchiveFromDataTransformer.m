@interface _NSUnarchiveFromDataTransformer
- (_NSUnarchiveFromDataTransformer)init;
- (id)description;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation _NSUnarchiveFromDataTransformer

- (_NSUnarchiveFromDataTransformer)init
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  +[NSValueTransformer _warnAboutInscureArchiverCitingOffender:]((uint64_t)&OBJC_CLASS___NSValueTransformer, (uint64_t)v4);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____NSUnarchiveFromDataTransformer;
  return -[NSValueTransformer init](&v6, sel_init);
}

- (id)transformedValue:(id)a3
{
  if (a3) {
    return +[NSUnarchiver unarchiveObjectWithData:](&OBJC_CLASS___NSUnarchiver, "unarchiveObjectWithData:");
  }
  else {
    return 0LL;
  }
}

- (id)reverseTransformedValue:(id)a3
{
  return +[NSArchiver archivedDataWithRootObject:](&OBJC_CLASS___NSArchiver, "archivedDataWithRootObject:", a3);
}

- (id)description
{
  return @"<shared NSUnarchiveFromData transformer>";
}

@end