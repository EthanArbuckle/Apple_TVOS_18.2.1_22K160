@interface TVNPGroupedRoute
+ (id)_titleForGroupWithMembers:(id)a3 leader:(id)a4;
- (NSArray)members;
- (TVNPGroupedRoute)init;
- (TVNPOutputDeviceRoute)leader;
- (id)_imageForGroupWithMembers:(id)a3 leader:(id)a4;
- (id)deviceImage;
- (void)updateWithGroupLeader:(id)a3 members:(id)a4;
@end

@implementation TVNPGroupedRoute

- (TVNPGroupedRoute)init
{
  SEL v5 = a2;
  id v6 = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVNPGroupedRoute;
  id v6 = -[TVNPRoute _init](&v4, "_init");
  objc_storeStrong(&v6, v6);
  v3 = (TVNPGroupedRoute *)v6;
  objc_storeStrong(&v6, 0LL);
  return v3;
}

- (void)updateWithGroupLeader:(id)a3 members:(id)a4
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v15 = 0LL;
  objc_storeStrong(&v15, a4);
  -[TVNPGroupedRoute willChangeValueForKey:](v17, "willChangeValueForKey:");
  -[TVNPGroupedRoute willChangeValueForKey:](v17, "willChangeValueForKey:");
  -[TVNPGroupedRoute willChangeValueForKey:](v17, "willChangeValueForKey:");
  -[TVNPGroupedRoute willChangeValueForKey:](v17, "willChangeValueForKey:");
  -[TVNPGroupedRoute willChangeValueForKey:](v17, "willChangeValueForKey:");
  -[TVNPGroupedRoute willChangeValueForKey:](v17, "willChangeValueForKey:");
  -[TVNPGroupedRoute willChangeValueForKey:](v17, "willChangeValueForKey:", @"leader");
  -[TVNPGroupedRoute willChangeValueForKey:](v17, "willChangeValueForKey:", @"members");
  -[TVNPGroupedRoute willChangeValueForKey:](v17, "willChangeValueForKey:");
  objc_super v4 = (void *)objc_opt_class(v17);
  SEL v5 = (NSString *)[v4 _titleForGroupWithMembers:v15 leader:location[0]];
  title = v17->super._title;
  v17->super._title = v5;

  v17->super._canBeGrouped = 1;
  id v7 = [location[0] selectionState];
  v17->super._selectionState = (unint64_t)v7;
  v8 = (TVNPRoutingDestination *)[location[0] destination];
  destination = v17->super._destination;
  v17->super._destination = v8;

  v10 = (NSString *)[location[0] routeUID];
  routeUID = v17->super._routeUID;
  v17->super._routeUID = v10;

  v12 = (NSString *)[location[0] groupUID];
  groupUID = v17->super._groupUID;
  v17->super._groupUID = v12;

  v17->super._available = 1;
  objc_storeStrong((id *)&v17->_leader, location[0]);
  objc_storeStrong((id *)&v17->_members, v15);
  -[TVNPGroupedRoute didChangeValueForKey:](v17, "didChangeValueForKey:", @"title");
  -[TVNPGroupedRoute didChangeValueForKey:](v17, "didChangeValueForKey:", @"canBeGrouped");
  -[TVNPGroupedRoute didChangeValueForKey:](v17, "didChangeValueForKey:", @"selectionState");
  -[TVNPGroupedRoute didChangeValueForKey:](v17, "didChangeValueForKey:", @"destination");
  -[TVNPGroupedRoute didChangeValueForKey:](v17, "didChangeValueForKey:", @"routeUID");
  -[TVNPGroupedRoute didChangeValueForKey:](v17, "didChangeValueForKey:", @"groupUID");
  -[TVNPGroupedRoute didChangeValueForKey:](v17, "didChangeValueForKey:", @"available");
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)deviceImage
{
  if (!self->super._deviceImage)
  {
    id v6 = -[TVNPGroupedRoute members](self, "members");
    SEL v5 = -[TVNPGroupedRoute leader](self, "leader");
    v2 = (UIImage *) -[TVNPGroupedRoute _imageForGroupWithMembers:leader:]( self,  "_imageForGroupWithMembers:leader:",  v6);
    deviceImage = self->super._deviceImage;
    self->super._deviceImage = v2;
  }

  return self->super._deviceImage;
}

+ (id)_titleForGroupWithMembers:(id)a3 leader:(id)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v20 = 0LL;
  objc_storeStrong(&v20, a4);
  v19 =  +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  (char *)[location[0] count] + 1);
  id v14 = [v20 title];
  -[NSMutableArray addObject:](v19, "addObject:");

  memset(__b, 0, sizeof(__b));
  id v15 = location[0];
  id v16 = [v15 countByEnumeratingWithState:__b objects:v22 count:16];
  if (v16)
  {
    uint64_t v10 = *(void *)__b[2];
    uint64_t v11 = 0LL;
    id v12 = v16;
    while (1)
    {
      uint64_t v9 = v11;
      if (*(void *)__b[2] != v10) {
        objc_enumerationMutation(v15);
      }
      id v18 = *(id *)(__b[1] + 8 * v11);
      id v8 = [v18 title];

      if (v8)
      {
        id v6 = v19;
        id v7 = [v18 title];
        -[NSMutableArray addObject:](v6, "addObject:");
      }

      ++v11;
      if (v9 + 1 >= (unint64_t)v12)
      {
        uint64_t v11 = 0LL;
        id v12 = [v15 countByEnumeratingWithState:__b objects:v22 count:16];
        if (!v12) {
          break;
        }
      }
    }
  }

  id v5 = -[NSMutableArray componentsJoinedByString:](v19, "componentsJoinedByString:", @" + ");
  objc_storeStrong((id *)&v19, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(location, 0LL);
  return v5;
}

- (id)_imageForGroupWithMembers:(id)a3 leader:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v20 = 0LL;
  objc_storeStrong(&v20, a4);
  v19 =  +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  (char *)[location[0] count] + 1);
  id v14 = [v20 outputDeviceRoute];
  -[NSMutableArray addObject:](v19, "addObject:");

  memset(__b, 0, sizeof(__b));
  id v15 = location[0];
  id v16 = [v15 countByEnumeratingWithState:__b objects:v22 count:16];
  if (v16)
  {
    uint64_t v10 = *(void *)__b[2];
    uint64_t v11 = 0LL;
    id v12 = v16;
    while (1)
    {
      uint64_t v9 = v11;
      if (*(void *)__b[2] != v10) {
        objc_enumerationMutation(v15);
      }
      id v18 = *(id *)(__b[1] + 8 * v11);
      id v8 = [v18 outputDeviceRoute];

      if (v8)
      {
        id v6 = v19;
        id v7 = [v18 outputDeviceRoute];
        -[NSMutableArray addObject:](v6, "addObject:");
      }

      ++v11;
      if (v9 + 1 >= (unint64_t)v12)
      {
        uint64_t v11 = 0LL;
        id v12 = [v15 countByEnumeratingWithState:__b objects:v22 count:16];
        if (!v12) {
          break;
        }
      }
    }
  }

  id v5 =  +[MPAVRoutingController _symbolImageForRoutes:]( &OBJC_CLASS___MPAVRoutingController,  "_symbolImageForRoutes:",  v19);
  objc_storeStrong((id *)&v19, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(location, 0LL);
  return v5;
}

- (TVNPOutputDeviceRoute)leader
{
  return self->_leader;
}

- (NSArray)members
{
  return self->_members;
}

- (void).cxx_destruct
{
}

@end