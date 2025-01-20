@interface CoreTelephonyClient
- (id)_getSystemConfiguration:(id)a3 withError:(id *)a4;
- (id)_retrieveMessage:(id)a3 withMessageID:(id)a4 withError:(id *)a5;
@end

@implementation CoreTelephonyClient

- (id)_getSystemConfiguration:(id)a3 withError:(id *)a4
{
  return -[CoreTelephonyClient getSystemConfiguration:withError:](self, "getSystemConfiguration:withError:", a3, a4);
}

- (id)_retrieveMessage:(id)a3 withMessageID:(id)a4 withError:(id *)a5
{
  return -[CoreTelephonyClient retrieveMessage:withMessageID:withError:]( self,  "retrieveMessage:withMessageID:withError:",  a3,  a4,  a5);
}

@end