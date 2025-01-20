@interface _ACCOOBBTPairingAccessoryInfo
- (NSData)accessoryMacAddress;
- (NSDictionary)accInfoDict;
- (NSString)accessoryUID;
- (_ACCOOBBTPairingAccessoryInfo)initWithUID:(id)a3 accInfoDict:(id)a4;
- (id)description;
- (void)dealloc;
- (void)setAccInfoDict:(id)a3;
- (void)setAccessoryMacAddress:(id)a3;
- (void)setAccessoryUID:(id)a3;
@end

@implementation _ACCOOBBTPairingAccessoryInfo

- (_ACCOOBBTPairingAccessoryInfo)initWithUID:(id)a3 accInfoDict:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS____ACCOOBBTPairingAccessoryInfo;
  v9 = -[_ACCOOBBTPairingAccessoryInfo init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessoryUID, a3);
    objc_storeStrong((id *)&v10->_accInfoDict, a4);
  }

  return v10;
}

- (void)dealloc
{
  accessoryUID = self->_accessoryUID;
  self->_accessoryUID = 0LL;

  accInfoDict = self->_accInfoDict;
  self->_accInfoDict = 0LL;

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____ACCOOBBTPairingAccessoryInfo;
  -[_ACCOOBBTPairingAccessoryInfo dealloc](&v5, "dealloc");
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<_ACCOOBBTPairingAccessoryInfo>[%@]",  self->_accessoryUID);
}

- (NSString)accessoryUID
{
  return self->_accessoryUID;
}

- (void)setAccessoryUID:(id)a3
{
}

- (NSDictionary)accInfoDict
{
  return self->_accInfoDict;
}

- (void)setAccInfoDict:(id)a3
{
}

- (NSData)accessoryMacAddress
{
  return self->_accessoryMacAddress;
}

- (void)setAccessoryMacAddress:(id)a3
{
}

- (void).cxx_destruct
{
}

@end