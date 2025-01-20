@interface RSDRemoteNCMDevice
- (OS_nw_endpoint)endpoint;
- (RSDNCMInterface)interface;
- (const)local_address;
- (const)remote_address;
- (unsigned)interface_index;
- (void)connected;
- (void)setEndpoint:(id)a3;
- (void)setInterface:(id)a3;
@end

@implementation RSDRemoteNCMDevice

- (void)connected
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));
  v4 = (OS_nw_endpoint *)xpc_remote_connection_copy_remote_endpoint();
  endpoint = self->_endpoint;
  self->_endpoint = v4;

  if (!self->_endpoint)
  {
    id v6 = sub_10001E4D4();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10002B7F8();
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteDevice connection](self, "connection"));
    xpc_remote_connection_cancel(v8);
  }

- (unsigned)interface_index
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
  unsigned int v3 = [v2 index];

  return v3;
}

- (const)local_address
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
  if (objc_msgSend(v3, "is_private"))
  {
    if (-[RSDRemoteDevice type](self, "type") == 9)
    {

LABEL_6:
      if (!self->local_address_storage.__u6_addr32[0]
        && !self->local_address_storage.__u6_addr32[1]
        && !self->local_address_storage.__u6_addr32[2]
        && !self->local_address_storage.__u6_addr32[3])
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
        *(void *)self->local_address_storage.__u6_addr8 = sub_10001E914((uint64_t)objc_msgSend(v5, "mac_addr"));
        *(void *)&self->local_address_storage.__u6_addr32[2] = v6;
      }

      return &self->local_address_storage;
    }

    unsigned int v4 = -[RSDRemoteDevice type](self, "type");

    if (v4 == 12) {
      goto LABEL_6;
    }
  }

  else
  {
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
  int v8 = sub_100017DA8((const char *)[v7 name], self->local_address_storage.__u6_addr8, 1);

  if (v8)
  {
    id v9 = sub_10001E4D4();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10002B858();
    }
  }

  return &self->local_address_storage;
}

- (const)remote_address
{
  if (-[RSDRemoteDevice state](self, "state") == 2)
  {
    unsigned int v3 = (nw_endpoint *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice endpoint](self, "endpoint"));
    address = nw_endpoint_get_address(v3);

    if (address)
    {
      self->remote_address_storage = *(in6_addr *)&address->sa_data[6];
      return &self->remote_address_storage;
    }

    id v10 = sub_10001E4D4();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10002B93C();
    }
LABEL_14:

    return &self->remote_address_storage;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
  unsigned int v6 = objc_msgSend(v5, "is_private");

  if (!v6)
  {
    id v9 = sub_10001E4D4();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10002B99C();
    }
    goto LABEL_14;
  }

  if (!self->remote_address_storage.__u6_addr32[0]
    && !self->remote_address_storage.__u6_addr32[1]
    && !self->remote_address_storage.__u6_addr32[2]
    && !self->remote_address_storage.__u6_addr32[3])
  {
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](self, "interface"));
    *(void *)self->remote_address_storage.__u6_addr8 = sub_10001E914((uint64_t)-[os_log_s mac_addr](v7, "mac_addr"));
    *(void *)&self->remote_address_storage.__u6_addr32[2] = v8;
    goto LABEL_14;
  }

  return &self->remote_address_storage;
}

- (OS_nw_endpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (RSDNCMInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
}

- (void).cxx_destruct
{
}

@end