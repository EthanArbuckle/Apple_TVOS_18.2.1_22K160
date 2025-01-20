@interface CUHomeKitFindPairedPeerContext
- (BOOL)triedAccessory;
- (BOOL)triedHAP;
- (BOOL)triedHomeRepairFlow;
- (CUPairedPeer)pairedPeer;
- (NSArray)users;
- (NSString)identifier;
- (id)completion;
- (unint64_t)options;
- (unint64_t)startTicks;
- (unint64_t)userCount;
- (unint64_t)userIndex;
- (void)setCompletion:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setPairedPeer:(id)a3;
- (void)setStartTicks:(unint64_t)a3;
- (void)setTriedAccessory:(BOOL)a3;
- (void)setTriedHAP:(BOOL)a3;
- (void)setTriedHomeRepairFlow:(BOOL)a3;
- (void)setUserCount:(unint64_t)a3;
- (void)setUserIndex:(unint64_t)a3;
- (void)setUsers:(id)a3;
@end

@implementation CUHomeKitFindPairedPeerContext

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (CUPairedPeer)pairedPeer
{
  return self->_pairedPeer;
}

- (void)setPairedPeer:(id)a3
{
}

- (BOOL)triedAccessory
{
  return self->_triedAccessory;
}

- (void)setTriedAccessory:(BOOL)a3
{
  self->_triedAccessory = a3;
}

- (BOOL)triedHAP
{
  return self->_triedHAP;
}

- (void)setTriedHAP:(BOOL)a3
{
  self->_triedHAP = a3;
}

- (BOOL)triedHomeRepairFlow
{
  return self->_triedHomeRepairFlow;
}

- (void)setTriedHomeRepairFlow:(BOOL)a3
{
  self->_triedHomeRepairFlow = a3;
}

- (unint64_t)startTicks
{
  return self->_startTicks;
}

- (void)setStartTicks:(unint64_t)a3
{
  self->_startTicks = a3;
}

- (NSArray)users
{
  return self->_users;
}

- (void)setUsers:(id)a3
{
}

- (unint64_t)userIndex
{
  return self->_userIndex;
}

- (void)setUserIndex:(unint64_t)a3
{
  self->_userIndex = a3;
}

- (unint64_t)userCount
{
  return self->_userCount;
}

- (void)setUserCount:(unint64_t)a3
{
  self->_userCount = a3;
}

- (void).cxx_destruct
{
}

@end