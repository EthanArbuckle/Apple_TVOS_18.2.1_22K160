@interface CSDKeychainPasswordItem
+ (NSString)accessGroupName;
+ (NSString)serviceName;
- (BOOL)saveData:(id)a3 error:(id *)a4;
- (BOOL)savePassword:(id)a3 error:(id *)a4;
- (CSDKeychainPasswordItem)init;
- (CSDKeychainPasswordItem)initWithService:(id)a3 account:(id)a4 accessGroup:(id)a5;
- (NSString)account;
- (NSString)description;
- (id)readDataAndReturnError:(id *)a3;
- (id)readPasswordAndReturnError:(id *)a3;
- (void)setAccount:(id)a3;
@end

@implementation CSDKeychainPasswordItem

+ (NSString)accessGroupName
{
  return (NSString *)sub_1002AB928(&qword_100446998, (id *)&qword_1004543C0);
}

+ (NSString)serviceName
{
  return (NSString *)sub_1002AB928(&qword_1004469A0, (id *)&qword_1004543C8);
}

- (NSString)account
{
  uint64_t v3 = v2;
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (void)setAccount:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  v7 = self;
  sub_1002ABA58(v4, v6);
}

- (CSDKeychainPasswordItem)initWithService:(id)a3 account:(id)a4 accessGroup:(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v9 = v8;
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v12 = v11;
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  return (CSDKeychainPasswordItem *)sub_1002ABA74(v7, v9, v10, v12, v13, v14);
}

- (id)readPasswordAndReturnError:(id *)a3
{
  uint64_t v3 = self;
  sub_1002ABB88();
  uint64_t v5 = v4;

  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

- (BOOL)savePassword:(id)a3 error:(id *)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v7 = v6;
  uint64_t v8 = self;
  sub_1002ABEC4(v5, v7);
  swift_bridgeObjectRelease(v7);

  return 1;
}

- (id)readDataAndReturnError:(id *)a3
{
  uint64_t v3 = self;
  uint64_t v4 = sub_1002ABC6C();
  unint64_t v6 = v5;

  Class isa = Data._bridgeToObjectiveC()().super.isa;
  sub_1001BB39C(v4, v6);
  return isa;
}

- (BOOL)saveData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v10 = v9;

  sub_1002ABF9C(v8, v10);
  sub_1001BB39C(v8, v10);
  return 1;
}

- (NSString)description
{
  uint64_t v2 = self;
  sub_1002AC5E4();
  uint64_t v4 = v3;

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (CSDKeychainPasswordItem)init
{
}

- (void).cxx_destruct
{
}

@end