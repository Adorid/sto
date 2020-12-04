pragma solidity ^0.4.0;

contract StorjRegistry {
  event NewStorj(uint id, address owner, string displayName, string imageUrl);
  event UpdatedStorj(uint id, address owner, string displayName, string imageUrl);

  struct Storj {
    address owner;
    string displayName;
    string imageUrl;
  }

  Storj[] public storjs;

  mapping (uint => address) public storjToOwner;
  mapping (address => uint) public ownerToStorj;

  function createStorj(string _displayName, string _imageUrl) public {
    require(ownerToStorj[msg.sender] == 0);
    uint id = storjs.push(Storj(msg.sender, _displayName, _imageUrl)) - 1;

    storjToOwner[id] = msg.sender;
    ownerToStorj[msg.sender] = id;

    emit NewStorj(id, msg.sender, _displayName, _imageUrl);
  }

  function getStorj(address owner) public view returns (string, string) {
    uint id = ownerToStorj[owner];
    return (storjs[id].displayName, storjs[id].imageUrl);
  }

  function updateStorjName(string _displayName) public {
    require(ownerToStorj[msg.sender] != 0);
    require(msg.sender == storjs[ownerToStorj[msg.sender]].owner);

    uint id = ownerToStorj[msg.sender];

    storjs[id].displayName = _displayName;
    emit UpdatedStorj(id, msg.sender, _displayName, storjs[id].imageUrl);
  }

  function updateStorjImage(string _imageUrl) public {
    require(ownerToStorj[msg.sender] != 0);
    require(msg.sender == storjs[ownerToStorj[msg.sender]].owner);

    uint id = ownerToStorj[msg.sender];

    storjs[id].imageUrl =  _imageUrl;
    emit UpdatedStorj(id, msg.sender, storjs[id].displayName, _imageUrl);
  }

  // the gravatar at position 0 of gravatars[]
  // is fake
  // it's a mythical gravatar
  // that doesn't really exist
  // dani will invoke this function once when this contract is deployed
  // but then no more
  function setMythicalStorj() public {
    require(msg.sender == 0xb64ef51c888972c908cfacf59b47c1afbc0ab8ac);
    storjs.push(Storj(0x0, " ", " "));
  }
}
