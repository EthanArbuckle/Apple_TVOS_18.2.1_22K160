@interface NSDirInfo
- (NSDirInfo)init;
- (NSDirInfo)initWithCapacity:(unint64_t)a3;
- (NSDirInfo)initWithContentsOfFile:(id)a3;
- (NSDirInfo)initWithDictionary:(id)a3;
- (NSDirInfo)initWithDictionary:(id)a3 copyItems:(BOOL)a4;
- (NSDirInfo)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5;
- (id)keyEnumerator;
- (id)objectForKey:(id)a3;
- (id)serializeToData;
- (unint64_t)count;
- (unint64_t)writePath:(id)a3 docInfo:(id)a4 errorHandler:(id)a5 remapContents:(BOOL)a6 hardLinkPath:(id)a7;
- (void)dealloc;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation NSDirInfo

- (NSDirInfo)init
{
  self->dict = (NSMutableDictionary *)[objc_allocWithZone(MEMORY[0x189603FC8]) init];
  return self;
}

- (NSDirInfo)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  self->dict = (NSMutableDictionary *)[objc_allocWithZone(MEMORY[0x189603FC8]) initWithObjects:a3 forKeys:a4 count:a5];
  return self;
}

- (NSDirInfo)initWithDictionary:(id)a3 copyItems:(BOOL)a4
{
  self->dict = (NSMutableDictionary *)[objc_allocWithZone(MEMORY[0x189603FC8]) initWithDictionary:a3 copyItems:a4];
  return self;
}

- (NSDirInfo)initWithDictionary:(id)a3
{
  self->dict = (NSMutableDictionary *)[objc_allocWithZone(MEMORY[0x189603FC8]) initWithDictionary:a3];
  return self;
}

- (NSDirInfo)initWithContentsOfFile:(id)a3
{
  self->dict = (NSMutableDictionary *)[objc_allocWithZone(MEMORY[0x189603FC8]) initWithContentsOfFile:a3];
  return self;
}

- (NSDirInfo)initWithCapacity:(unint64_t)a3
{
  self->dict = (NSMutableDictionary *)[objc_allocWithZone(MEMORY[0x189603FC8]) initWithCapacity:a3];
  return self;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSDirInfo;
  -[NSDirInfo dealloc](&v3, sel_dealloc);
}

- (unint64_t)count
{
  return -[NSMutableDictionary count](self->dict, "count");
}

- (id)objectForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->dict, "objectForKey:", a3);
}

- (id)keyEnumerator
{
  return (id)-[NSMutableDictionary keyEnumerator](self->dict, "keyEnumerator");
}

- (void)setObject:(id)a3 forKey:(id)a4
{
}

- (void)removeObjectForKey:(id)a3
{
}

- (unint64_t)writePath:(id)a3 docInfo:(id)a4 errorHandler:(id)a5 remapContents:(BOOL)a6 hardLinkPath:(id)a7
{
  return 0LL;
}

- (id)serializeToData
{
  uint64_t v3 = -[NSDirInfo zone](self, "zone");
  uint64_t v4 = -[NSAKSerializerStream init]( +[NSAKSerializerStream allocWithZone:](&OBJC_CLASS___NSAKSerializerStream, "allocWithZone:", v3),  "init");
  id v5 = -[NSAKSerializer initForSerializerStream:]( +[NSDirInfoSerializer allocWithZone:](&OBJC_CLASS___NSDirInfoSerializer, "allocWithZone:", v3),  "initForSerializerStream:",  v4);
  id v6 = -[NSPageData initFromSerializerStream:length:]( +[NSData allocWithZone:](NSPageData, "allocWithZone:", v3),  "initFromSerializerStream:length:",  v4,  [v5 serializePropertyList:self]);

  return v6;
}

@end