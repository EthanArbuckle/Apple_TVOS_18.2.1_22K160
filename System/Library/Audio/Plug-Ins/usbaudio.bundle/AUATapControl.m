@interface AUATapControl
- (BOOL)changeValue:(BOOL)a3;
- (_TtC9AUASDCore13AUATapControl)initWithValue:(BOOL)a3 isSettable:(BOOL)a4 forElement:(unsigned int)a5 inScope:(unsigned int)a6 withPlugin:(id)a7 andObjectClassID:(unsigned int)a8;
@end

@implementation AUATapControl

- (BOOL)changeValue:(BOOL)a3
{
  v4 = self;
  sub_10008CD88(a3);

  return 1;
}

- (_TtC9AUASDCore13AUATapControl)initWithValue:(BOOL)a3 isSettable:(BOOL)a4 forElement:(unsigned int)a5 inScope:(unsigned int)a6 withPlugin:(id)a7 andObjectClassID:(unsigned int)a8
{
  id v8 = a7;
  result = (_TtC9AUASDCore13AUATapControl *)_swift_stdlib_reportUnimplementedInitializer( "AUASDCore.AUATapControl",  23LL,  "init(value:isSettable:forElement:inScope:with:andObjectClassID:)",  64LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end