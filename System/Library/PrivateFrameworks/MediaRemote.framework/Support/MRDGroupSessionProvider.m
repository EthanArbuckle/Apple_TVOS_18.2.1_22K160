@interface MRDGroupSessionProvider
+ (id)createRemoteControlSessionWithNearbyGroup:(id)a3 nearbyInvitation:(id)a4 identity:(id)a5;
+ (id)remoteControlSessionForExistingSessionWithNearbyGroup:(id)a3 identity:(id)a4 hostSigningKey:(id)a5 joinToken:(id)a6;
@end

@implementation MRDGroupSessionProvider

+ (id)createRemoteControlSessionWithNearbyGroup:(id)a3 nearbyInvitation:(id)a4 identity:(id)a5
{
  return +[MRDRemoteControlGroupSession hostedSessionWithNearbyGroup:nearbyInvitation:identity:]( &OBJC_CLASS___MRDRemoteControlGroupSession,  "hostedSessionWithNearbyGroup:nearbyInvitation:identity:",  a3,  a4,  a5);
}

+ (id)remoteControlSessionForExistingSessionWithNearbyGroup:(id)a3 identity:(id)a4 hostSigningKey:(id)a5 joinToken:(id)a6
{
  return +[MRDRemoteControlGroupSession remoteSessionWithNearbyGroup:identity:hostSigningKey:joinToken:]( &OBJC_CLASS___MRDRemoteControlGroupSession,  "remoteSessionWithNearbyGroup:identity:hostSigningKey:joinToken:",  a3,  a4,  a5,  a6);
}

@end